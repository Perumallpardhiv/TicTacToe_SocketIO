import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:socketio_ttt/provider/room_data_provider.dart';
import 'package:socketio_ttt/resources/game_methods.dart';
import 'package:socketio_ttt/resources/socketio_client.dart';
import 'package:socketio_ttt/screens/game_screen.dart';
import 'package:socketio_ttt/utils/utils.dart';

class SocketMethods {
  final _socketClient = SocketClient.instance.socket;

  Socket get socketClient => _socketClient!;

  void createRoom(String nickname) {
    if (nickname.isNotEmpty) {
      _socketClient!.emit('createRoom', {'nickname': nickname});
    }
  }

  void joinRoom(String nickname, String roomId) {
    if (nickname.isNotEmpty && roomId.isNotEmpty) {
      _socketClient!.emit('joinRoom', {'nickname': nickname, 'roomId': roomId});
    }
  }

  void tapGrid(int index, String roomId, List<String> displayElements) {
    if (displayElements[index] == '') {
      _socketClient!.emit('tap', {
        'index': index,
        'roomId': roomId,
      });
    }
  }

  void playAgain(String roomId) {
    _socketClient!.emit('playAgain', {'roomId': roomId});
  }

  //LISTENERS
  void createRoomSuccessListener(BuildContext context) {
    _socketClient!.on('createRoomSuccess', (room) {
      Provider.of<RoomDataProvider>(context, listen: false)
          .updateroomdata(room);
      Navigator.pushNamed(context, GameScreen.routeName);
    });
  }

  void joinRoomSuccessListener(BuildContext context) {
    _socketClient!.on('joinRoomSuccess', (room) {
      Provider.of<RoomDataProvider>(context, listen: false)
          .updateroomdata(room);
      Navigator.pushNamed(context, GameScreen.routeName);
    });
  }

  void errorOccuredListener(BuildContext context) {
    _socketClient!.on('errorOccured', (error) {
      showSnackBar(context, error);
    });
  }

  void updatePlayersStateListener(BuildContext context) {
    _socketClient!.on('updatePlayers', (data) {
      Provider.of<RoomDataProvider>(context, listen: false)
          .updatePlayer1(data[0]);
      Provider.of<RoomDataProvider>(context, listen: false)
          .updatePlayer2(data[1]);
    });
  }

  void updateRoomListener(BuildContext context) {
    _socketClient!.on('updateRoom', (room) {
      Provider.of<RoomDataProvider>(context, listen: false)
          .updateroomdata(room);
    });
  }

  void tappedListener(BuildContext context) {
    _socketClient!.on('tapped', (data) {
      Provider.of<RoomDataProvider>(context, listen: false)
          .updateDisplayElements(data['index'], data['choice']);

      Provider.of<RoomDataProvider>(context, listen: false)
          .updateroomdata(data['room']);

      print(data['room']['displayElements']);

      Provider.of<RoomDataProvider>(context, listen: false)
          .updateAllDisplayElements(data['room']['displayElements']);

      GameMethods().checkWinner(context, socketClient);
    });
  }

  void playAgainListener(BuildContext context) {
    _socketClient!.on('playAgainListener', (room) {
      Provider.of<RoomDataProvider>(context, listen: false)
          .updateroomdata(room);

      print(room['displayElements']);

      Provider.of<RoomDataProvider>(context, listen: false)
          .updateAllDisplayElements(room['displayElements']);

      Provider.of<RoomDataProvider>(context, listen: false)
          .setFilledBoxestoZero();
    });
  }

  void pointIncreaseListener(BuildContext context) {
    _socketClient!.on('pointIncrease', (winner) {
      RoomDataProvider roomDataProvider =
          Provider.of<RoomDataProvider>(context, listen: false);
      if (winner['socketId'] == roomDataProvider.player1.socketId) {
        roomDataProvider.updatePlayer1(winner);
      } else {
        roomDataProvider.updatePlayer2(winner);
      }
      roomDataProvider.setFilledBoxestoZero();
    });
  }

  void gameEndListener(BuildContext context) {
    _socketClient!.on('gameEnd', (winner) {
      Navigator.pop(context);
      Navigator.pop(context);
      showDialogBox2(context, winner['nickname'] + ' won the game!');
    });
  }
}
