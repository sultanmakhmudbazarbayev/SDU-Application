const CourseService = require("../services/CourseService.js")
const UserService = require("../services/UserService.js")

class CourseController {
    async getAll(req, res) {
        try {
            let courses = await CourseService.find()
            res.json(courses)
        } catch (error) {
            console.log(error)
        }
    }

    async findOne(req, res) {
        const { id, email } = req.params;
        let course = {}
        if (id) {
            course = await CourseService.findById(id)
        } else {
            res.json({ message: "Enter id" })
        }
        if (!course) return res.status(200).json({ message: "Course not exists" })
        res.json(course);
    }
}

module.exports = new CourseController()