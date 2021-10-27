const User = require('../models/User.js')

class UserService {
    async create(user){
        user = await User.create(user)
        return user; 
    }

    async find(){
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
}

module.exports = new UserService();