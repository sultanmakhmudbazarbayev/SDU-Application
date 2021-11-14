const User = require('../models/User.js')

class UserService {
    async create(user) {
        user = await User.create(user)
        return user;
    }

    async find() {
        let users = await User.find()
        return users;
    }

    async findById(id) {
        let user = await User.findById(id)
        return user;
    }

    async findByEmail(email) {
        let user = await User.findOne({ email: email })
        return user;
    }

    async deleteById(id) {
        let deletedUser = await User.findByIdAndDelete(id)
        return deletedUser;
    }

    async update(newData) {
        let updatedUser = await User.findByIdAndUpdate(newData._id, newData, { new: true })
        return updatedUser;
    }

    hasRole(user = null, role = '') {
        if (user && role) {
            return user.roles.includes(role)
        } else {
            return false;
        }
    }
}

module.exports = new UserService();