const User = require("../models/User.js")

class UserController {
    async create(userData) {
        let user = await User.create(userData)
        // return { name, email, createdAt, updatedAt } = user;
        return user;
    }

    async getAll() {
        return users = User.find()
    }

    async findOne(req, res) {
        const { id } = req.body;
        user = await User.findById(id)
        return res.json(user);
    }
}

module.exports = new UserController()