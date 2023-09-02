import 'package:flutter/material.dart';
import 'package:socketio_ttt/responsive/responsive.dart';
import 'package:socketio_ttt/widgets/custom_button.dart';

class Menu extends StatelessWidget {
  static String routeName = '/main-menu';
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(onTap: () {}, text: 'Create Room'),
            const SizedBox(height: 20),
            CustomButton(onTap: () {}, text: 'Join Room'),
          ],
        ),
      ),
    );
  }
}
