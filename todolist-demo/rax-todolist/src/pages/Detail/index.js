import { createElement, useState, useEffect } from "rax";

import View from "rax-view";
import Text from "rax-text";
import TextInput from "rax-textinput";
import Image from "rax-image";

import "./style.less";

import { connect } from "@ali/vmate-rax-tiny-store";

const mapStateToProps = ({ loading, todoList }) => {
  return {
    todoList,
  };
};

const mapDispatchToProps = (dispatch) => {
  return {
    dispatchDestroy: (id) =>
      dispatch({ type: `todoList/destroyItem`, payload: { id } }),
    //更新一条item
    dispatchUpdate: (id, data, updateType) =>
      dispatch({
        type: "todoList/updateItem",
        payload: { id, data, updateType },
      }),
  };
};

function Detail(props) {
  const { push, id, dispatchUpdate, dispatchDestroy } = props;

  const item = props.todoList.list.get(parseInt(id)) || {
    content: "",
    isDone: false,
    listItem: "",
    id: 0,
  };

  const [content, setContent] = useState("");

  const back = () => {
    push("home");
  };

  return (
    <View className="detail">
      <View className="opt">
        <Image
          source={{ uri: "../../public/back.png" }}
          onClick={back}
          class="opt-btn"
        />
        <Image
          class="opt-btn"
          source={{
            uri: item.isDone
              ? "../../public/finished.png"
              : "../../public/unfinished.png",
          }}
          onClick={() => dispatchUpdate(item.id, !item.isDone, "isDone")}
        />
        <Image
          class="opt-btn"
          source={{ uri: "../../public/delete.png" }}
          onClick={() => {
            dispatchDestroy(item.id);
            back();
          }}
        />
      </View>
      <View className="line"></View>
      <Text style={{ fontSize: "50rpx", margin: "20rpx 0" }}>
        {item.listItem}
      </Text>
      <Text style={{ fontSize: "45rpx" }}>id:{item.id}</Text>
      <Text>备注：</Text>
      <TextInput
        className="content-box"
        multiline={true}
        placeholder="在此输入内容..."
        onInput={(e) => setContent(e.target.value)}
        value={content || item.content}
      ></TextInput>
      <Text
        className="update"
        onClick={() => dispatchUpdate(item.id, content, "content")}
      >
        update
      </Text>
    </View>
  );
}

export default connect(mapStateToProps, mapDispatchToProps)(Detail);
