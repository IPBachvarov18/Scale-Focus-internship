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
        const result = await pool
            .request()
            .input("Username", sql.NVarChar, req.body.username)
            .input("firstName", sql.NVarChar, req.body.firstName)
            .input("lastName", sql.NVarChar, req.body.lastName)
            .input("password", sql.NVarChar, req.body.password)
            .query `INSERT INTO User (username, firstName, lastName, password)
            VALUES (@username, @firstName, @lastName, @password)`;
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

    res.redirect("register");
});

module.exports = router;