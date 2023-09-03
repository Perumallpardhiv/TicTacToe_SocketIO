import 'package:flutter/material.dart';
import 'package:socketio_ttt/screens/create_room.dart';
import 'package:socketio_ttt/screens/game_screen.dart';
import 'package:socketio_ttt/screens/join_room.dart';
import 'package:socketio_ttt/screens/menu.dart';
import 'package:socketio_ttt/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgcolor,
      ),
      routes: {
        Menu.routeName: (context) => const Menu(),
        CreateRoom.routeName: (context) => const CreateRoom(),
        JoinRoom.routeName : (context) => const JoinRoom(),
        GameScreen.routeName : (context) => const GameScreen(),
      },
      initialRoute: Menu.routeName,
    );
  }
}
