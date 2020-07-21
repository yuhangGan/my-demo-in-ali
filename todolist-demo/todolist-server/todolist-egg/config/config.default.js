/* eslint valid-jsdoc: "off" */

"use strict";

/**
 * @param {Egg.EggAppInfo} appInfo app info
 */
module.exports = (appInfo) => {
  /**
   * built-in config
   * @type {Egg.EggAppConfig}
   **/
  const config = (exports = {});

  // use for cookie sign key, should change to your own and keep security
  config.keys = appInfo.name + "_1590744607414_7532";

  config.security = {
    csrf: {
      enable: false,
      ignoreJSON: true,
    },
  };

  config.cors = {
    allowMethods: "GET,HEAD,PUT,POST,DELETE,PATCH,OPTIONS",
    credentials: true, //获得前端的cookie
    // origin: () => 'http://127.0.0.1:8080' //这边不能为*号，需要指定明确的、与请求网页一致的域名
    origin: "*", //这边不能为*号，需要指定明确的、与请求网页一致的域名
  };

  // add your middleware config here
  config.middleware = [];

  config.sequelize = {
    dialect: "mysql",
    host: "localhost",
    port: 3306,
    password: "123456",
    database: "todoList",
  };

  // add your user config here
  const userConfig = {
    // myAppName: 'egg',
  };

  return {
    ...config,
    ...userConfig,
  };
};
