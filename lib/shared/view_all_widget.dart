import 'package:flutter/material.dart';

class ViewAllWidget extends StatelessWidget {
  final String title;
  final Function()? onTap;
  final String? text;

  const ViewAllWidget({
    super.key,
    required this.title,
    this.onTap,
    this.text = 'View all',
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,style: TextStyle(color: Colors.white,fontSize: 20),),
          TextButton(
            onPressed: onTap,
            child: Text(
              text!,
              style: TextStyle(fontSize: 15, color: Color(0xFF9775FA), fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }
}