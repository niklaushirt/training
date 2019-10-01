var express = require('express');
var router = express.Router();

router.get('/', function(req, res, next) {
  const http = require('http');

  console.log('The value of BACKEND_URL is:', process.env.BACKEND_URL);

  http.get(process.env.BACKEND_URL, (resp) => {
    let data = '';


    // A chunk of data has been recieved.
    resp.on('data', (chunk) => {
      data += chunk;
    });

    // The whole response has been received. Print out the result.
    resp.on('end', () => {
      console.log(data);
      //res.send(JSON.parse(data).explanation);
      res.send(data);
    });

  }).on("error", (err) => {
    console.log("Error: " + err.message);
  });
});

module.exports = router;
