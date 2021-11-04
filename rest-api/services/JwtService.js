require('dotenv').config()
const jwt = require('jsonwebtoken')

class JWTService {
    generateAccessToken(payload) {
        return jwt.sign(payload, process.env.TOKEN_SECRET, { expiresIn: process.env.EXP_TIME+"" });
    }

    authenticateToken(token) {
        if (token == null) throw Error("Token is null")
        return jwt.verify(token, process.env.TOKEN_SECRET, (err, user) => { 
            // console.log({ err, user })
            return { err, user } })
    }
}

module.exports = new JWTService()