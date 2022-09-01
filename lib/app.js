const express = require('express');
const cookieParser = require('cookie-parser');
const app = express();
const path = require('path');
//import

// Built in middleware
app.use(express.json());
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));
// App routes
app.use('/api/v1/users', require('./controllers/users'));

//use " , authenticate " after each route path to authenticate all routes

app.use('/api/v1/links', require('./controllers/links'));
app.use('/api/v1/facts', require('./controllers/facts'));
app.use('/api/v1/themes', require('./controllers/themes'));
// Error handling & 404 middleware for when
// a request doesn't match any app routes
app.use(require('./middleware/not-found'));
app.use(require('./middleware/error'));

module.exports = app;
