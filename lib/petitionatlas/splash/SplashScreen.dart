import 'dart:async';

import 'package:flutter/material.dart';
import 'package:godashdemo/petitionatlas/login/PetitionAtlasLogin.dart';

class SplashScreen extends StatefulWidget {
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Login())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/whitespashscreen.png"),
                fit: BoxFit.cover)),
      ),
    );
  }
}
