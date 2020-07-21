import api from "../service/api";
import { loading, hideLoading } from "../components/Loading";

export const todoList = {
  state: {
    list: new Map(),
  },

  effects: {
    async fetchList(state, payload, dispatch) {
      loading("initializing...");
      const res = await api.fetchList();
      console.log(res, "初始化list");
      dispatch({ type: "todoList/initList", payload: { list: res.data } });
    },

    async createItem(state, payload, dispatch) {
      loading("creating an item...");
      const res = await api.createItem({
        item: payload.listItem,
        isDone: false,
        content: "",
      });
      console.log(res, "新增一条item");
      dispatch({ type: "todoList/insertItem", payload: res.data.res });
    },

    async destroyItem(state, payload, dispatch) {
      loading("deleting this item...");
      const res = await api.destroyItem(payload.id);
      console.log(res, "删除一条item");
      dispatch({ type: "todoList/deleteItem", payload });
    },

    async updateItem(state, payload, dispatch) {
      loading("updating this item...");
      const res = await api.updateItem(payload);
      console.log(res, "更新一条数据");
      dispatch({ type: "todoList/updateList", payload });
    },
  },

  reducers: {
    initList(state, { list }) {
      let mapList = new Map();
      list.map((e, i) => {
        mapList.set(e.id, e);
      });

      // console.log([...mapList]);
      // console.log([...Array.from(mapList)]);
      hideLoading();
      return {
        ...state,
        list: mapList,
      };
    },

    insertItem(state, newItem) {
      // console.log(new Map([[newItem.id, newItem], ...state.list]))

      hideLoading();

      return {
        ...state,
        list: new Map([[newItem.id, newItem], ...Array.from(state.list)]),
      };
    },

    deleteItem(state, payload) {
      state.list.delete(payload.id);

      hideLoading();

      return {
        ...state,
        list: new Map([...Array.from(state.list)]),
      };
    },

    updateList(state, updatedItem) {
      if (updatedItem.updateType === "isDone") {
        state.list.set(updatedItem.id, {
          ...state.list.get(updatedItem.id),
          isDone: updatedItem.data,
        });
      } else {
        state.list.set(updatedItem.id, {
          ...state.list.get(updatedItem.id),
          content: updatedItem.data,
        });
      }

      hideLoading();

      return {
        ...state,
        loading: false,
        list: new Map([...Array.from(state.list)]),
      };
    },
  },
};
