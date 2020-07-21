import { createElement } from "rax";

import View from "rax-view";
import Image from "rax-image";

import "./style.less";

export default function Loading(props) {
  return (
    <View className="loading" id="loading">
      <Image
        source={{ uri: "../../public/loading.png" }}
        className="loading-img"
      />
      <View className="loading-content">{props.content}</View>
    </View>
  );
}
