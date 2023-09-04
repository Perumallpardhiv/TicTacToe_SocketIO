import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socketio_ttt/provider/room_data_provider.dart';
import 'package:socketio_ttt/resources/socketio_methods.dart';
import 'package:socketio_ttt/widgets/scores_board.dart';
import 'package:socketio_ttt/widgets/tictactoe_board.dart';
import 'package:socketio_ttt/widgets/waiting_lobby.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    RoomDataProvider roomDataProvider = Provider.of<RoomDataProvider>(context);
    return Scaffold(
      body: Center(
        child: roomDataProvider.roomData['isJoin']
            ? const WaitingLobby()
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ScoreBoard(),
                  TicTacToeBoard(),
                ],
              ),
      ),
    );
  }
}
