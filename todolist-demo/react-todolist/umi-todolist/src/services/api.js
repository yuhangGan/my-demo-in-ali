import axios from "axios";
import { message } from "antd";

const http = axios.create({
  timeout: 500000,
});

const baseUrl = "http://127.0.0.1:7001";

function axiosReq(url, method, data) {
  return http
    .request({
      method,
      url: baseUrl + url,
      data,
    })
    .then((res) => {
      return Promise.resolve(res);
    })
    .catch((err) => {
      message.error(
        "An unknown error occurred on the server, please try again or contact our customer service",
        0
      );
      throw err;
    });
}

const api = {
  fetchList() {
    return axiosReq("/todoItems", "get");
  },
  /**
   *
   * @param {*} id
   */
  destroyItem(id) {
    return axiosReq(`/todoItems/${id}`, "delete");
  },

  createItem(data) {
    return axiosReq("/todoItems", "post", data);
  },

  updateItem(data) {
    return axiosReq(`/todoItems/${data.id}`, "put", data);
  },
};

export default api;
