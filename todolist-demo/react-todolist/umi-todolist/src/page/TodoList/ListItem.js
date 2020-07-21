import React, { useState, useEffect, useRef } from "react";
import { Button, Spin } from "antd";

export default function ListItem(props) {
  const { id, isDone, listItem } = props.item;

  return (
    <div
      className={`list-item ${isDone ? "finished" : ""}`}
      style={{ animationDelay: props.index / 20 + "s" }}
    >
      <div onClick={() => props.checkDetail(id)} className="item-title">
        {listItem}
      </div>
      <div>
        <Button onClick={() => props.updateItem(id, !isDone, "isDone")}>
          {isDone ? "✔" : "finish"}
        </Button>
        <Button onClick={(e) => props.deleteItem(id)}>delete</Button>
      </div>
    </div>
  );
}
