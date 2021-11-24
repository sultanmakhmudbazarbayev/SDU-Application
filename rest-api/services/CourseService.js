const Course = require('../models/Course.js')

class CourseService {
    async find() {
        let courses = await Course.find()
        return courses;
    }

    async findById(id) {
        let course = await Course.findById(id)
        return course;
    }

    async findAllVideosById(id){
        let videos = (await Course.findById(id)).videos;
        return videos;
    }
}

module.exports = new CourseService();