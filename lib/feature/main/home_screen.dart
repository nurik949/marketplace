import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeScreen1 extends StatefulWidget {
  const HomeScreen1({super.key});

  @override
  State<HomeScreen1> createState() => _HomeScreen1State();
}

class _HomeScreen1State extends State<HomeScreen1> {

  bool isSwitched = false;

  void logout() async {
    try {
      await Supabase.instance.client.auth.signOut();

      if (!mounted) return;

      Navigator.pushReplacementNamed(context, '/login');
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1B262C),
      appBar: AppBar(
        backgroundColor: Color(0xFF1B262C),
      ),
      drawer: Drawer(
        backgroundColor: Color(0xFF1B262C),
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              SizedBox(height: 140,),
              Row(
                children: [
                  CircleAvatar(
                    child: Image.asset('assets/menus.png'),
                  ),
                  SizedBox(width: 20,),
                  Text('Mrh Raju',style: TextStyle(color: Colors.white,fontSize: 20),)
                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Text('Dark Mode',style: TextStyle(color: Colors.white,fontSize: 20),),
                  Switch(
                      inactiveTrackColor: Colors.grey,
                      activeTrackColor: Colors.green,
                      activeThumbColor: Colors.white,
                      value: isSwitched, onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                    });
                  }
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Text('Account Information',style: TextStyle(color: Colors.white,fontSize: 20),),
              SizedBox(height: 20,),
              Text('Password',style: TextStyle(color: Colors.white,fontSize: 20),),
              SizedBox(height: 20,),
              Text('Order',style: TextStyle(color: Colors.white,fontSize: 20),),
              SizedBox(height: 20,),
              Text('My Cards',style: TextStyle(color: Colors.white,fontSize: 20),),
              SizedBox(height: 20,),
              Text('Wishlist',style: TextStyle(color: Colors.white,fontSize: 20),),
              SizedBox(height: 20,),
              Text('Settings',style: TextStyle(color: Colors.white,fontSize: 20),),
              SizedBox(height: 200,),
              TextButton(
                onPressed: logout,
                child: Text(
                  'logout',
                  style: TextStyle(fontSize: 20, color: Colors.red),
                ),
              )
            ],
          ),
        ),
      ),
      body: TextButton(
        onPressed: logout,
        child: Text(
          'Выйти из приложения',
          style: TextStyle(fontSize: 20, color: Colors.red),
        ),
      ),
    );
  }
}