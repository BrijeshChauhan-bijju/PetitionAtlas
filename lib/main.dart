import 'package:flutter/material.dart';
import 'package:godashdemo/petitionatlas/addcontact/AddContact.dart';
import 'package:godashdemo/petitionatlas/dashboard/Dashboard.dart';
import 'package:godashdemo/petitionatlas/login/PetitionAtlasLogin.dart';
import 'package:godashdemo/petitionatlas/searchvoter/SearchVoter.dart';
import 'package:godashdemo/petitionatlas/selectvoter/SelectVoter.dart';
import 'package:godashdemo/petitionatlas/splash/SplashScreen.dart';
import 'package:godashdemo/petitionatlas/walksheet/Walksheet.dart';

void main() {
  runApp(GoDashDemo());
}

class GoDashDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => Login(),
        '/dashboard': (context) => Dashboard(),
        '/walksheet': (context) => Walksheet(),
        '/selectvoter': (context) => SelectVoter(),
        '/searchvoter': (context) => SearchVoter(),
        '/addcontact': (context) => AddContact()
      },
    );
  }
}
