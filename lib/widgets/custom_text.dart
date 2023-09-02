import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final List<Shadow> shadows;
  final String text;
  final double size;
  const CustomText({super.key, required this.shadows, required this.text, required this.size});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white,
        shadows: shadows,
        fontSize: size,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
