const express = require("express");
const router = express.Router();
const User = require("./User");
const bcrypt = require('bcryptjs');
const adminAuthentication = require("../middlewares/adminAuthentication");
var controlEmail = false;

router.get("/admin/users",  adminAuthentication, (req, res) => {
    User.findAll().then(users => {
        res.render("admin/users/index", { users: users })
    });
});

router.get("/admin/users/create",  adminAuthentication, (req, res) => {
    res.render("admin/users/create", { emailAlreadyExists: controlEmail });
    controlEmail = false;
});

router.post("/users/create",  adminAuthentication, (req, res) => {
    var email = req.body.email;
    var password = req.body.password;
    var msg = true;
    User.findOne({ where: { email: email } }).then(user => {
        if (user == undefined) {
            var salt = bcrypt.genSaltSync(10);
            var hash = bcrypt.hashSync(password, salt);
            User.create({
                email: email,
                password: hash
            }).then(() => {
                controlEmail = false;
                res.redirect("/");
            }).catch((err) => {
                res.redirect("/");
            });
        } else {
            controlEmail = true;
            res.redirect("/admin/users/create");
        }
    });

});

router.get("/login", (req, res) => {
    res.render("admin/users/login");
});

router.post("/authenticate", (req, res) => {
    var email = req.body.email;
    var password = req.body.password;

    User.findOne({ where: { email: email } }).then(user => {
        if (user != undefined) {
            //validar a senha
            var correct = bcrypt.compareSync(password, user.password);

            if (correct) {
                req.session.user = {
                    id: user.id,
                    email: user.email
                }
                res.redirect("/");
            } else {
                res.redirect("/login");
            }
        } else {
            res.redirect("/login");
        }
    });
});

router.get("/logout",(req,res)=>{
    req.session.user = undefined;
    res.redirect("/");
});

module.exports = router;