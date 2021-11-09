require('dotenv').config()
const env = process.env;

const mongoose = require("mongoose")
const db_uri = `mongodb+srv://${env.DB_USER}:` + env.DB_PASS + env.DB_HOST;

const express = require('express')
const port = env.API_PORT
const app = express()

const router = require("./routers/router.js")

app.use(express.json())
app.use(router)

async function startApp() {
    try {
        await mongoose.connect(db_uri)
        app.listen(port, () => console.log(`Api listening at http://localhost:${port}`))
    } catch (e) {
        console.log(e)
    }
}

startApp()