const express = require('express');
const cookieParser = require('cookie-parser');
const app = express();
const cors = require('cors');
//import

// Built in middleware
app.use(express.json());
app.use(cookieParser());

// App routes
app.use('/api/v1/users', require('./controllers/users'));
app.use(
  cors({
    origin: [
      'https://alchemy-shopping-front-end-demo.netlify.app',
      'http://localhost:7891'
    ],
    credentials: true,
  })
);
//use " , authenticate " after each route path to authenticate all routes

app.use('/api/v1/links', require('./controllers/links'));
app.use('/api/v1/facts', require('./controllers/facts'));
app.use('/api/v1/themes', require('./controllers/themes'));
// Error handling & 404 middleware for when
// a request doesn't match any app routes
app.use(require('./middleware/not-found'));
app.use(require('./middleware/error'));

module.exports = app;
