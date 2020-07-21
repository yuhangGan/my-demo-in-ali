import api from "../services/api";
import { message } from "antd";

message.config({
  duration: 2,
});

export default {
  namespace: "listModel",
  state: {
    list: new Map(),
    curPage: 0,
  },

  effects: {
    *dispatchFetch(action, { put, call }) {
      const result = yield call(api.fetchList);
      console.log(result, "获取列表接口返回的数据");
      yield put({ type: "setList", payload: result.data });
    },

    *dispatchCreate({ payload }, { put, call, select }) {
      const result = yield call(api.createItem, {
        item: payload.listItem,
        isDone: false,
        content: "",
      });
      console.log(result, "添加一条item接口的返回值");
      yield put({ type: "createItem", payload: result.data.res });
      message.success("Item has been added");
    },

    *dispatchDestroy({ payload }, { put, call, select }) {
      const result = yield call(api.destroyItem, payload.id);
      console.log(result, "删除一条item接口的返回值");
      yield put({ type: "destroyItem", payload: payload.id });
      message.success("Item has been deleted");
    },

    *dispatchUpdate({ payload }, { put, call, select }) {
      const result = yield call(api.updateItem, payload);
      console.log(result, "update接口的返回值");
      yield put({ type: "updateItem", payload });
      message.success("Item has been updated");
    },
  },

  reducers: {
    setList(state, { payload: list }) {
      let mapList = new Map();
      list.map((e, i) => {
        mapList.set(e.id, e);
      });
      let arr = mapList.values();

      return {
        ...state,
        loading: false,
        list: mapList,
      };
    },
    
    createItem(state, { payload: res }) {
      return {
        ...state,
        loading: false,
        list: new Map([
          [res.id, { isDone: false, listItem: res.listItem, id: res.id }],
          ...state.list,
        ]),
      };
    },

    destroyItem(state, { payload: id }) {
      state.list.delete(id);
      return {
        ...state,
        loading: false,
        list: new Map([...state.list]),
      };
    },

    updateItem(state, { payload: newItem }) {
      if (newItem.updateType === "isDone") {
        state.list.set(newItem.id, {
          ...state.list.get(newItem.id),
          isDone: newItem.data,
        });
      } else {
        state.list.set(newItem.id, {
          ...state.list.get(newItem.id),
          content: newItem.data,
        });
      }

      return {
        ...state,
        loading: false,
        list: new Map([...state.list]),
      };
    },
  },

  subscriptions: {
    refresh({ dispatch, history }) {
      window.onload = () => {
        console.log(`window refreshed at ${history.location.pathname}`);
        if (history.location.pathname === "/detail")
          dispatch({ type: "dispatchFetch" });
      };
      // history.listen(({ pathname, query }) => {
      //     if (pathname === '/' || pathname === '/todoList') return
      //     dispatch({ type: `checkRefresh` })
      // })
    },
  },
};
