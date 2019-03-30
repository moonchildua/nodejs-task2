const os = require('os');
var http = require('http');
var redis = require('redis').createClient(6379,'redis');

   http.createServer(function (require, response) {
       if (require.url === '/favicon.ico'){
//           console.log('favicon');
            return;
       }
      console.log( os.hostname() );
      redis.incr("count",function(err, reply) {
      response.writeHead(200, { 'Content-Type': 'text/plain' });
      response.write('Welcome !\n');
      response.write('We were visited ' + reply.toString() + ' times!\n');
      response.end();
     });

  }).listen(9090);
console.log('server is running')
