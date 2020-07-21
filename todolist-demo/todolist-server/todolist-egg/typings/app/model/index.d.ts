// This file is created by egg-ts-helper@1.25.8
// Do not modify this file!!!!!!!!!

import 'egg';
import ExportList = require('../../../app/model/list');

declare module 'egg' {
  interface IModel {
    List: ReturnType<typeof ExportList>;
  }
}
