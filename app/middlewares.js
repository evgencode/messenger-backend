function allowOrigin(req, res, next) {
    res.header('Access-Control-Allow-Origin', '*');
    res.setHeader('Access-Control-Allow-Credentials', true);
    res.header('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept, Authorization');
    res.setHeader('Access-Control-Allow-Methods', 'POST, GET, DELETE, PUT, OPTIONS');
    next();
}

function notFound(req, res, next) {
    res.status(404).send('Error 404. Object not found.');
}

function error500(error, req, res, next) {
    if (req.app.get('env') === 'development') {
        console.error(error);
        if (req.method == 'GET') {
            next(error);
        }
        else {
            res.status(500).send(error);
        }
    }
    else {
        res.status(500).send({message: 'Error 500. Something went wrong.'});
    }
}


module.exports = {
    allowOrigin,
    notFound,
    error500

}
