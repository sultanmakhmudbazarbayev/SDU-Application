// Main router
const router = require('express').Router()

// Help routers
const authRouter = require('./authRouter.js')
const userRouter = require('./userRouter.js')

//Middlewares
const authenticateMiddleware = require('../middlewares/AuthenticateMiddleware.js')

// router.use('/users', authenticateMiddleware)

router.use('/auth', authRouter)
router.use('/users', userRouter)

module.exports = router