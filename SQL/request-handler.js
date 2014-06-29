/* You should implement your request handler function in this file.
 * And hey! This is already getting passed to http.createServer()
 * in basic-server.js. But it won't work as is.
 * You'll have to figure out a way to export this function from
 * this file and include it in basic-server.js so that it actually works.
 * *Hint* Check out the node module documentation at http://nodejs.org/api/modules.html. */
var db = require('db.js');



var fs = require('fs');
var exports = module.exports = {};
var body = {};
body.results = [];
exports.handleRequest = function(request, response) {
  debugger;
  /* the 'request' argument comes from nodes http module. It includes info about the
  request - such as what URL the browser is requesting. */

  /* Documentation for both request and response can be found at
   * http://nodemanual.org/0.8.14/nodejs_ref_guide/http.html */

  console.log("Serving request type " + request.method + " for url " + request.url);

  var statusCode = 200;

  /* Without this line, this server wouldn't work. See the note
   * below about CORS. */
  var headers = exports.defaultCorsHeaders;

  headers['Content-Type'] = "application/json";
  /* .writeHead() tells our server what HTTP status code to send back */
  // response.writeHead(statusCode, headers);

  if (request.method === 'POST') {
    console.log('post request received by server');
  }

  if((request.url === '/classes/messages' || request.url === '/classes/room1') && request.method === 'GET'){
    response.writeHead(statusCode, headers);

    //********************** connect to database  - retrieve right data



    response.end(JSON.stringify(body));
  }
 else if((request.url === '/classes/messages' || request.url === '/classes/room1') && request.method === 'POST'){
    console.log('post request receivex by server');

    statusCode = 201;
    response.writeHead(statusCode, headers);
    request.on('data', function(data){
      if(data !== undefined) {


      //********************** connect to database  - update its data


      body.results.push(JSON.parse(data));
      }



    });
    response.end(JSON.stringify(body));
  }else{



    statusCode = 404;
    response.writeHead(statusCode, headers);
    response.end();
  }

};

/* These headers will allow Cross-Origin Resource Sharing (CORS).
 * This CRUCIAL code allows this server to talk to websites that
 * are on different domains. (Your chat client is running from a url
 * like file://your/chat/client/index.html, which is considered a
 * different domain.) */
exports.defaultCorsHeaders = {
  "access-control-allow-origin": "*",
  "access-control-allow-methods": "GET, POST, PUT, DELETE, OPTIONS",
  "access-control-allow-headers": "content-type, accept",
  "access-control-max-age": 10 // Seconds.
};
