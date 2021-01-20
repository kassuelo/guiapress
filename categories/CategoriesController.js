const express = require("express");
const router = express.Router();
const Category = require("./Category");
const slugify = require("slugify");
const bodyParser = require("body-parser");
const adminAuthentication = require("../middlewares/adminAuthentication");

router.get("/categories",(req,res)=>{
    res.send("Rota de categorias.")
});

router.get("/admin/categories/new", adminAuthentication, (req,res)=>{
    res.render("admin/categories/new");
});

router.post("/categories/save", adminAuthentication, (req,res)=>{
    var title = req.body.title;
    if(title!=undefined){
        Category.create({
            title:title,
            slug:slugify(title)
        }).then(()=>{
            res.redirect("/admin/categories");
        });
    }else{
        res.redirect("/admin/categories/new");
    }
});

router.get("/admin/categories",  adminAuthentication,  (req,res)=>{
    Category.findAll().then(categories => {
        res.render("admin/categories/index", {categories:categories});
    })
    
});

router.post("/categories/delete",  adminAuthentication, (req,res)=>{
    var id = req.body.id;
    if(id!=undefined){
        if(!isNaN(id)){
            Category.destroy({
                where:{
                    id:id
                }
            }).then(()=>{
                res.redirect("/admin/categories");
            });
        }else{ //se não for número
            res.redirect("/admin/categories");
        }
    }else{ //se for null
        res.redirect("/admin/categories");
    }
});

router.get("/admin/categories/edit/:id",  adminAuthentication,  (req, res) => {
    var id = req.params.id;
    if(isNaN(id)){
        res.redirect("/admin/categories");
    }
    Category.findByPk(id).then(category => {
      if (category != undefined) {
        res.render("admin/categories/edit",{category: category});
      } else {
        res.redirect("/admin/categories");
      }
    }).catch(erro => {
      res.redirect("/admin/categories");
      console.log(erro);
    });
  });

  router.post("/categories/update",  adminAuthentication, (req,res) => {
    var id = req.body.id;
    var title = req.body.title;

    Category.update({title:title, slug: slugify(title)},{
        where: {
            id:id
        }
    }).then(() => {
        res.redirect("/admin/categories");
    })
  });



module.exports = router;