// import { EggPlugin } from "midway";
// export default {
//   static: true, // default is true
// } as EggPlugin;

export const sequelize = {
  enable: true,
  package: "egg-sequelize",
};

export const jwt = {
  enable: true,
  package: "egg-jwt",
};

export const cors = {
  enable: true,
  package: "egg-cors",
};
