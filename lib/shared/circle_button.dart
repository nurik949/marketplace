import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final String image;
  final Function()? onTap;
  const CircleButton({super.key,  this.image = 'assets/images/onboarding.png', this.onTap,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: CircleAvatar(child: Image.asset(image))
    );
  }
}