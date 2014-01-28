// Simple web server from <http://nodejs.org/>.
var http = require('http');
http.createServer(function (req, res) {
  res.writeHead(200, {'Content-Type': 'text/plain'});
  res.end('Hello World\n');
}).listen(1337, '127.0.0.1');
console.log('Server running at http://127.0.0.1:1337/');

// Simplied one based on above one.
require('http').createServer(function (req,res){res.end('OK');}).listen(1337);
console.log('Server running at http://127.0.0.1:1337/'); 
