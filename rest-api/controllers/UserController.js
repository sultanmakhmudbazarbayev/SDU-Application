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
        } else if (email) {
            user = await UserService.findByEmail(email)
        }
        if(!user) res.json({message: "Enter id or email"})
        res.json(user);
    }

    async update(req, res) {
        res.send("Ok")
    }

    async delete(req, res){
        const {id} = req.params;
        if(!id){
            res.status(400).json({message: "Enter id for delete"})
        }
        const user = await UserService.deleteById(id)
        if(user){
            res.json({user})
        }else{
            res.status(500).json()
        }
    }
}

module.exports = new UserController()