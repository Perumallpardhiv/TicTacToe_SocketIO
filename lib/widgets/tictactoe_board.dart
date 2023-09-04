import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socketio_ttt/provider/room_data_provider.dart';
import 'package:socketio_ttt/resources/socketio_methods.dart';

class TicTacToeBoard extends StatefulWidget {
  const TicTacToeBoard({super.key});

  @override
  State<TicTacToeBoard> createState() => _TicTacToeBoardState();
}

class _TicTacToeBoardState extends State<TicTacToeBoard> {
  SocketMethods _socketMethods = SocketMethods();

  @override
  void initState() {
    super.initState();
    _socketMethods.tappedListener(context);
  }

  @override
  Widget build(BuildContext context) {
    RoomDataProvider roomDataProvider = Provider.of<RoomDataProvider>(context);
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.7,
        maxWidth: 450,
      ),
      child: GridView.builder(
        itemCount: 9,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemBuilder: (BuildContext context, int index) {
          return AbsorbPointer( // if absorbing is true, the widget will not respond to any touch events
            absorbing: roomDataProvider.roomData['turn']['socketId'] != _socketMethods.socketClient.id, // added this to avoid same user tapping twice
            child: GestureDetector(
              onTap: () {
                _socketMethods.tapGrid(
                  index,
                  roomDataProvider.roomData['_id'],
                  roomDataProvider.displayElements,
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white24),
                ),
                child: Center(
                  child: AnimatedSize(
                    duration: Duration(milliseconds: 200),
                    child: Text(
                      roomDataProvider.displayElements[index],
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 80,
                        shadows: [
                          Shadow(
                            color: roomDataProvider.displayElements[index] == 'X'
                                ? Colors.blue
                                : Colors.red,
                            blurRadius: 40,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
