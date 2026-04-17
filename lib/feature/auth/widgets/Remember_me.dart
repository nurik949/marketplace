import 'package:flutter/material.dart';

class remember_me extends StatelessWidget {
  final String rem;

  const remember_me({
    super.key,
    required this.rem
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      mainAxisSize: .min,
      children: [
        Text(
          rem,
        ),
      ],
    );
  }
}
