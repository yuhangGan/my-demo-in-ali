'use strict';

const Service = require('egg').Service;

class ListService extends Service {
    async fetchList() {
        let result = await this.app.model.List.findAll();
        return result.reverse();
    }

    async createItem() {
        const body = this.ctx.request.body;
        const res = await this.ctx.model.List.create({
            listItem: body.item,
            isDone: body.isDone,
            content: body.content
        })
        return { res, message: `新建成功，插入数据id为${res.id}` };
    }

    async destroyItem() {
        // console.log(this.ctx.request, this.ctx.params)
        const code = await this.ctx.model.List.destroy({
            where: {
                id: this.ctx.params.id,
            },
        });

        return { code, message: code ? '删除成功' : '删除失败，查无此条数据' };
    }

    async updateItem() {
        const body = this.ctx.request.body;
        let updateObj = {}
        if (body.updateType === 'content') {
            updateObj.content = body.data
        } else {
            updateObj.isDone = body.data
        }
        const res = await this.ctx.model.List.update(updateObj, {
            where: {
                id: this.ctx.params.id,
            },
        });

        return res;
    }
}

module.exports = ListService;
