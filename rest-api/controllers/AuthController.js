const UserService = require("../services/UserService.js")
bcrypt = require('bcrypt')
JWTService = require('../services/JwtService.js')

class AuthController {
    async signUp(req, res) {
        try {
            var { name, email, password } = req.body;
            const saltRounds = 10;
            password = await bcrypt.hash(password, saltRounds)
            await UserService.create({ name, email, password })
            let user = await UserService.findByEmail(email)
            user = { id: user._id.toString(), name: user.name, email: user.email };
            const jwtToken = JWTService.generateAccessToken(user)
            res.status(201).json({ user, jwtToken })
        } catch (e) {
            console.log(e)
            res.status(500).json(e)
        }
    }

    async login(req, res) {
        try {
            const { email, password } = req.body;
            let user = await UserService.findByEmail(email)
            user = { id: user._id.toString(), name: user.name, email: user.email, password: user.password, createdAt: user.createdAt, updatedAt: user.updatedAt };
            if (user) {
                const validPassword = await bcrypt.compare(password, user.password)
                if (validPassword) {
                    const token = JWTService.generateAccessToken(user)
                    delete user.password;
                    res.status(200).json({ message: "Valid password", jwt: token, user: user })
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