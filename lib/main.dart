import 'package:flutter/material.dart';
import 'package:godashdemo/PrivacySelection/PrivacySelection.dart';
import 'package:godashdemo/demoui/Demoui.dart';
import 'package:godashdemo/descriptionplaces/DescriptionPlacesSelection.dart';
import 'package:godashdemo/petitionatlas/dashboard/Dashboard.dart';
import 'package:godashdemo/petitionatlas/login/PetitionAtlasLogin.dart';
import 'package:godashdemo/petitionatlas/selectvoter/SelectVoter.dart';
import 'package:godashdemo/petitionatlas/supportvoter/SupportVoter.dart';
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
        '/': (context) => Login(),
        '/dashboard': (context) => Dashboard(),
        '/walksheet' : (context) => Walksheet(),
        '/selectvoter' : (context) => SelectVoter(),
        '/supportvoter' : (context) => SupportVoter()
      },
    );
  }
}
