import 'package:flutter/material.dart';
import 'package:socketio_ttt/utils/colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final bool isReadOnly;
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hint,
    this.isReadOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.blue, blurRadius: 5, spreadRadius: 2)
        ],
      ),
      child: TextField(
        controller: controller,
        readOnly: isReadOnly,
        decoration: InputDecoration(
          fillColor: bgcolor,
          filled: true,
          hintText: hint,
        ),
      ),
    );
  }
}
