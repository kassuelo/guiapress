const sequelize = require("sequelize");
const Sequelize = require("sequelize");
const connection = new Sequelize('kadev_database','kassuelo','#kungfu6991#',{
    host:'mysql742.umbler.com',
    dialect:'mysql',
    timezone:"-03:00"
});

module.exports = connection;