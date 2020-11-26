import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:godashdemo/petitionatlas/response/loginresponse/Loginresponsse.dart';
import 'package:godashdemo/petitionatlas/response/searchvoterresponse/Search_voter_response.dart';
import 'package:godashdemo/petitionatlas/response/walksheetstreetresponse/Street_response.dart';
import 'package:godashdemo/petitionatlas/supportvoter/SupportVoter.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SearchVoter extends StatefulWidget {
  SearchVoterState createState() => SearchVoterState();
}

class SearchVoterState extends State<SearchVoter> {
  List<StreetResponse> walksheetlist = new List<StreetResponse>();
  Loginresponsse user;

  String token, firstname, lastname, streetname, streetnumber;

  String maincampaignid;

  TextEditingController firstnamecontroller = TextEditingController();

  TextEditingController lastnamecontroller = TextEditingController();

  TextEditingController housenumbercontroller = TextEditingController();

  TextEditingController streetcontroller = TextEditingController();

  final NH_CODE = "1";
  final IN_CODE = "2";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getsharedprefences();
  }

  @override
  Widget build(BuildContext context) {
    Future<bool> _onBackPressed() {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            Navigator.of(context).pop(true);
          });
    }

    final searchvoter = Container(
      margin: EdgeInsets.only(top: 20.0, bottom: 10.0),
      padding: EdgeInsets.only(left: 70.0, right: 60.0),
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: _getColorFromHex("#128598"),
        textColor: Colors.white,
        padding: EdgeInsets.all(15),
        onPressed: () {
          _showLoaderDialog(context);
          walksheetstreetapi();
        },
        child: Text(
          "Search Voter",
          style: TextStyle(
            fontSize: 14.0,
          ),
        ),
      ),
    );

    final firstname = Container(
      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Text("First Name"),
    );

    final firstnameinput = Container(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5))),
      margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
      child: TextFormField(
          controller: firstnamecontroller,
          cursorColor: _getColorFromHex("#128598"),
          decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            hintStyle:
                TextStyle(color: _getColorFromHex("#757575"), fontSize: 14),
          )),
    );

    final lastname = Container(
      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Text("Last Name"),
    );

    final lastnameinput = Container(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5))),
      margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
      child: TextFormField(
          controller: lastnamecontroller,
          cursorColor: _getColorFromHex("#128598"),
          decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            hintStyle:
                TextStyle(color: _getColorFromHex("#757575"), fontSize: 14),
          )),
    );

    final housenumber = Container(
      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Text("House Number"),
    );

    final housenumberinput = Container(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5))),
      margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
      child: TextFormField(
          controller: housenumbercontroller,
          cursorColor: _getColorFromHex("#128598"),
          decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            hintStyle:
                TextStyle(color: _getColorFromHex("#757575"), fontSize: 14),
          )),
    );
    final street = Container(
      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Text("Street"),
    );

    final streetinput = Container(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5))),
      margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
      child: TextFormField(
          controller: streetcontroller,
          cursorColor: _getColorFromHex("#128598"),
          decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            hintStyle:
                TextStyle(color: _getColorFromHex("#757575"), fontSize: 14),
          )),
    );

    Widget selectvoterlistview(StreetResponse walksheetlist) {
      return new Row(
        children: <Widget>[
          Container(
              margin: EdgeInsets.only(top: 5.0, bottom: 10.0),
              padding: EdgeInsets.only(
                  top: 10.0, bottom: 10.0, left: 10.0, right: 5.0),
              width: 200,
              decoration: BoxDecoration(
                  color: walksheetlist.support.signatureStatus == 1
                      ? _getColorFromHex("#D7951C")
                      : walksheetlist.support.signatureStatus == 2
                          ? _getColorFromHex("#D7951C")
                          : _getColorFromHex("#128598"),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: new GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SupportVoter(walksheetlist),
                        ));
                  },
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      new Text(
                        walksheetlist.fullName,
                        style: TextStyle(color: Colors.white),
                      ),
                      new Text(walksheetlist.fullAddress,
                          style: TextStyle(color: Colors.white))
                    ],
                  ))),
          new Column(children: <Widget>[
            Container(
                margin: EdgeInsets.only(left: 10.0, top: 5.0, bottom: 5.0),
                padding: EdgeInsets.only(
                    top: 17.0, bottom: 17.0, left: 15.0, right: 15.0),
                decoration: BoxDecoration(
                    color: walksheetlist.support.signatureStatus == 1
                        ? _getColorFromHex("#A84037")
                        : _getColorFromHex("#128598"),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: InkWell(
                  child: Text("NH", style: TextStyle(color: Colors.white)),
                  onTap: () {
                    _showLoaderDialog(context);
                    changesignaturestatus(walksheetlist.id.toString(), NH_CODE);
                  },
                ))
          ]),
          new Column(children: <Widget>[
            Container(
                margin: EdgeInsets.only(left: 10.0, top: 5.0, bottom: 5.0),
                padding: EdgeInsets.only(
                    top: 17.0, bottom: 17.0, left: 15.0, right: 15.0),
                decoration: BoxDecoration(
                    color: walksheetlist.support.signatureStatus == 2
                        ? _getColorFromHex("#A84037")
                        : _getColorFromHex("#128598"),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: InkWell(
                  child: Text("IN", style: TextStyle(color: Colors.white)),
                  onTap: () {
                    _showLoaderDialog(context);
                    changesignaturestatus(walksheetlist.id.toString(), IN_CODE);
                  },
                ))
          ])
        ],
      );
    }

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: _getColorFromHex("#CED4DA"),
      appBar: AppBar(
        backgroundColor: _getColorFromHex("#128598"),
        title: Text(
          'Search Voter',
          style: TextStyle(fontSize: 14, color: Colors.white),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: new Image.asset("images/anchor.png"),
            onPressed: () {
              // do something
            },
          )
        ],
      ),
      body: WillPopScope(
        onWillPop: _onBackPressed,
        child: Container(
          margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              firstname,
              firstnameinput,
              lastname,
              lastnameinput,
              housenumber,
              housenumberinput,
              street,
              streetinput,
              searchvoter,
              Expanded(
                child: ListView.builder(
                  itemCount: walksheetlist.length,
                  itemBuilder: (context, int i) => Column(
                    children: [selectvoterlistview(walksheetlist[i])],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
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

  Future<StreetResponse> walksheetstreetapi() async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'authorization': 'Bearer ' + token
    };

    if (firstnamecontroller.value.text != null &&
        firstnamecontroller.value.text.trim().length > 0) {
      firstname = firstnamecontroller.value.text;
    }
    if (lastnamecontroller.value.text != null &&
        lastnamecontroller.value.text.trim().length > 0) {
      lastname = lastnamecontroller.value.text;
    }
    if (streetcontroller.value.text != null &&
        streetcontroller.value.text.trim().length > 0) {
      streetname = streetcontroller.value.text;
    }
    if (housenumbercontroller.value.text != null &&
        housenumbercontroller.value.text.trim().length > 0) {
      streetnumber = housenumbercontroller.value.text;
    }

    print(firstname);
    print(lastname);
    print(streetname);
    print(streetnumber);
    print(token);

    var queryParameters = {
      'firstName': firstname,
      'lastName': lastname,
      'streetName': streetname,
      'streetNumber': streetnumber
    };
    var uri = Uri.https(
        'petitionatlas.com', '/voters/' + maincampaignid, queryParameters);

    var response = await http.get(
      uri,
      headers: headers,
    );

    if (response.statusCode == 200) {
      // If the call to the server was successful (returns OK), parse the JSON.
      print("success");
      Navigator.pop(context);
      List<dynamic> values = json.decode(response.body);
      if (values.length > 0) {
        Map<String, dynamic> map;
        for (int i = 0; i < values.length; i++) {
          if (values[i] != null) {
            map = values[i];
            walksheetlist.add(StreetResponse.fromJson(map));
          }
        }
        setState(() {});
      }
    } else {
      // If that call was not successful (response was unexpected), it throw an error.
      Navigator.pop(context);
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

  getsharedprefences() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    Map json = jsonDecode(sp.getString('logindata'));
    user = Loginresponsse.fromJson(json);
    setState(() {
      token = user.tokens.accessToken;
      maincampaignid = user.mainCampaignId.toString();
      print(maincampaignid);
      print(token);
    });
  }

  changesignaturestatus(String voterid, String code) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'authorization': 'Bearer ' + token
    };

    // print(token);
    // print(voterid);

    Map data = {
      'SignatureStatus': code,
    };
    String body = json.encode(data);
    var response = await http.post(
        'https://petitionatlas.com/voters/signature-status/' + voterid,
        headers: headers,
        body: body);
    // Navigator.pop(context);
    // print(response.statusCode);

    if (response.statusCode == 200) {
      // If the call to the server was successful (returns OK), parse the JSON.
      print("success");
      Navigator.pop(context);
    } else {
      // If that call was not successful (response was unexpected), it throw an error.
      Navigator.pop(context);
      throw Exception('Failed to load post');
    }
  }
//
// Color getMyColor(int moneyCounter) {
//   if (moneyCounter == 1000) then {
//     return ;
//   } else
//   if (moneyCounter == 2000) then {
//   return Colors.red;
//   }
// }
}
