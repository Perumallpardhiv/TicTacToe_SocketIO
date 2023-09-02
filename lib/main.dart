import 'package:flutter/material.dart';
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
        
      },
      home: const Menu(),
    );
  }
}
