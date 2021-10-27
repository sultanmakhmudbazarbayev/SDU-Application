// Main router
const router = require('express').Router()

// Help routers
const authRouter = require('./authRouter.js')
const userRouter = require('./userRouter.js')

router.use('/auth', authRouter)
router.use('/users', userRouter)

module.exports = router