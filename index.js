const express = require("express");
const app = express();
const bodyParser = require("body-parser");
const session = require("express-session");
const connection = require("./database/database");

const categoriesController = require("./categories/CategoriesController");
const articlesController = require("./articles/ArticlesController");
const usersController = require("./users/UsersController");

const Article = require("./articles/Article");
const Category = require("./categories/Category");
const User = require("./users/User");

//view engine
app.set('view engine', 'ejs');

//session
app.use(session({
    secret: "ciphertoencryptdecrypt", 
    cookie: {
        maxAge: 30000000
    },
resave: false, 
saveUninitialized: false
}));

//static
app.use(express.static('public'));

//body parser
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

//Database
connection
    .authenticate()
    .then(() => {
        console.log("Connection Succeful!");
    }).catch((error) => {
        console.log(error);
    });

//importa as rotas da pasta article e categories
app.use("/", categoriesController);
app.use("/", articlesController);
app.use("/", usersController);

app.get("/", (req, res) => {  //rota inicial faz mostrar todos os artigos juntos
    Article.findAll({
        order: [
            ['id', 'DESC']
        ],
        limit: 2
    }).then(articles => {
        Category.findAll().then(categories => {
            res.render("index", { articles: articles, categories: categories });
        });
    });
});

app.get("/:slug", (req, res) => {  //rota usada para exibir um artigo completo enviando o slug para a rota
    var slug = req.params.slug;
    Article.findOne({
        where:
        {
            slug: slug
        }
    }).then(article => {
        if (article != undefined) {
            Category.findAll().then(categories => {
                res.render("article", { article: article, categories: categories });
            });
        } else {
            res.redirect("/");
        }
    }).catch(err => {
        res.redirect("/");
    })
});

app.get("/category/:slug", (req, res) => { //lista todos artigos de uma categoria, enviando o slug da categoria
    var slug = req.params.slug;
    Category.findOne({
        where: {
            slug: slug
        },
        include: [{ model: Article }]
    }).then(category => {
        if (category != undefined) {
            Category.findAll().then(categories => {
                res.render("index",{articles:category.articles, categories:categories});
                //envia como articles apenas os que pertencerem a categoria encontrada
            });
        } else {
            res.redirect("/");
        }
    }).catch(err => {
        res.redirect("/");
    })
});

app.listen(8080, () => {
    console.log("O servidor está rodando!");
});