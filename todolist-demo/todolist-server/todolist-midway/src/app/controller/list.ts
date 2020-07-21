import {
  provide,
  inject,
  get,
  post,
  put,
  del,
  controller,
  Context,
} from "midway";

@provide()
@controller("/todoItems")
export class ListController {
  @inject()
  ctx: Context;

  @inject("listService")
  service;

  @get("/")
  async index() {
    const res = await this.service.fetchList();
    this.ctx.body = res;
  }

  @post("/")
  async createItem() {
    const res = await this.service.createItem();
    this.ctx.body = res;
  }

  @del("/:id")
  async destroyItem() {
    const res = await this.service.destroyItem();
    this.ctx.body = res;
  }

  @put("/:id")
  async updateItem() {
    const res = await this.service.updateItem();
    this.ctx.body = res;
  }
}
