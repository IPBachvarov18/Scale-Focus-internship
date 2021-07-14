var express = require("express");
var path = require("path");

var indexRouter = require("./routes/index");
var loginRouter = require("./routes/login");
var registerRouter = require("./routes/register");
var userslistRouter = require("./routes/userslist");

var app = express();

app.set("views", path.join(__dirname, "views"));
app.set("view engine", "ejs");

app.use(express.json());
app.use(express.static(path.join(__dirname, "public")));

app.use("/", indexRouter);
app.use("/", loginRouter);
app.use("/", registerRouter);
app.use("/", userslistRouter);

module.exports = app;

app.listen(5404,function(req,res){
    console.log("Start");
})