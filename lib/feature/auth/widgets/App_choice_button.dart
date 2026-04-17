import 'package:flutter/material.dart';

class AppChoiceButton extends StatelessWidget {
  final String text;
  final int color;
  final int textColor;
  final void Function() onPressed;


  const AppChoiceButton({
    super.key,
    required this.text,
    required this.color,
    required this.textColor, required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize: Size(152, 60),
          backgroundColor: Color(color),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w700,
            color: Color(textColor),
          ),
        ),
      ),
    );
  }
}