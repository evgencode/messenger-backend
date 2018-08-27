const app = require('./app')
const { createServer } = require('http')

const port = 3001

const onListening = () => {
  console.log('Listening on http://localhost:' + port)
}

const onError = error => {
  if (error.syscall !== 'listen') {
    throw error
  }

  switch (error.code) {
    case 'EACCES':
      console.error('Pipe: ' + error.port + ' requires elevated privileges')
      process.exit(1)
      break
    case 'EADDRINUSE':
      console.error('Port: ' + error.port + ' is already in use')
      process.exit(1)
      break
    default:
      throw error
  }
}

const Server = () => {
  const server = createServer(app)
  server.listen(port, onListening)
  server.on('error', onError)
}

Server()
