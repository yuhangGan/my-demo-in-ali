import { provide, inject } from "midway";

// import { TodoListItems } from "../../interface";

@provide("listService")
export class ListService {
  @inject()
  ctx;

  async fetchList() {
    let res = await this.ctx.model.List.findAll();
    return res.reverse();
  }

  async createItem() {
    const body = this.ctx.request.body;
    const res = await this.ctx.model.List.create({
      listItem: body.item,
      isDone: body.isDone,
      content: body.content,
    });
    return { res, message: `新建成功，插入数据id为${res.id}` };
  }

  async destroyItem() {
    const code = await this.ctx.model.List.destroy({
      where: {
        id: this.ctx.params.id,
      },
    });

    return { code, message: code ? "删除成功" : "删除失败，查无此条数据" };
  }

  async updateItem() {
    const body = this.ctx.request.body;
    const res = await this.ctx.model.List.update(
      { [body.updateType]: body.data },
      {
        where: {
          id: this.ctx.params.id,
        },
      }
    );

    return res;
  }
}
