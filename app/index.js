// Yeoman Generator
// ================
//
// Usage: `mkdir proj && cd - && yo realguess`
//
// > (c) 2014 Chao Huang <chao@realguess.net>

'use strict';

// Module Dependencies
// ===================
var util   = require('util');
var path   = require('path');
var yeoman = require('yeoman-generator');


var RealguessGenerator = module.exports = function RealguessGenerator(args, options, config) {
  yeoman.generators.Base.apply(this, arguments);

  this.on('end', function () {
    //console.log(this.options);
    options['skip-install'] = true;
    this.installDependencies({ skipInstall: options['skip-install'] });
  });

  this.pkg = JSON.parse(this.readFileAsString(path.join(__dirname, '../package.json')));
};

util.inherits(RealguessGenerator, yeoman.generators.Base);

RealguessGenerator.prototype.askFor = function askFor() {
  var cb = this.async();

  // have Yeoman greet the user.
  console.log(this.yeoman);

  var prompts = [{
    type: 'confirm',
    name: 'json spaces',
    message: 'Would you like to enable this option?',
    default: true
  }];

  // TODO: Author field (package.json and copyright), name, email and URL
  // TODO: Whether this is a pubic or private (default) package.

  this.prompt(prompts, function (props) {
    this.settings = props;
    cb();
  }.bind(this));
};

RealguessGenerator.prototype.app = function app() {
  this.template('_package.json', 'package.json');
};

RealguessGenerator.prototype.projectfiles = function projectfiles() {
  //this.copy('editors/editorconfig', '.editorconfig');
  //this.copy('lint/jshintrc', '.jshintrc');
};
