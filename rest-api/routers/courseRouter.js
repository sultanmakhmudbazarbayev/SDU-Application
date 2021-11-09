const course = require('express').Router()
const CourseController = require('../controllers/CourseController.js')

course.get('/', CourseController.getAll)
course.get('/:id', CourseController.findOne)

module.exports = course