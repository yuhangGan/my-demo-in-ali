import axios from "axios";

const http = axios.create({});

const baseUrl = "http://127.0.0.1:7001/";

function request(url, method, data) {
  return http
    .request({
      url: baseUrl + url,
      method,
      data,
    })
    .then((res) => {
      return Promise.resolve(res);
    })
    .catch((err) => {
      return Promise.reject(err);
    });
}

const api = {
  fetchList() {
    return request("todoItems", "get");
  },

  createItem(data) {
    return request("todoItems", "post", data);
  },

  updateItem(data) {
    return request(`todoItems/${data.id}`, "put", data);
  },

  destroyItem(id) {
    return request(`todoItems/${id}`, "delete");
  },
};

export default api;
