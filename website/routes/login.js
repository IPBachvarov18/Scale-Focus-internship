const express = require("express");
const router = express.Router();
const sql = require("mssql/msnodesqlv8");
const { config } = require("../db/config");

router.get("/login", function(req, res) {
    res.render("login");
});

router.post("/login", async function(req, res) {
    try {
        let loggedUserInfo = {};
        console.log(req.body);
        const crypto = require("crypto");
        const sha256sum = crypto.createHash("sha256");
        const passHashed = sha256sum.update(req.body.Password).digest("hex");
        const pool = await sql.connect(config);
        const result = await pool
            .request()
            .input("Username", sql.NVarChar, req.body.Username)
            .input("IncommingPassword", sql.NVarChar, passHashed)
            .output("VerifiedId", sql.Int)
            .output("UsernameOut", sql.NVarChar)
            .execute("SignInUser");
        loggedUserInfo.id = result.output.VerifiedId;
        loggedUserInfo.username = result.output.UsernameOut;
        console.log(loggedUserInfo);
    } catch (e) {
        console.log(e);
        if (e instanceof sql.RequestError) {
            return displayError(
                res,
                "A database error has occured! Please try again later."
            );
        } else {}
    }

    res.redirect("/login");
});

module.exports = router;