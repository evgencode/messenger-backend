const express = require('express')
const cookieParser = require('cookie-parser')
const bodyParser = require('body-parser')
const middlewares = require('./middlewares')

const app = express()

app.use(bodyParser.json())
app.use(bodyParser.urlencoded({ extended: false }))
app.use(cookieParser())
app.use(middlewares.allowOrigin)

/**
 * API Routes
 */
// const indexRouter = require('./controllers/index')
// const userRouter = require('./controllers/user')

// app.use('/user', userRouter)
app.use('/', (req, res, next) => {
  res.send('Hello')
})

/**
 * Error handling
 */
app.use(middlewares.notFound)
app.use(middlewares.error500)

module.exports = app
