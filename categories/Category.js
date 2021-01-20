const Sequelize = require("sequelize");
const connection = require("../database/database");

const Category = connection.define('categories', {
    title: {
        type: Sequelize.STRING,
        allowNull: false
    }, slug: {
        type: Sequelize.STRING,
        allowNull: false
    }
});

//Category.sync({force:true});//remove após criar as tabelas pra não ficar tentando criar após já ter criado

module.exports = Category;