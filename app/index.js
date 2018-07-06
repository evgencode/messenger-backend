const app = require('./app');
const http = require('http');

const port = 3001;

function onListening() {
    console.log('Listening on http://localhost:' + port);
}

function onError(error) {
    if (error.syscall !== 'listen') {
        throw error;
    }

    switch (error.code) {
        case 'EACCES':
            console.error('Pipe: ' + error.port + ' requires elevated privileges');
            process.exit(1);
            break;
        case 'EADDRINUSE':
            console.error('Port: ' + error.port + ' is already in use');
            process.exit(1);
            break;
        default:
            throw error;
    }
}

function createServer() {
    const server = http.createServer(app);
    server.listen(port, onListening);
    server.on('error', onError);
}


createServer();
