// [Application]
// =============
//
// > (c) 2014 [Joe Doe] <jdoe@example.com>

'use strict';

// Module dependencies
// -------------------
var express = require('express')
  , routes  = require('./routes')
  , http    = require('http')
  // , https   = require('https')
  , path    = require('path')
  ;

var app = express();

// Configuration
// -------------

// Configure all environments.
app.configure(function () {
  app.set('port', process.env.PORT || 3000);
  app.use(express.favicon());
  app.use(express.logger('dev'));
  app.use(express.bodyParser());
  app.use(express.methodOverride());
  app.use(app.router);
  app.use(express.static(path.join(__dirname, 'public')));
});

// Configure development environment.
app.configure('development', function () {
  app.use(express.errorHandler());
});

// Define routings
// ---------------
app.get('/', routes.index);

// Create app
// ----------
http.createServer(app).listen(app.get('port'), function () {
  console.log("Express server listening on port " + app.get('port'));
});
