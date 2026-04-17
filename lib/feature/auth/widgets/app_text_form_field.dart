import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  final String title;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const AppTextFormField({
    super.key,
    required this.title,
    this.validator,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only( bottom: 20),
      child: Column(
        crossAxisAlignment: .start,
        mainAxisSize: .min,
        children: [
          Text(
            title,
            style: TextStyle(
                color: Color(0xFF8F959E)),),
          TextFormField(
            controller: controller,
            style: TextStyle(color: Colors.white),
            validator: validator,
          ),
        ],
      ),
    );
  }
}