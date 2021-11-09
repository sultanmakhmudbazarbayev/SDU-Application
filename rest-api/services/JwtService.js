require('dotenv').config()
const jwt = require('jsonwebtoken')

class JWTService {
    generateAccessToken(payload) {
        payload.iat = +(Math.floor(Date.now() / 1000) + process.env.EXP_TIME);
        console.log(payload.iat);
        console.log(typeof payload.iat);
        return jwt.sign(payload, process.env.TOKEN_SECRET);
    }

    authenticateToken(token) {
        if (token == null) throw Error("Token is null")
        return jwt.verify(token, process.env.TOKEN_SECRET, (err, user) => { 
            // console.log({ err, user })
            return { err, user } })
    }
}

module.exports = new JWTService()