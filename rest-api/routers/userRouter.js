const user = require('express').Router()
const UserController = require('../controllers/UserController.js')

user.get('/users', UserController.getAll)
user.get('/users/:id', UserController.findOne)
user.put('/users', UserController.update)
user.delete('/users/:id', UserController.delete)

module.exports = user