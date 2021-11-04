const UserService = require("../services/UserService.js")
const JWTService = require("../services/JwtService.js")

class UserController {
    async getAll(req, res) {
        try {
            let users = await UserService.find()
            res.json(users)
        } catch (error) {
            console.log(error)
        }
    }

    async findOne(req, res) {
        const { id, email } = req.params;
        let user = {}
        if (id) {
            user = await UserService.findById(id)
        } else if (email) {
            user = await UserService.findByEmail(email)
        }else{
            res.json({ message: "Enter id or email" })
        }
        if (!user) return res.sendStatus(400)
        res.json(user);
    }

    async update(req, res) {
        res.send("Ok")
    }

    async delete(req, res, user) {
        const { id } = req.params;
        if (!id) {
            return res.sendStatus(400)
        }
        
        const deletedUser = await UserService.deleteById(id)
        if (deletedUser) {
            res.json({ deletedUser })
        } else {
            res.sendStatus(500)
        }
    }
}

module.exports = new UserController()