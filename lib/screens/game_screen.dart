import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socketio_ttt/provider/room_data_provider.dart';
import 'package:socketio_ttt/resources/socketio_methods.dart';
import 'package:socketio_ttt/views/scores_board.dart';
import 'package:socketio_ttt/views/tictactoe_board.dart';
import 'package:socketio_ttt/views/waiting_lobby.dart';

class GameScreen extends StatefulWidget {
  static String routeName = '/game';
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  SocketMethods _socketMethods = SocketMethods();

  @override
  void initState() {
    super.initState();
    _socketMethods.updateRoomListener(context);
    _socketMethods.updatePlayersStateListener(context);
    _socketMethods.pointIncreaseListener(context);
    _socketMethods.gameEndListener(context);
  }

  @override
  Widget build(BuildContext context) {
    RoomDataProvider roomDataProvider = Provider.of<RoomDataProvider>(context);
    return Scaffold(
      body: Center(
        child: roomDataProvider.roomData['isJoin']
            ? const WaitingLobby()
            : SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        "SCORECARD",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontFamily: "font4",
                        ),
                      ),
                    ),
                    const ScoreBoard(),
                    const TicTacToeBoard(),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        '${roomDataProvider.roomData['turn']['nickname']}\'s turn',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 27,
                          fontFamily: "font1",
                        ),
                      ),
                    ),
                  ],
                ),
            ),
      ),
    );
  }
}
