// See <http://docs.aws.amazon.com/AWSJavaScriptSDK/guide/node-configuring.html>


// From the application root directory with a library script `./lib/settings.js`.
var AWS      = require('aws-sdk');
var settings = require('./lib/settings');

AWS.config.update({
  accessKeyId    : settings.awsAccessKeyId,
  secretAccessKey: settings.awsSecretAccessKey,
  region         : settings.awsRegion,
});
