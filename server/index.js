const express = require('express');
const mongoose = require('mongoose');
const Room = require('./models/room');

const app = express();
const port = process.env.PORT || 5000;

//? 1st method
const http = require('http');
var server = http.createServer(app);
var io = require("socket.io")(server);

//? 2nd method (Here we use http.listen() instead of server.listen() or app.listen())
// const http = require('http').Server(app);
// const io = require('socket.io')(http);
// http.listen(port, () => console.log(`Listening on port ${port}`));

app.use(express.json());

const db = "mongodb+srv://TicTacToe:kDHxX55NgYEHMx4m@cluster0.st4ydpj.mongodb.net/?retryWrites=true&w=majority";

io.on('connection', (socket) => {
    console.log('SocketIO connected');
    //! This below diff is based on input type in client side
    // socket.on('createRoom', nickname => { console.log(nickname); }); //? Output - { nickname: 'string in nickname variable' }
    socket.on('createRoom', async ({ 'nickname': nickname }) => {
        console.log(nickname);
        try {
            // Creating room
            let player = {
                nickname: nickname,
                socketId: socket.id,
                playerType: 'X',
            }
            let room = new Room();
            room.players.push(player);
            room.turn = player;

            // store room in db
            room = await room.save();
            const roomId = room._id.toString();

            // This join the socket with roomId which helps in sending message/reply/change to specific room (where many rooms are going on)
            socket.join(roomId); 

            // telling client that room is created
            // io.emit('roomCreated', { roomId: roomId }); ==> This will send to all the clients, without checking he present in room or not
            io.to(roomId).emit('createRoomSuccess', room); //? This will send to only the client who created the room

        } catch (error) {
            console.log(error);
        }
    }); //? Output - 'string in nickname variable'

    socket.on('disconnect', () => { console.log('SocketIO disconnected') });
});

mongoose.connect(db, { useNewUrlParser: true, useUnifiedTopology: true }).then(() => {
    console.log('MongoDB Connected');
}).catch(err => console.log(err));

server.listen(port, '0.0.0.0', () => {
    console.log(`Server running on port http://localhost:${port}`);
});
