import axios from 'axios';

const http = axios.create({
    timeout: 500000
})

const baseUrl = 'http://127.0.0.1:7001'

const api = {
    request(url, method, data) {
        return http.request({
            method,
            url: baseUrl + url,
            data
        })
    },

    getList() {
        return this.request('/getList', 'get');
    },

    deleteList(id) {
        return this.request('/deleteList', 'delete', { id });
    },

    addList(listItem) {
        return this.request('/addList', 'post', listItem);
    },

    updateList(data) {
        return this.request('/updateList', 'post', data);
    },
}

export default api