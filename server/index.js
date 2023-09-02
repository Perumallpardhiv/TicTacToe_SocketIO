const express = require('express');
const mongoose = require('mongoose');
const http = require('http');

const app = express();
const port = process.env.PORT || 5000;

var server = http.createServer(app);

// var socketio = require('socket.io');
// var io = socketio(server);
var io = require("socket.io")(server);

app.use(express.json());

const db = "mongodb+srv://TicTacToe:kDHxX55NgYEHMx4m@cluster0.st4ydpj.mongodb.net/?retryWrites=true&w=majority";

io.on('connection', (socket) => {
    console.log('SocketIO connected');
    socket.on('createRoom', ({nickname}) => {
        console.log(nickname);
    });
});

mongoose.connect(db, { useNewUrlParser: true, useUnifiedTopology: true }).then(() => {
    console.log('MongoDB Connected');
}).catch(err => console.log(err));

server.listen(port, '0.0.0.0', () => {
  console.log(`Server running on port http://localhost:${port}`);
});
