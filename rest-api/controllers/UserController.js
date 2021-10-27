const UserService = require("../services/UserService.js")

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
            console.log("id=" + id)
        } else if (email) {
            user = await UserService.findByEmail(email)
            console.log("email=" + email)
        }
        if(!user) res.json({message: "Enter id or email"})
        console.log(user.createdAt)
        res.json(user);
    }

    async update(req, res) {
        res.send("Ok")
    }
}

module.exports = new UserController()