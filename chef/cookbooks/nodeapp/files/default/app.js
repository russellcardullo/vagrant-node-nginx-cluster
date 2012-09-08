var http = require('http');
var os   = require('os');
var hostname = os.hostname();

http.createServer(function (req, res) {
  res.writeHead(200, {'Content-Type': 'text/plain'});
  res.end('Hello from ' + hostname + '\n');
}).listen(1337);
console.log('Server running at http://127.0.0.1:1337/');
