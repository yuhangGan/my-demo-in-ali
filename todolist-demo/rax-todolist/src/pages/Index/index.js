import { createElement, useEffect, useState } from "rax";
import { parsePath } from "rax-app";

import View from "rax-view";
import Home from "../Home";
import Detail from "../Detail";

import TinyStore from "@ali/vmate-rax-tiny-store";
import models from "../../models";

export default function Index(props) {
  const { location } = props;
  const [child, setChild] = useState(null);

  // 自定义页面跳转
  const push = (path, query) => {
    switch (path) {
      case "detail":
        setChild(<Detail id={query.id} push={push} />);
        break;
      default:
        setChild(<Home push={push} />);
        break;
    }
  };

  useEffect(() => {
    setChild(<Home push={push} />);
    console.log("page reload");
  }, []);

  return <TinyStore models={models}>{child}</TinyStore>;
}
