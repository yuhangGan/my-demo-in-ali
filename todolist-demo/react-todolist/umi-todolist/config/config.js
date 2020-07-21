export default {
    singular: true,
    antd: {},
    routes: [
        {
            path: '/',
            component: './TodoList/TodoList'
        },
        {
            path: '/todoList',
            component: './TodoList/TodoList'
        },
        {
            path: '/detail',
            component: './Detail/Detail'
        }
    ],
    "theme": {
        "primary-color": "orange",
      }
};