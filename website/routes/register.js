const express = require("express");
const router = express.Router();
const sql = require("mssql/msnodesqlv8");
const { config } = require("../db/config");

let bodyParser = require("body-parser");

// Parse application/json
router.use(bodyParser.json());

// Parse application/x-www-form-urlencoded
router.use(bodyParser.urlencoded({ extended: true }));

router.get("/register", function(req, res) {
    res.render("register");
});

router.post("/register", async function(req, res) {
    try {
        console.log(req.body);
       
        const pool = await sql.connect(config);
        const result = await pool.request()
            .input("Username", sql.NVarChar, req.body.Username)
            .input("First_Name", sql.NVarChar, req.body.First_Name)
            .input("Last_Name", sql.NVarChar, req.body.Last_Name)
            .input("Password", sql.NVarChar, req.body.Password)
            .query ( `INSERT INTO Users (Username, First_Name, Last_Name, Password)
                    VALUES (@Username, @First_Name, @Last_Name, @Password)`);
        console.log(result);
    } catch (e) {
        console.log(e);
        if (e instanceof sql.RequestError) {
            return displayError(
                res,
                "A database error has occured! Please try again later."
            );
        } else {}
    }

    res.redirect("/register");
});

module.exports = router;