// server.js
const express = require('express');
const app = express();

// Set EJS as the view engine.
app.set('view engine', 'ejs');

// Set the directory for your views/templates
app.set('views', _dirname + '/views');
console.log(_dirname + '/views');

// Define your routes
app.get('/', (req, res) => {
    // Render the index.ejs file in the views directory
    res.render('index', { title: 'Hello World', 
        message: 'Welcome to my website!!!'
    });
});

// Start the server
const port = 3000;
app.listen(port, () => {
    console.log('Server is running on http://localhost:${port}');
});