// Environment
// ===========

'use strict';

/* jshint sub: true */
module.exports = process.env['ENV'] || process.env['NODE_ENV'] || 'development';
process.env['ENV'] = process.env['NODE_ENV'] = module.exports;
