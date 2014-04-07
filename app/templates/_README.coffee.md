<%= _.slugify(appname).toUpperCase() %> 
<%= new Array(_.slugify(appname).length + 1).join('=') %> 

> (c) <%= new Date().getFullYear() %> <%= pkg.author.name %> <<%= pkg.author.email %>>

[name] [application|module].

[Long description] Lorem ipsum dolor sit amet, consectetur adipisicing elit,
sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad
minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit
esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat
non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.


Requirements
============

List of requirements:

-  Node 0.10.x
-  CoffeeScript 1.6.x
-  Others


Install
=======

Clone the repository:

    $ git clone git+ssh://path/to/repos.git

Development:

    $ npm install

Production:

    $ npm install --production


Usage
=====

Development:

    $ coffee app.coffee

Testing:

    $ ENV=testing coffee app.coffee

Staging:

    $ ENV=staging coffee app.coffee
    
Production:

    $ ENV=production coffee app.coffee


Code Quality
============

Run [JSHint][] code quality tool:

    $ grunt lint

Run on individual file:

    $ jshint script.js

See `.jshintrc` in the application root directory for options.

[jshint]: http://www.jshint.com/


Test
====

    $ npm test

Make sure have [Vows][] installed:

    $ sudo npm install -g vows

[vows]: http://vowsjs.org/


Deployment
==========

State the deployment strategy if this is an application.


Misc
====

@version 0.5.0

To preview the Markdown document, use one of the following online tools:

- [EpicEditor](http://epiceditor.com/)
- [Showdown](http://www.showdown.im/)
