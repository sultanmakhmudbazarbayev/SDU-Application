const course = require('express').Router()
const CourseController = require('../controllers/CourseController.js')

course.get('/', CourseController.getAll)
course.get('/:id', CourseController.findOne)
course.get('/:id/videos', CourseController.findAllVideos)

module.exports = course