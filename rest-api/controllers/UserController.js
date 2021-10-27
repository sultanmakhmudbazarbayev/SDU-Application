const UserService = require("../services/UserService.js")

class UserController {
    async getAll() {
        return users = UserService.find()
    }

    async findOne(req, res) {
        const { id } = req.body;
        user = await UserService.findById(id)
        return res.json(user);
    }
}

module.exports = new UserController()