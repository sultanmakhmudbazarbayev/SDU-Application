require('dotenv').config()
const jwt = require('jsonwebtoken')

class JWTController {
    generateAccessToken(payload) {
        return jwt.sign(payload, process.env.TOKEN_SECRET, { expiresIn: process.env.EXP_TIME });
    }

    authenticateToken(req, res) {
        const token = req.body.jwt_token;
        if (token == null) res.sendStatus(401)
        jwt.verify(token, process.env.TOKEN_SECRET, (err, user) => { return { err, user } })
    }
}

module.exports = new JWTController()