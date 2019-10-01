var express = require('express');
var router = express.Router();

/* GET users listing. */
router.get('/', function(req, res, next) {

  var ip = require("ip");
  var myip=ip.address();

  console.log('The value of MESSAGBACKEND_MESSAGEE is:', process.env.BACKEND_MESSAGE);


  res.setHeader('content-type', 'application/json');
  res.end(JSON.stringify([{
    "id": 1,
    "status": "OK",
    "ip_address": myip,
    "hello": process.env.BACKEND_MESSAGE || "Hello World"
}]));

});

module.exports = router;
