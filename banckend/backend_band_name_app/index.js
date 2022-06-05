const dotenv = require('dotenv'); 
const express = require( "express");
const path = require( "path");

const app = express();

const env = dotenv.config();
 

//server setup socket.io
const server = require('http').createServer(app);
module.exports.io = require('socket.io')(server);


//messages of socket.io
require("./sockets/socket");

const publicPath = path.join(__dirname,  "public");  

 
app.use(express.static(publicPath));


server.listen(process.env.PORT, (err) => {
    console.log("Server is running on port ", process.env.PORT);
    if (err) {
        console.log(err);
    }
}
);