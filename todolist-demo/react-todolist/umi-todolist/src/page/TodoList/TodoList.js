import React, { useState, useEffect } from "react";
import { connect, history } from "umi";

import { Input, List, Pagination, Spin } from "antd";

import ListItem from "./listItem";
import "./todolist.less";

const nameSpace = "listModel";
const mapStateToProps = ({ loading, [nameSpace]: listState }) => {
  return {
    listState,
    loading,
  };
};

const mapDispatchToProps = (dispatch) => {
  return {
    //初始化获取list列表
    dispatchFetch: () => {
      dispatch({ type: `${nameSpace}/dispatchFetch` });
    },
    //添加一条list
    dispatchCreate: (listItem) => {
      if (!listItem.replace(/\s/, "")) return;
      dispatch({ type: `${nameSpace}/dispatchCreate`, payload: { listItem } });
    },
    //删除一条item
    dispatchDestroy: (id) => {
      dispatch({ type: `${nameSpace}/dispatchDestroy`, payload: { id } });
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

function TodoList(props) {
  const {
    dispatchFetch,
    dispatchCreate,
    dispatchDestroy,
    dispatchUpdate,
    loading,
  } = props;
  const [inputValue, setInputValue] = useState("");
  const [curPage, setCurPage] = useState(0);
  const pageSize = 10;

  useEffect(() => {
    dispatchFetch();
  }, []);

  const list = [...props.listState.list.values()];

  //跳转路由
  const checkDetail = (id) => {
    history.push({
      pathname: "/detail",
      query: { id: String(id) },
    });
  };

  // console.log(loading.effects)
  // 检查是否有effects正在执行
  const showSpinner =
    loading.effects[`${nameSpace}/dispatchFetch`] ||
    loading.effects[`${nameSpace}/dispatchDestroy`] ||
    loading.effects[`${nameSpace}/dispatchCreate`] ||
    loading.effects[`${nameSpace}/dispatchUpdate`];

  return (
    <div className="container">
      <Spin spinning={!!showSpinner}>
        <h1 className="home">TO DO LIST</h1>
        <Input
          placeholder="write down your plan"
          size="large"
          className="input-box"
          onPressEnter={(e) => {
            dispatchCreate(inputValue);
            setInputValue("");
          }}
          value={inputValue}
          onChange={(e) => setInputValue(e.target.value)}
        />
        <section className="list-box">
          {list.slice(curPage * 10, curPage * 10 + pageSize).map((e, i) => {
            return (
              <ListItem
                index={i}
                key={e.id}
                item={e}
                deleteItem={dispatchDestroy}
                updateItem={dispatchUpdate}
                checkDetail={checkDetail}
              />
            );
          })}
        </section>
        <Pagination
          className="page-number"
          onChange={(page) => setCurPage(page - 1)}
          total={list.length}
          defaultPageSize={pageSize}
          current={curPage + 1}
          hideOnSinglePage={true}
        />
      </Spin>
    </div>
  );
}

export default connect(mapStateToProps, mapDispatchToProps)(TodoList);
