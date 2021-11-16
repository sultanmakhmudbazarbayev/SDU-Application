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
        } else {
            res.json({ message: "Enter id or email" })
        }
        if (!user) return res.status(200).json({ message: "User not exists" })
        res.json(user);
    }

    async update(req, res) {
        const newData = req.body.newData;
        if (!newData._id || !req.isAuthenticated) {
            return res.sendStatus(400)
        }

        const updatedUser = await UserService.update(newData)
        if (updatedUser) {
            res.json({ updatedUser })
        } else {
            res.sendStatus(500)
        }
    }

    async delete(req, res) {
        const id = req.params.id;
        const user = req.user;
        if (!id || !req.isAuthenticated || user._id.toString() != id) {
            return res.sendStatus(400)
        }

        const deletedUser = await UserService.deleteById(id)
        if (deletedUser) {
            res.json({ deletedUser })
        } else {
            res.sendStatus(500)
        }
    }

    async addRole(req, res) {
        const { user_id, role } = req.body;
        if (!user_id || !role) {
            return res.sendStatus(400)
        }
        else if (!UserService.hasRole(req.user, 'admin')) {
            return res.sendStatus(403)
        }
        const user = await UserService.findById(user_id)
        user.roles.push(role)

        const updatedUser = await UserService.update(user)
        if (updatedUser) {
            res.json({ updatedUser })
        } else {
            res.sendStatus(500)
        }
    }

    async getBookmarks(req, res) {
        const user = req.user;
        if (!user) {
            return res.sendStatus(400)
        }

        const bookmarks = await UserService.getBookmarks(user);
        res.json({ bookmarks })
    }
}

module.exports = new UserController()