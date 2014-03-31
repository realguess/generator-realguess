// Vows.js Template
// ================
//
// > (c)

'use strict';

var assert = require('assert');

require('vows').describe('Suite').addBatch({     // Batch
  'An array': {                                  // Context
    'with 3 elements': {                         // Sub-Context
      topic: [1, 2, 3],                          // Topic
      'has a length of 3': function (topic) {    // Vow
        assert.equal(topic.length, 3);
      }
    },
    'with zero elements': {                      // Sub-Context
      topic: [],                                 // Topic
      'has a length of 0': function (topic) {    // Vow
         assert.equal(topic.length, 0);
      },
      'returns *undefined*, when `pop()`ed': function (topic) {
        assert.isUndefined(topic.pop());
      }
    }
  }
}).export(module);
