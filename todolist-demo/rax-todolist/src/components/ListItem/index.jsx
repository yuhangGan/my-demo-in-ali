import { createElement,useEffect } from "rax";

import Text from "rax-text";
import View from "rax-view";
import Image from "rax-image";

import "./style.less";

function ListItem(props) {
  const { item, dispatchDestroy, dispatchUpdate, push } = props;

  useEffect(() => {
    // console.log('aaa')
    return () => {
      console.log("unmount");
    };
  });

  const checkDetail = (id) => push("detail", { id });
  return (
    <View
      className="list-item"
      style={{ animationDelay: `${props.index * 0.05}s` }}
    >
      <View className="item-title" onClick={() => checkDetail(item.id)}>
        <Text className="title-text">{item.listItem}</Text>
      </View>
      <View style={{ flexDirection: "row" }} className="item-btns">
        <View
          className="btn"
          onClick={() => dispatchUpdate(item.id, !item.isDone, "isDone")}
        >
          {item.isDone ? <Text style={{ color: "green" }}>✔</Text> : "done"}
        </View>
        <Image
          style={{ marginLeft: "20rpx" }}
          onClick={() => dispatchDestroy(item.id)}
          className="btn-img"
          mode="widthFix"
          source={{ uri: "../../public/delete.png" }}
        />
      </View>
    </View>
  );
}

export default ListItem;
