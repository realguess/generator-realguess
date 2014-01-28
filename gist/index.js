// GitHub Gist Sub-Generator
// =========================
//
// Usage: `$ yo realguess:gist 'mygist'
//
// TODO
// ----
//
// 1. The current sub-generator only supports JavaScript Gist (see templates).
//    Need to expand it to support other languages.
//
// > (c) 2014 Chao Huang <chao@realguess.net>

'use strict';

var yeoman = require('yeoman-generator');
var util   = require('util');

// Define generator prototype.
function GistGenerator(args, options, config) {
  yeoman.generators.NamedBase.apply(this, arguments);
}
module.exports = GistGenerator;
util.inherits(GistGenerator, yeoman.generators.NamedBase);

// Generator Gist files.
GistGenerator.prototype.files = function files() {
  this.template('gist.js', this.name + '.js');
};
