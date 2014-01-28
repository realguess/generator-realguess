// Vows.js Template with Request module
// ====================================

'use strict';

// Module dependencies.
var assert  = require('assert');
var request = require('request');
var baseUrl = 'http://localhost';

// Generate a topic function.
function topic(method, url, query, body) {
  return function () {
    request({
      method: method,
      url   : url,
      qs    : query,
      body  : body,
      json  : true,
    }, this.callback);
  };
}

// Generate a test function.
function test(statusCode) {
  return function (err, res, body) {
    assert.isNull(err);
    assert.strictEqual(res.statusCode, statusCode);
  };
}

require('vows').describe('Request').addBatch({ // Batch
  'GET': {                                     // Context
    '/path': {                                 // Sub-Context
      topic: topic(baseUrl + '/path'),         // Topic
      'Should return no errors': test(200)     // Vow
    }
  }
}).export(module);
