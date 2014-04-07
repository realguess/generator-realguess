// GitHub Gist Sub-Generator
// =========================
//
// Usage: `$ yo realguess:gist 'mygist'`
//
// TODO
// ----
//
// 1. The current sub-generator only supports JavaScript Gist (see templates).
//    Need to expand it to support other languages.
//
// > (c) 2014 Chao Huang <chao@realguess.net>

'use strict';

var util   = require('util');
var yeoman = require('yeoman-generator');

var GistGenerator = yeoman.generators.NamedBase.extend({
  files: function files() {
    this.template('gist.js', this.name + '.js');
  },
});
module.exports = GistGenerator;
