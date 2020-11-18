import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter/widgets.dart';
import 'package:godashdemo/petitionatlas/params/Loginparams.dart';
import 'package:godashdemo/petitionatlas/response/dashboardresponse/dashboard_response.dart';
import 'package:godashdemo/petitionatlas/response/loginresponse/Loginresponsse.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Dashboard extends StatefulWidget {
  DashboardState createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
  Loginresponsse user;
  DashboardResponse dashboardresponse;
  String username1 = "";
  bool isadmin = false;
  String maincampaignname = "";
  String ans1 = "";
  String ans2 = "";
  String ans3 = "";
  double percentage = 0;

  @override
  void initState() {
    super.initState();
    getsharedprefences();
  }

  @override
  Widget build(BuildContext context) {
    var _scaffoldKey = new GlobalKey<ScaffoldState>();
    // getsharedprefences();
    // print("user " + user.username);
    // if (user != null && user.id != '' && user.tokens.accessToken != null) {
    //   _showLoaderDialog(context);
    //
    //   dashboardapi(user.id.toString(), user.tokens.accessToken);
    // }
    final image = Image.asset(
      'images/voteratlas.png',
      width: 200.0,
      height: 70.0,
      fit: BoxFit.fill,
    );

    final userlogo = Image.asset(
      'images/people.png',
      width: 30.0,
      height: 20.0,
      fit: BoxFit.fill,
    );

    final username = Text(
      username1,
      style: TextStyle(
          color: _getColorFromHex("#757575"),
          fontSize: 18,
          fontWeight: FontWeight.bold),
    );
    // print("user " + user.username);
    final usernameandlogo = Container(
      child: new Row(children: <Widget>[
        userlogo,
        SizedBox(
          width: 20,
        ),
        username
      ]),
    );

    final totalvoterslogo = Image.asset(
      'images/totalvoters.png',
      width: 30.0,
      height: 20.0,
      fit: BoxFit.fill,
    );

    final totalvotersque = Text(
      "Total Voters :",
      style: TextStyle(
          color: _getColorFromHex("#757575"),
          fontSize: 18,
          fontWeight: FontWeight.bold),
    );

    final totalvotersans = Text(
      ans1,
      style: TextStyle(
          color: _getColorFromHex("#128598"),
          fontSize: 18,
          fontWeight: FontWeight.bold),
    );

    final totalvoter = Container(
      child: new Row(children: <Widget>[
        totalvoterslogo,
        SizedBox(
          width: 20,
        ),
        totalvotersque,
        SizedBox(
          width: 20,
        ),
        totalvotersans
      ]),
    );

    final targetsignlogo = Image.asset(
      'images/targetedsignatures.png',
      width: 30.0,
      height: 20.0,
      fit: BoxFit.fill,
    );

    final targetsigque = Text(
      "Target Signatures :",
      style: TextStyle(
          color: _getColorFromHex("#757575"),
          fontSize: 18,
          fontWeight: FontWeight.bold),
    );

    final targetsignans = Text(
      ans2,
      style: TextStyle(
          color:_getColorFromHex("#128598"),
          fontSize: 18,
          fontWeight: FontWeight.bold),
    );

    final targetsign = Container(
      child: new Row(children: <Widget>[
        targetsignlogo,
        SizedBox(
          width: 20,
        ),
        targetsigque,
        SizedBox(
          width: 20,
        ),
        targetsignans
      ]),
    );

    final totalcollectedlogo = Image.asset(
      'images/totalcollected.png',
      width: 30.0,
      height: 20.0,
      fit: BoxFit.fill,
    );

    final totalcollectedque = Text(
      "Total Collected :",
      style: TextStyle(
          color: _getColorFromHex("#757575"),
          fontSize: 18,
          fontWeight: FontWeight.bold),
    );

    final totalcollectedans = Text(
      ans3,
      style: TextStyle(
          color: _getColorFromHex("#128598"),
          fontSize: 18,
          fontWeight: FontWeight.bold),
    );

    final totalcollected = Container(
      child: new Row(children: <Widget>[
        totalcollectedlogo,
        SizedBox(
          width: 20,
        ),
        totalcollectedque,
        SizedBox(
          width: 20,
        ),
        totalcollectedans
      ]),
    );

    // final progressbar = Container(
    //     child: FAProgressBar(
    //       currentValue: 80,
    //       displayText: '%',
    //       progressColor: _getColorFromHex("#128598"),
    //     )
    // );
    final progressbar = Container(
      padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          LinearProgressIndicator(
            backgroundColor: Colors.grey,
            value: percentage/100,
            valueColor:
                new AlwaysStoppedAnimation<Color>(_getColorFromHex("#128598")),
          ),
          Text(
            percentage.toStringAsFixed(0) + " %",
            // "",
          )
        ],
      ),
    );

    final getstartedtext = Text(
        'To get started, select "Walk Sheet" from the menu and enter your location.');

    final circleimage = new Container(
        width: 50.0,
        height: 60.0,
        decoration: new BoxDecoration(
            shape: BoxShape.circle,
            image: new DecorationImage(
                fit: BoxFit.fill, image: new AssetImage("images/user.png"))));

    final admin = Container(
        padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
        child: Column(
          children: <Widget>[
            Text(
              username1,
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                child: Visibility(
              child: Text(
                "Administrator",
                style: TextStyle(color: Colors.white),
              ),
              visible: isadmin,
            ))
          ],
        ));

    final dashboardicon = new Container(
        margin: EdgeInsets.all(10),
        width: 30.0,
        height: 30.0,
        decoration: new BoxDecoration(
            shape: BoxShape.rectangle,
            image: new DecorationImage(
                fit: BoxFit.fill,
                image: new AssetImage("images/dashboard.png"))));

    final dashboard = Container(
      margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: Text(
        "Dashboard",
        style: TextStyle(color: Colors.white),
      ),
    );

    final walksheeticon = new Container(
        margin: EdgeInsets.all(10),
        width: 30.0,
        height: 30.0,
        decoration: new BoxDecoration(
            shape: BoxShape.rectangle,
            image: new DecorationImage(
                fit: BoxFit.fill, image: new AssetImage("images/sheet.png"))));

    final walksheet = Container(
      margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: Text(
        "Walksheet",
        style: TextStyle(color: Colors.white),
      ),
    );
    final addcontacticon = new Container(
        margin: EdgeInsets.all(10),
        width: 30.0,
        height: 30.0,
        decoration: new BoxDecoration(
            shape: BoxShape.rectangle,
            image: new DecorationImage(
                fit: BoxFit.fill,
                image: new AssetImage("images/add_contact.png"))));

    final addcontact = Container(
      margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: Text(
        "Add Contact",
        style: TextStyle(color: Colors.white),
      ),
    );
    final searchvotericon = new Container(
        margin: EdgeInsets.all(10),
        width: 30.0,
        height: 30.0,
        decoration: new BoxDecoration(
            shape: BoxShape.rectangle,
            image: new DecorationImage(
                fit: BoxFit.fill,
                image: new AssetImage("images/search_voter.png"))));

    final searchvoter = Container(
      margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: Text(
        "Search Voter",
        style: TextStyle(color: Colors.white),
      ),
    );

    final signouticon = new Container(
        margin: EdgeInsets.all(10),
        width: 30.0,
        height: 30.0,
        decoration: new BoxDecoration(
            shape: BoxShape.rectangle,
            image: new DecorationImage(
                fit: BoxFit.fill, image: new AssetImage("images/logout.png"))));

    final signout = Container(
      margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: Text(
        "Sign Out",
        style: TextStyle(color: Colors.white),
      ),
    );

    final drawer = Container(
        width: 200,
        child: Drawer(
          child: Container(
            width: 50,
            color: _getColorFromHex("#364660"),
            child: ListView(
              children: [
                Container(
                  height: 90,
                  child: DrawerHeader(
                    child: Container(
                      // alignment: Alignment.topLeft,
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        //change here don't //worked
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[circleimage, admin],
                      ),
                    )
                    // child: Text("Header")
                    ,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                    height: 1.0,
                    width: 130.0,
                    color: _getColorFromHex("#128598"),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: _getColorFromHex("#128598"),
                    textColor: Colors.white,
                    padding: EdgeInsets.all(10),
                    onPressed: () {
                      Navigator.pushNamed(
                        context, '/dashboard',
                        // arguments: {'privacytype': "false"}
                      );
                    },
                    child: Text(
                      maincampaignname,
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                    height: 1.0,
                    width: 130.0,
                    color: _getColorFromHex("#128598"),
                  ),
                ),
                Container(
                  alignment: Alignment.topCenter,
                  child: new GestureDetector(
                    onTap: () {},
                    child: new Column(
                      children: <Widget>[
                        dashboardicon,
                        dashboard,
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                    height: 1.0,
                    width: 130.0,
                    color: _getColorFromHex("#128598"),
                  ),
                ),
                Container(
                  alignment: Alignment.topCenter,
                  child: new GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/walksheet',
                      );
                    },
                    child: new Column(
                      children: <Widget>[
                        walksheeticon,
                        walksheet,
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                    height: 1.0,
                    width: 130.0,
                    color: _getColorFromHex("#128598"),
                  ),
                ),
                Container(
                  alignment: Alignment.topCenter,
                  child: new GestureDetector(
                    onTap: () {},
                    child: new Column(
                      children: <Widget>[
                        addcontacticon,
                        addcontact,
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                    height: 1.0,
                    width: 130.0,
                    color: _getColorFromHex("#128598"),
                  ),
                ),
                Container(
                  alignment: Alignment.topCenter,
                  child: new GestureDetector(
                    onTap: () {},
                    child: new Column(
                      children: <Widget>[
                        searchvotericon,
                        searchvoter,
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                    height: 1.0,
                    width: 130.0,
                    color: _getColorFromHex("#128598"),
                  ),
                ),
                Container(
                  alignment: Alignment.topCenter,
                  child: new GestureDetector(
                    onTap: () {},
                    child: new Column(
                      children: <Widget>[
                        signouticon,
                        signout,
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                    height: 1.0,
                    width: 130.0,
                    color: _getColorFromHex("#128598"),
                  ),
                ),
              ],
            ),
          ),
        ));

    return Scaffold(
        key: _scaffoldKey,
        drawer: drawer,
        // endDrawer: drawer,
        appBar: AppBar(
          backgroundColor: _getColorFromHex("#128598"),
          title: Text(
            'Dashboard',
            style: TextStyle(fontSize: 14, color: Colors.white),
          ),
          actions: <Widget>[
            IconButton(
              icon: new Image.asset("images/anchor.png"),
              onPressed: () {
                // do something
              },
            )
          ],
          centerTitle: true,
          leading: new IconButton(
            icon: Icon(Icons.view_headline_sharp),
            onPressed: () {
              _scaffoldKey.currentState.openDrawer();
            },
          ),
          //   onPressed: () =>
          //       // {
          //       Scaffold.of(context).openDrawer(),
          //   // },
          // ),
          automaticallyImplyLeading: false,
          // actions: <Widget>[
          //   IconButton(alignment: A,icon: Icon(Icons.view_headline_sharp), onPressed: () {})
          // ],
        ),
        body: Container(
          margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              image,
              SizedBox(
                height: 30,
              ),
              usernameandlogo,
              SizedBox(
                height: 30,
              ),
              totalvoter,
              SizedBox(
                height: 30,
              ),
              targetsign,
              SizedBox(
                height: 30,
              ),
              totalcollected,
              SizedBox(
                height: 5,
              ),
              progressbar,
              SizedBox(
                height: 20,
              ),
              getstartedtext,
            ],
          ),
        ));
  }

  Color _getColorFromHex(String hexColor) {
    hexColor = hexColor.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }

  getsharedprefences() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    Map json = jsonDecode(sp.getString('logindata'));
    user = Loginresponsse.fromJson(json);
    setState(() {
      username1 = user.username;
      maincampaignname = user.mainCampaignName;
      isadmin = user.isAdmin;
      _showLoaderDialog(context);
      new Future.delayed(const Duration(seconds: 5), () {
        print(user.id.toString());
        print(user.tokens.accessToken);
        dashboardapi(user.mainCampaignId.toString(), user.tokens.accessToken);
      });
    });

    // setState(() {});
  }

  Future<DashboardResponse> dashboardapi(String id, String token) async {
    Map<String, String> headers = {'authorization': 'Bearer ' + token};

    var response1 = await http.get(
        'https://petitionatlas.com/campaigns/mobile/dashboard/' + id,
        headers: headers);

    if (response1.statusCode == 200) {
      // If the call to the server was successful (returns OK), parse the JSON.
      print("success");
      Navigator.pop(context);

      SharedPreferences prefs = await SharedPreferences.getInstance();
      Map json = jsonDecode(response1.body);
      dashboardresponse = DashboardResponse.fromJson(json);
      setState(() {
        var multiple = dashboardresponse.collectedSignaturesCount * 100;
        // percentage = 20;
        percentage = multiple / dashboardresponse.targetedSignaturesCount;
        ans1 = dashboardresponse.registeredVotersCount.toString();
        ans2 = dashboardresponse.targetedSignaturesCount.toString();
        ans3 = dashboardresponse.collectedSignaturesCount.toString();
      });
    } else {
      // If that call was not successful (response was unexpected), it throw an error.
      // Navigator.pop(context);
      throw Exception('Failed to load post');
    }
  }

  CircularProgressIndicator _showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(
              margin: EdgeInsets.only(left: 7), child: Text("Loading...")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
