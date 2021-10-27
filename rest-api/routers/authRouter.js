const auth = require('express').Router();
const AuthController = require('../controllers/AuthController.js');

auth.post('/sign_up', AuthController.signUp)
auth.post('/login', AuthController.login)

module.exports = auth