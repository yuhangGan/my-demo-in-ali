import React, { useState, useEffect } from "react";
import { connect, history } from "umi";
import { Button, Spin } from "antd";
import "./style.css";

const nameSpace = "listModel";
const mapStateToProps = ({ loading, [nameSpace]: listState }) => {
  return {
    listState,
    loading,
  };
};

const mapDispatchToProps = (dispatch) => {
  return {
    dispatchDestroy: (id) => {
      dispatch({ type: `${nameSpace}/dispatchDestroy`, payload: { id } });
      history.goBack();
    },
    //更新一条item
    dispatchUpdate: (id, data, updateType) => {
      dispatch({
        type: `${nameSpace}/dispatchUpdate`,
        payload: { id, data, updateType },
      });
    },
  };
};

function Detail(props) {
  const { loading } = props;
  const { query } = props.location;

  // console.log(query, typeof query.id)
  const item = props.listState.list.get(parseInt(query.id)) || {
    content: "",
    isDone: false,
    listItem: "",
    id: 0,
  };

  const [content, setContent] = useState("");

  const showSpinner =
    loading.effects[`${nameSpace}/dispatchDestroy`] ||
    loading.effects[`${nameSpace}/dispatchFetch`] ||
    loading.effects[`${nameSpace}/dispatchUpdate`];

  const back = () => {
    history.goBack();
  };

  return (
    <div className="detail">
      <Spin spinning={!!showSpinner}>
        <header>
          <img src={require("../../assets/back.png")} onClick={back} />
          <img
            src={
              item.isDone
                ? require("../../assets/finished.png")
                : require("../../assets/unfinished.png")
            }
            title={item.isDone ? "设置为未完成" : "设置为已完成"}
            onClick={() =>
              props.dispatchUpdate(item.id, !item.isDone, "isDone")
            }
          />
          <img src={require("../../assets/delete.png")} onClick={() => props.dispatchDestroy(item.id)}/>
        </header>
        <div className="line"></div>
        <h1>{item.listItem}</h1>
        <h2>id:{item.id}</h2>
        <h3>备注：</h3>
        <textarea
          placeholder="在此输入内容..."
          onChange={(e) => setContent(e.target.value)}
          value={content || item.content}
        ></textarea>
        <Button
          type="primary"
          className="update"
          loading={props.listState.loading}
          onClick={() => props.dispatchUpdate(item.id, content, "content")}
        >
          update
        </Button>
      </Spin>
    </div>
  );
}

export default connect(mapStateToProps, mapDispatchToProps)(Detail);
