// MongoDB
// =======
//
// > (c) <%= new Date().getFullYear() %> Chao Huang <chao@realguess.net>

'use strict';

// Use new connection class `MongoClient` since Node MongoDB driver 1.2.
var MongoClient = require('mongodb').MongoClient;

MongoClient.connect('mongodb://localhost:27017/test', function (err, db) {
  if (err) {
    throw err;
  }

  var collection = db.collection('users');
  collection.insert({ user: 'foo', name: 'Foo' }, function (err, result) {
    db.close();
  });
});
