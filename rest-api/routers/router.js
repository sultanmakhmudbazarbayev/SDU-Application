// Main router
const router = require('express').Router()

// Help routers
const authRouter = require('./authRouter.js')
const userRouter = require('./userRouter.js')
const courseRouter = require('./courseRouter.js')

//Middlewares
const authenticateMiddleware = require('../middlewares/AuthenticateMiddleware.js')

router.use('/users', authenticateMiddleware)

router.use('/auth', authRouter)
router.use('/users', userRouter)
router.use('/courses', courseRouter)

module.exports = router