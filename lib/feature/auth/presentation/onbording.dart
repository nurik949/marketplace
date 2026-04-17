import 'package:flutter/material.dart';

import '../widgets/App_choice_button.dart';

class Onbording extends StatefulWidget {
  const Onbording({super.key});

  @override
  State<Onbording> createState() => _OnbordingState();
}

class _OnbordingState extends State<Onbording> {

  int selectedButton = 0;

  List<String> data = [
    'Men',
    'Women'
  ];

  List<String> images = [
    'assets/images/men_nastule.png',
    'assets/images/women.png'
  ];


  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        alignment: .bottomCenter,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(images[selectedButton]),
          ),
          gradient: LinearGradient(
            colors: [Color(0xFF536169),Color(0xFF29363D)],
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
          ),
        ),
        child: Container(
          width: .infinity,
          height: height * 0.270,
          margin: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Color(0xFF29363D),
            borderRadius: BorderRadius.circular(20)
          ),
          child: Column(
            children: [
              SizedBox(height: 20,),
              Text('Look Good, Feel Good',style: TextStyle(color: Color(0xFFF5F8FB),fontSize: 30),),
              Text('Create your individual & unique style and\n                  look amazing everyday.',style: TextStyle(color: Color(0xFF8F959E),fontSize: 15),),
              SizedBox(height: 15,),
              SizedBox(
                height: 70,
                child: ListView.builder(
                  shrinkWrap: true,
                    itemCount: 2,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index){
                      return AppChoiceButton(
                        text: data[index],
                        color: selectedButton == index ? 0xFF9775FA : 0xFFFFFFFF,
                        textColor:  selectedButton == index ? 0xFFFFFFFF : 0xFF8F959E,
                        onPressed: (){
                          setState(() {
                            selectedButton = index;
                          });
                        },
                      );
                    }),
              ),
              SizedBox(height: 6,),
              Text('Skip',style: TextStyle(color: Color(0xFF8F959E)),),
            ],
          ),
        ),
      ),
    );
  }
}
