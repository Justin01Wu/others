var http = require('http');
var fs = require('fs');

var dt = require('./module/myfirstmodule');

http.createServer(function (req, res) {
	
	console.log('request is coming at ' + new Date());
	
  if(req.url =="/date"){
	  res.write("The date and time are currently: " + dt.myDateTime());
	  res.end();
  }
  if(req.url =="/url"){
	  res.write(req.url);
	  res.end();
  }
  if(req.url =="/html"){
	fs.readFile('html/demofile1.html', function(err, data) {
		res.writeHead(200, {'Content-Type': 'text/html'});
		res.write(data);
		res.end();
	  });
  }   
  if(req.url =="/"){
	  res.write("supported URL: /url  /date /html");
	  res.end();
  } 
  
  
}).listen(8080); 