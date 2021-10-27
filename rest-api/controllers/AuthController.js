const UserService = require("../services/UserService.js")
bcrypt = require('bcrypt')
JWTService = require('../services/JwtService.js')

class AuthController {
    async signUp(req, res) {
        try {
            var { name, email, password } = req.body;
            const saltRounds = 10;
            password = await bcrypt.hash(password, saltRounds)
            let user = await UserService.create({ name, email, password })
            user = { name: user.name, email: user.email };
            console.log(user)
            console.log(user._id)
            const jwtToken = JWTService.generateAccessToken(user)
            res.status(201).json({ user, jwtToken })
        } catch (e) {
            console.log(e)
            res.status(500).json(e)
        }
    }

    async login(req, res) {
        try {
            const { name, email, password } = req.body;
            let user = await UserService.findOne({ email: email })
            user = { name: user.name, email: user.email, password: user.password };
            if (user) {
                const validPassword = await bcrypt.compare(password, user.password)
                if (validPassword) {
                    const token = JWTService.generateAccessToken(user)
                    res.status(200).json({ message: "Valid password", jwt: token })
                } else {
                    res.status(400).json({ error: "Invalid Password" })
                }
            } else {
                res.status(401).json({ error: "User does not exist" })
            }
        } catch (e) {
            console.log(e)
            res.status(500).json(e)
        }
    }
}

module.exports = new AuthController()