const sequelize = require("sequelize");
const Sequelize = require("sequelize");
const connection = new Sequelize('banco de dados','usuario','senha',{
    host:'mys65656565.umbler.com',
    dialect:'mysql',
    timezone:"-03:00"
});

module.exports = connection;