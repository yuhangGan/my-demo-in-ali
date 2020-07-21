'use strict';

const Controller = require('egg').Controller;

class ListController extends Controller {
    async delay() {
        return new Promise(function (resolve, reject) {
            setTimeout(function () {
                resolve();
            }, 1000);
        });
    }

    async index() {
        await this.delay();
        this.ctx.body = await this.service.list.fetchList();
    }

    async create() {
        await this.delay();
        this.ctx.body = await this.service.list.createItem();
    }

    async destroy() {
        await this.delay();
        this.ctx.body = await this.service.list.destroyItem();
    }

    async update() {
        await this.delay();
        this.ctx.body = await this.service.list.updateItem();
    }
}

module.exports = ListController;
