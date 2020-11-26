import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:godashdemo/petitionatlas/response/walksheetstreetresponse/Street_response.dart';
import 'package:godashdemo/petitionatlas/supportvoter/SupportVoter.dart';
import 'package:godashdemo/petitionatlas/walksheet/Walksheet.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class SelectVoter extends StatefulWidget {
  SelectVoterState createState() => SelectVoterState();
}

class SelectVoterState extends State<SelectVoter> {
  List<StreetResponse> walksheetlist = WalksheetState.streetResponse;
  final searchvoterlist = new List<StreetResponse>();
  final NH_CODE = "1";
  final IN_CODE = "2";

  String token;

  @override
  void initState() {
    searchvoterlist.addAll(walksheetlist);
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

    final searchbar = Container(
      // padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Row(
        children: <Widget>[
          // Container(
          Flexible(
            child: TextFormField(
              onTap: () {
                // senddata(context, placenameController);
              },
              onChanged: (value) {
                filterSearchResults(value);
              },
              cursorColor: _getColorFromHex('#128598'),
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                isDense: true,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: _getColorFromHex('#128598')),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: _getColorFromHex('#128598')),
                ),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: _getColorFromHex('#128598')),
                ),
                hintText: 'Search Voter',
                hintStyle: TextStyle(color: _getColorFromHex("#a2acbb")),
                contentPadding: EdgeInsets.fromLTRB(5.0, 0, 0.0, 5.0),
              ),
            ),
          ),
          // ),
          Icon(
            Icons.search,
            color: _getColorFromHex('#128598'),
          ),
        ],
      ),
    );

    Widget selectvoterlistview(StreetResponse walksheetlist) {
      return new Row(
        children: <Widget>[
          Container(
              margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
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
      backgroundColor: _getColorFromHex("#d0d4db"),
      appBar: AppBar(
        backgroundColor: _getColorFromHex("#128598"),
        title: Text(
          'Select Voter',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: new Image.asset("images/anchor.png"),
            onPressed: () {},
          )
        ],
      ),
      body: WillPopScope(
        onWillPop: _onBackPressed,
        child: Container(
          margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              searchbar,
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: searchvoterlist.length,
                  itemBuilder: (context, int i) => Column(
                    children: [selectvoterlistview(searchvoterlist[i])],
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

/*  Future<void>*/
  changesignaturestatus(String voterid, String code) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'authorization': 'Bearer ' + token
    };

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

      for (int i = 0; i <= walksheetlist.length; i++) {
        if (walksheetlist[i].id == voterid) {
          // walksheetlist[i].se = code;
        }
      }

      Navigator.pop(context);
    } else {
      // If that call was not successful (response was unexpected), it throw an error.
      Navigator.pop(context);
      throw Exception('Failed to load post');
    }
  }

  // void getsharedprefences() async {
  //   SharedPreferences sp = await SharedPreferences.getInstance();
  //   var county,
  //       city,
  //       pct,
  //       ward,
  //       street,
  //       startblock,
  //       endblock,
  //       maincampaignid,
  //       token;
  //   county = sp.getString('county');
  //   city = sp.getString('city');
  //   pct = sp.getString("precinct");
  //   ward = sp.getString("ward");
  //   street = sp.getString("street");
  //   startblock = sp.getString("startblock");
  //   endblock = sp.getString("endblock");
  //   maincampaignid = sp.getString("maincampaignid");
  //   token = sp.getString("token");
  //
  //   new Future.delayed(const Duration(seconds: 5), () {
  //     _showLoaderDialog(context);
  //     walksheetstreetapi(county, city, pct, ward, street, startblock, endblock,
  //         maincampaignid, token);
  //   });
  // }

  getsharedprefences() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    setState(() {
      token = sp.getString("token");
    });
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

  void filterSearchResults(String query) {
    if (query.isNotEmpty) {
      List<StreetResponse> dummyListData = List<StreetResponse>();
      for (var name in walksheetlist) {
        if (name.fullName.contains(query.toUpperCase())) {
          dummyListData.add(name);
        }
      }
      setState(() {
        searchvoterlist.clear();
        searchvoterlist.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        searchvoterlist.clear();
        searchvoterlist.addAll(walksheetlist);
      });
    }
  }
}
