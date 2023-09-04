import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:socketio_ttt/provider/room_data_provider.dart';
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
    });
  }
}
