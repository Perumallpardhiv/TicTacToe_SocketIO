import 'package:flutter/material.dart';
import 'package:socketio_ttt/resources/socketio_methods.dart';
import 'package:socketio_ttt/responsive/responsive.dart';
import 'package:socketio_ttt/widgets/custom_button.dart';
import 'package:socketio_ttt/widgets/custom_text.dart';
import 'package:socketio_ttt/widgets/custom_textfield.dart';

class CreateRoom extends StatefulWidget {
  static String routeName = '/create-room';
  const CreateRoom({super.key});

  @override
  State<CreateRoom> createState() => _CreateRoomState();
}

class _CreateRoomState extends State<CreateRoom> {
  final TextEditingController _namecontroller = TextEditingController();
  final SocketMethods _socketMethods = SocketMethods();

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
                text: 'Create Room',
                size: 70,
              ),
              SizedBox(height: size.height * 0.1),
              CustomTextField(
                controller: _namecontroller,
                hint: 'Enter your nickname',
              ),
              SizedBox(height: size.height * 0.04),
              CustomButton(
                  onTap: () {
                    _socketMethods.createRoom(_namecontroller.text);
                  },
                  text: 'Create'),
            ],
          ),
        ),
      ),
    );
  }
}
