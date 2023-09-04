import 'package:flutter/material.dart';
import 'package:socketio_ttt/resources/socketio_methods.dart';
import 'package:socketio_ttt/responsive/responsive.dart';
import 'package:socketio_ttt/widgets/custom_button.dart';
import 'package:socketio_ttt/widgets/custom_text.dart';
import 'package:socketio_ttt/widgets/custom_textfield.dart';

class JoinRoom extends StatefulWidget {
  static String routeName = '/join-room';
  const JoinRoom({super.key});

  @override
  State<JoinRoom> createState() => _JoinRoomState();
}

class _JoinRoomState extends State<JoinRoom> {
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _gameIdcontroller = TextEditingController();
  final SocketMethods _socketMethods = SocketMethods();

  @override
  void initState() {
    super.initState();
    _socketMethods.joinRoomSuccessListener(context);
    _socketMethods.errorOccuredListener(context);
    _socketMethods.updatePlayersStateListener(context);
  }

  @override
  void dispose() {
    super.dispose();
    _namecontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Responsive(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomText(
                shadows: [Shadow(blurRadius: 40, color: Colors.blue)],
                text: 'Join Room',
                size: 70,
              ),
              SizedBox(height: size.height * 0.1),
              CustomTextField(
                controller: _namecontroller,
                hint: 'Enter your nickname',
              ),
              SizedBox(height: size.height * 0.02),
              CustomTextField(
                controller: _gameIdcontroller,
                hint: 'Enter Game id',
              ),
              SizedBox(height: size.height * 0.04),
              CustomButton(
                  onTap: () {
                    _socketMethods.joinRoom(
                        _namecontroller.text, _gameIdcontroller.text);
                  },
                  text: 'Join'),
            ],
          ),
        ),
      ),
    );
  }
}
