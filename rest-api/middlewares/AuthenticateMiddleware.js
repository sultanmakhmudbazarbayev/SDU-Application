const JWTService = require('../services/JwtService.js');
const UserService = require('../services/UserService.js');

module.exports = async function validate(req, res, next) {
    try {
        const { jwt } = req.body;
        if (jwt) {
            const { err, user } = JWTService.authenticateToken(jwt)
            if (err) {
                return res.status(400).json(err)
            }
            req.user = await UserService.findById(user.id)
        }
        req.isAuthenticated = req.user ? true : false;
        next()

    } catch (e) {
        console.log(e)
        return res.sendStatus(400)
    }
}