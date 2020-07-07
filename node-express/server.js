'use strict';

const express = require('express');

// Constants
const PORT = process.env.PORT || 3000;
const HOST = process.env.HOST || '0.0.0.0';
const DISPLAY_NAME = process.env.DISPLAY_NAME || 'World';

// App
const app = express();
app.get('/', (req, res) => {
  res.send('Hello ' + DISPLAY_NAME + '!');
});

app.listen(PORT, HOST);
console.log(`Running on http://${HOST}:${PORT}`);
