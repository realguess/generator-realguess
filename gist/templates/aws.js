// Gist: <%= name %>
// <%= _.repeat('=', name.length + 6) %>
//
// > (c) <%= new Date().getFullYear() %> Chao Huang <chao@realguess.net>

'use strict';

var AWS = require('aws-sdk'); 
AWS.config.update({
  accessKeyId: 'id',
  secretAccessKey: 'secret',
  region: 'us-east-1'
});
var s3 = new AWS.S3(); 
var params = {
  Bucket: 'myBucket',
  Key: 'myKey',
  Body: 'Hello!'
};

s3.putObject(params, function (err, data) {
  if (err) { return console.log(err) }

  console.log(data);
});
