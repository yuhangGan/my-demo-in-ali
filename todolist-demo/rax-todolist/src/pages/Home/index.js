import { createElement, useEffect, useState } from "rax";
import View from "rax-view";
import Text from "rax-text";
import TextInput from "rax-textinput";

import "./index.less";

import ListItem from "../../components/ListItem";

import { connect } from "@ali/vmate-rax-tiny-store";

const mapStateToProps = ({ todoList, loading }) => {
  return {
    todoList,
  };
};

const mapDispatchToProps = (dispatch) => {
  return {
    // 获取列表
    dispatchFetch: () => dispatch({ type: "todoList/fetchList" }),
    // 创建item
    dispatchCreate: (listItem) => {
      if (!listItem.replace(/\s/g, "")) {
        return;
      }
      dispatch({ type: "todoList/createItem", payload: { listItem } });
    },
    // 删除item
    dispatchDestroy: (id) =>
      dispatch({ type: "todoList/destroyItem", payload: { id } }),
    // 更新item
    dispatchUpdate: (id, data, updateType) =>
      dispatch({
        type: "todoList/updateItem",
        payload: { id, data, updateType },
      }),
  };
};

function Home(props) {
  const [inputVal, setInputVal] = useState("");
  const [curPage, setCurPage] = useState(0);
  const size = 10; // 单页条数

  const {
    dispatchCreate,
    dispatchFetch,
    dispatchDestroy,
    dispatchUpdate,
    push,
  } = props;
  const list = Array.from(props.todoList.list.values()) || [];

  useEffect(() => {
    dispatchFetch();
  }, []);

  return (
    <View className="home">
      <Text className="title">TODOLIST</Text>
      <View className="input-box">
        <TextInput
          style={{
            width: inputVal ? "70%" : "94%",
          }}
          className="plan-input"
          placeholder="type your plan's title"
          onInput={(e) => setInputVal(e.target.value)}
          value={inputVal}
        />
        <Text
          className="confirm-btn"
          style={{ width: inputVal ? "" : "0" }}
          onClick={() => {
            dispatchCreate(inputVal);
            setInputVal("");
          }}
        >
          confirm
        </Text>
      </View>
      <View className="lists">
        {list.slice(curPage * size, (curPage + 1) * size).map((e, i) => {
          return (
            <ListItem
              push={push}
              key={i}
              item={e}
              index={i}
              dispatchDestroy={dispatchDestroy}
              dispatchUpdate={dispatchUpdate}
            />
          );
        })}
      </View>
      <View className="pagination" style={{ flexDirection: "row" }}>
        {list.length > 10 &&
          new Array(parseInt(list.length / 10) + 1).fill("").map((e, i) => {
            return (
              <Text
                className={`pagination-item  ${
                  curPage === i ? "atCurPage" : ""
                }`}
                onClick={() => setCurPage(i)}
                key={i}
              >
                {i + 1}
              </Text>
            );
          })}
      </View>
    </View>
  );
}
export default connect(mapStateToProps, mapDispatchToProps)(Home);
