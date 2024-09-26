import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {

const SplashScreen({ super.key });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Center(
        child: Image.asset('assets/stop.png', width: 200, height: 200,),
      ),
    );
  }
}