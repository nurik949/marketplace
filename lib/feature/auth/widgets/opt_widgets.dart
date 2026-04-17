import 'package:flutter/material.dart';

class OtpWidget extends StatelessWidget {
  const OtpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(

        maxLength: 1,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20),
        maxLines: 1,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          counterText: '',
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(vertical: 30)),
      ),
    );
  }
}