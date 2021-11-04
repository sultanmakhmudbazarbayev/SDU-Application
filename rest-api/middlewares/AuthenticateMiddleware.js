const JWTService = require('../services/JwtService.js');

module.exports = function validate(req, res, next) {
    try {
        const { jwt } = req.body;
        if (!jwt) {
            return res.sendStatus(400)
        }
        const { err, user } = JWTService.authenticateToken(jwt)
        if (err) {
            console.log("We have error")
            console.log(err)
            return res.status(400).json(err)
        }
        next(req, res, user)
        // console.log(user)
        // return res.sendStatus(200);

    } catch (e) {
        console.log(e)
        return res.sendStatus(400)
    }
}