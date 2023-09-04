import 'package:flutter/material.dart';
import 'package:socketio_ttt/models/player.dart';

class RoomDataProvider extends ChangeNotifier {
  Map<String, dynamic> _roomData = {};
  List<String> _displayElements = List.filled(9, '');
  int _filledBoxes = 0;
  Player _player1 = Player(
    nickname: '',
    socketId: '',
    points: 0,
    playerType: 'X',
  );
  Player _player2 = Player(
    nickname: '',
    socketId: '',
    points: 0,
    playerType: 'O',
  );

  Map<String, dynamic> get roomData => _roomData;
  List<String> get displayElements => _displayElements;
  Player get player1 => _player1;
  Player get player2 => _player2;
  int get filledBoxes => _filledBoxes;

  void updateroomdata(Map<String, dynamic> data) {
    _roomData = data;
    notifyListeners();
  }

  void updatePlayer1(Map<String, dynamic> player1data) {
    _player1 = Player.fromMap(player1data);
    notifyListeners();
  }

  void updatePlayer2(Map<String, dynamic> player2data) {
    _player2 = Player.fromMap(player2data);
    notifyListeners();
  }

  void updateDisplayElements(int index, String choice) {
    _displayElements[index] = choice;
    _filledBoxes++;
    notifyListeners();
  }
}
