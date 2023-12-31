import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socketio_ttt/intro_screens/intro_page1.dart';
import 'package:socketio_ttt/provider/room_data_provider.dart';
import 'package:socketio_ttt/screens/create_room.dart';
import 'package:socketio_ttt/screens/game_screen.dart';
import 'package:socketio_ttt/screens/join_room.dart';
import 'package:socketio_ttt/screens/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => RoomDataProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.grey.shade900,
        ),
        routes: {
          introPage.routeName: (context) => const introPage(),
          Menu.routeName: (context) => const Menu(),
          CreateRoom.routeName: (context) => const CreateRoom(),
          JoinRoom.routeName: (context) => const JoinRoom(),
          GameScreen.routeName: (context) => const GameScreen(),
        },
        initialRoute: introPage.routeName,
      ),
    );
  }
}
