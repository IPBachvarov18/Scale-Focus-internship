const express = require("express");
const app = express();

app.get("/", function(req,res){
    res.render("site/index.html");
})

app.listen(5404,function(req,res){
    console.log("Start");
})

