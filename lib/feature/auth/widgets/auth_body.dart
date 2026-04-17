import 'package:flutter/material.dart';

class AuthBody1 extends StatelessWidget {
  final String title;
  final String textButton;
  final Widget body;
  final Function()? onPressed;

  const AuthBody1({
    super.key,
    required this.title,
    required this.textButton,
    required this.body,
    this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1D1E20),
      appBar: AppBar(
        backgroundColor: Color(0xFF1D1E20),
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: CircleAvatar(child: Icon(Icons.arrow_back,color: Colors.white,),backgroundColor: Color(0xFF222E34),),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 25),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.w200, fontSize: 28,color: Color(0xFFF5F8FB)),
            ),
            Expanded(child: body),

          ],
        ),
      ),
      bottomNavigationBar: ElevatedButton(
        onPressed: onPressed,
        child: Text(textButton,style: TextStyle(color: Colors.white),),
        style: ElevatedButton.styleFrom(
          minimumSize: Size(.infinity, 75),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
          backgroundColor: Color(0xFF9775FA),
        ),
      ),
    );
  }
}