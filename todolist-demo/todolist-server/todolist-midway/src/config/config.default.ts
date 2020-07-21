import { EggAppConfig, EggAppInfo, PowerPartial } from "midway";

export type DefaultConfig = PowerPartial<EggAppConfig>;

export default (appInfo: EggAppInfo) => {
  const config = {} as DefaultConfig;

  // use for cookie sign key, should change to your own and keep security
  config.keys = appInfo.name + "_{{keys}}";

  // add your config here
  config.middleware = [];

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
    origin: () => "http://localhost:8000", //这边不能为*号，需要指定明确的、与请求网页一致的域名
  };

  config.sequelize = {
    dialect: "mysql",
    host: "localhost",
    port: 3306,
    password: "123456",
    database: "todoList",
  };

  return config;
};
