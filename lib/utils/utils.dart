import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socketio_ttt/provider/room_data_provider.dart';
import 'package:socketio_ttt/resources/game_methods.dart';
import 'package:socketio_ttt/resources/socketio_methods.dart';

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}

void showDialogBox(BuildContext context, String text) {
  SocketMethods _socketMethods = SocketMethods();
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(text),
        actions: [
          TextButton(
            onPressed: () {
              _socketMethods.playAgain(
                Provider.of<RoomDataProvider>(context, listen: false)
                    .roomData['_id'],
              );
              GameMethods().clearBoard(context);
              Navigator.pop(context);
            },
            child: Text('Play Again'),
          ),
        ],
      );
    },
  );
}

void showDialogBox2(BuildContext context, String text) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(text),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Game Ended"),
          ),
        ],
      );
    },
  );
}
