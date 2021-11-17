const user = require('express').Router()
const UserController = require('../controllers/UserController.js')

user.get('/bookmarks', UserController.getBookmarks)
user.post('/bookmarks', UserController.addBookmarks)
user.delete('/bookmarks', UserController.deleteBookmarks)

user.get('/', UserController.getAll)
user.put('/', UserController.update)
user.get('/:id', UserController.findOne)
user.delete('/:id', UserController.delete)

user.post('/roles', UserController.addRole)


module.exports = user