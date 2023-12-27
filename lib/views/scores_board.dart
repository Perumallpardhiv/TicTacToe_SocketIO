import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socketio_ttt/provider/room_data_provider.dart';

class ScoreBoard extends StatelessWidget {
  const ScoreBoard({super.key});

  @override
  Widget build(BuildContext context) {
    RoomDataProvider roomDataProvider = Provider.of<RoomDataProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                roomDataProvider.player1.nickname,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: "font5",
                ),
              ),
              Text(
                roomDataProvider.player1.points.toInt().toString(),
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: "font5",
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                roomDataProvider.player2.nickname,
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: "font5",
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                roomDataProvider.player2.points.toInt().toString(),
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: "font5",
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
