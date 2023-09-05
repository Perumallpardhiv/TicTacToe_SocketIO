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

            // This join the socket with roomId - helps in send message/reply/change to specific room (where many rooms are going on)
            socket.join(roomId); 

            // telling client that room is created
            // io.emit('roomCreated', { roomId: roomId }); ==> This will send to all the clients, without checking he present in room or not
            // socket.emit('roomCreated', { roomId: roomId }); ==> This will send to only the present single device not to all clients in the room
            io.to(roomId).emit('createRoomSuccess', room); //? This will send to only the clients who created/present the room

        } catch (error) {
            console.log(error);
        }
    }); //? Output - 'string in nickname variable'

    socket.on('joinRoom', async ({ 'nickname': nickname, 'roomId': roomId }) => {
        console.log(nickname, roomId);
        try {
            if(!roomId.match(/^[0-9a-fA-F]{24}$/)){
                socket.emit('errorOccured', 'Please enter a valid room ID.');
                return;
            }
            let room = await Room.findById(roomId);
            if (!room) {
                socket.emit('errorOccured', 'Given roomId not found.');
                return;
            }

            if (room.isJoin) {
                let player = {
                    nickname: nickname,
                    socketId: socket.id,
                    playerType: 'O',
                }
                room.players.push(player);
                room.isJoin = false;
                room = await room.save();
                socket.join(roomId);
                io.to(roomId).emit('joinRoomSuccess', room);
                io.to(roomId).emit('updatePlayers', room.players);
                io.to(roomId).emit('updateRoom', room);
            } else {
                socket.emit('errorOccured', 'The game is in progress. Please try again later.');
                return;
            }
        } catch (error) {
            console.log(error);
        }
    });

    socket.on('tap', async ({ 'roomId': roomId, 'index': index }) => {
        try {
            let room = await Room.findById(roomId);
            let choice = room.turn.playerType;
            room.displayElements[index] = choice;
            if (room.turnIndex == 0) {
                room.turn = room.players[1];
                room.turnIndex = 1;    
            } else {
                room.turn = room.players[0];
                room.turnIndex = 0;
            }
            room = await room.save();
            io.to(roomId).emit('tapped', {
                index, choice, room, 
            });
        } catch (error) {
            console.log(error);
        }
    });

    socket.on('winner', async ({ 'winnerSocketId': winnerSocketId, 'roomId': roomId }) => {
        try {
            let room = await Room.findById(roomId);
            let winner = room.players.find((player) => player.socketId == winnerSocketId);
            winner.points += 1;
            room = await room.save();
            if(winner.points >= room.maxRounds){
                io.to(roomId).emit('gameEnd', winner);
            } else {
                io.to(roomId).emit('pointIncrease', winner);
            }
        } catch (error) {
            console.log(error);
        }
    });

    socket.on('playAgain', async ({ 'roomId': roomId }) => {
        try {
            let room = await Room.findById(roomId);
            room.displayElements = ['', '', '', '', '', '', '', '', ''];
            room.currentRound += 1;
            // room.turn = room.players[0];
            // room.turnIndex = 0;
            room = await room.save();
            io.to(roomId).emit('playAgainListener', room);
        } catch (error) {
            console.log(error);
        }
    });

    socket.on('disconnect', () => { console.log('SocketIO disconnected') });
});

mongoose.connect(db, { useNewUrlParser: true, useUnifiedTopology: true }).then(() => {
    console.log('MongoDB Connected');
}).catch(err => console.log(err));

server.listen(port, '0.0.0.0', () => {
    console.log(`Server running on port http://localhost:${port}`);
});
