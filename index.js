var express = require('express');
var app = express();

app.get('/', function (req, res) {
  res.send('Hello World!');
});

export const start = () => {
  app.listen(3000, function () {
    console.log('Listening on port 3000...');
  });
  return true;
};

start();
