'use strict';

module.exports = app => {
    const { STRING, INTEGER, BOOLEAN } = app.Sequelize;

    const List = app.model.define('lists', {
        id: { type: INTEGER, primaryKey: true, autoIncrement: true },
        listItem: STRING(255),
        isDone: BOOLEAN,
        content: STRING
    }, {
        timestamps: false
    });

    List.sync();

    return List;
};

