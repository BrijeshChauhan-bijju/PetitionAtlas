import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:godashdemo/petitionatlas/response/loginresponse/Loginresponsse.dart';
import 'package:godashdemo/petitionatlas/response/walksheetresponse/walksheet_response.dart';
import 'package:godashdemo/petitionatlas/response/walksheetstreetresponse/Street_response.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Walksheet extends StatefulWidget {
  WalksheetState createState() => WalksheetState();
}

class WalksheetState extends State<Walksheet> {
  WalksheetResponse walksheetResponse;
  static List<StreetResponse> streetResponse = new List<StreetResponse>();
  Loginresponsse user;
  String token, maincampaignid;
  List countylist = ["Select County"],
      citylist = ["Select City"],
      pctlist = ["Select Pct"],
      wardlist = ["Select Ward"];
  String _countydropDownValue,
      _citydropDownValue,
      _pctdropDownValue,
      _warddropDownValue;

  // static var walksheetstreet;

  TextEditingController streetController = TextEditingController();
  TextEditingController startblockController = TextEditingController();
  TextEditingController endblockController = TextEditingController();

  @override
  void initState() {
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

    final county = Container(
      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Text("COUNTY"),
    );

    final countydropdown = Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5))),
        margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
        child: DropdownButtonHideUnderline(
            child: DropdownButton(
          hint: Text('Select County'),
          value: _countydropDownValue,
          isExpanded: true,
          iconSize: 30.0,
          style: TextStyle(color: Colors.black),
          items: countylist.map(
            (val) {
              return DropdownMenuItem(
                value: val,
                child: Text(val),
              );
            },
          ).toList(),
          onChanged: (val) {
            setState(
              () {
                _countydropDownValue = val;
              },
            );
          },
        )));

    final city = Container(
      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Text("CITY"),
    );

    final citydropdown = Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5))),
        margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
        child: DropdownButtonHideUnderline(
            child: DropdownButton(
          hint: Text('Select City'),
          value: _citydropDownValue,
          isExpanded: true,
          iconSize: 30.0,
          style: TextStyle(color: Colors.black),
          items: citylist.map<DropdownMenuItem>(
            (value) {
              return DropdownMenuItem(
                value: value,
                child: Text(value),
              );
            },
          ).toList(),
          onChanged: (value) {
            setState(
              () {
                _citydropDownValue = value;
              },
            );
          },
        )));

    final ward = Container(
      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Text("WARD"),
    );

    final warddropdown = Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5))),
        margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
        child: DropdownButtonHideUnderline(
            child: DropdownButton(
          hint: Text('Select Ward'),
          value: _warddropDownValue,
          isExpanded: true,
          iconSize: 30.0,
          style: TextStyle(color: Colors.black),
          items: wardlist.map(
            (val) {
              return DropdownMenuItem(
                value: val,
                child: Text(val),
              );
            },
          ).toList(),
          onChanged: (val) {
            setState(
              () {
                _warddropDownValue = val;
              },
            );
          },
        )));

    final pct = Container(
      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Text("PCT"),
    );

    final pctdropdown = Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5))),
        margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
        child: DropdownButtonHideUnderline(
            child: DropdownButton(
          hint: Text('Select Pct'),
          value: _pctdropDownValue,
          isExpanded: true,
          iconSize: 30.0,
          style: TextStyle(color: Colors.black),
          items: pctlist.map(
            (val) {
              return DropdownMenuItem(
                value: val,
                child: Text(val),
              );
            },
          ).toList(),
          onChanged: (val) {
            setState(
              () {
                _pctdropDownValue = val;
              },
            );
          },
        )));

    final wardsection = Expanded(
      child: new Container(
        // padding: new EdgeInsets.only(left: 8.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[ward, warddropdown],
        ),
      ),
    );

    final pctsection = Expanded(
      child: new Container(
        padding: new EdgeInsets.only(left: 8.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[pct, pctdropdown],
        ),
      ),
    );
    final startblock = Container(
      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Text("START BLOCK"),
    );

    final startblockdropdown = Container(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5))),
      margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
      child: TextFormField(
          controller: startblockController,
          cursorColor: _getColorFromHex("#128598"),
          decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            hintText: 'Start Block',
            hintStyle:
                TextStyle(color: _getColorFromHex("#757575"), fontSize: 14),
          )),
    );

    final endblock = Container(
      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Text("END BLOCK"),
    );

    final endblockdropdown = Container(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5))),
      margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
      child: TextFormField(
          controller: endblockController,
          cursorColor: _getColorFromHex("#128598"),
          decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            hintText: 'End Block',
            hintStyle:
                TextStyle(color: _getColorFromHex("#757575"), fontSize: 14),
          )),
    );

    final startblocksection = Expanded(
      child: new Container(
        // padding: new EdgeInsets.only(left: 8.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[startblock, startblockdropdown],
        ),
      ),
    );

    final endblocksection = Expanded(
      child: new Container(
        padding: new EdgeInsets.only(left: 8.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[endblock, endblockdropdown],
        ),
      ),
    );

    final street = Container(
      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Text("STREET"),
    );

    final streettextinput = Container(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5))),
      margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
      child: TextFormField(
          controller: streetController,
          cursorColor: _getColorFromHex("#128598"),
          decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            hintText: 'Street',
            hintStyle:
                TextStyle(color: _getColorFromHex("#757575"), fontSize: 14),
          )),
    );

    final gotoaddress = Container(
      margin: EdgeInsets.only(top: 15.0),
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
          "Go to Address".toUpperCase(),
          style: TextStyle(
            fontSize: 14.0,
          ),
        ),
      ),
    );

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: _getColorFromHex("#d0d4db"),
      appBar: AppBar(
        backgroundColor: _getColorFromHex("#128598"),
        title: Text(
          'Walk Sheet',
          style: TextStyle(fontSize: 20, color: Colors.white),
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
          margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              county,
              countydropdown,
              city,
              citydropdown,
              Row(children: <Widget>[wardsection, pctsection]),
              street,
              streettextinput,
              Row(children: <Widget>[startblocksection, endblocksection]),
              gotoaddress
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
      _showLoaderDialog(context);

      token = user.tokens.accessToken;
      maincampaignid = user.mainCampaignId.toString();
      new Future.delayed(const Duration(seconds: 5), () {
        walksheetapi();
      });
    });
  }

  Future<WalksheetResponse> walksheetapi() async {
    Map<String, String> headers = {'authorization': 'Bearer ' + token};

    var response1 = await http.get(
        'https://petitionatlas.com/walksheets/csv/precinct/options/' +
            maincampaignid,
        headers: headers);

    if (response1.statusCode == 200) {
      // If the call to the server was successful (returns OK), parse the JSON.
      print("success");
      Navigator.pop(context);

      Map json = jsonDecode(response1.body);
      walksheetResponse = WalksheetResponse.fromJson(json);
      setState(() {
        for (var countyname in walksheetResponse.countyOptions) {
          countylist.add(countyname.name);

          for (var cityname in countyname.cityOptions) {
            citylist.add(cityname.name);
            for (var wardname in cityname.wardOptions) {
              wardlist.add(wardname.name);
              pctlist.addAll(wardname.precinctNames);
            }
          }
        }
      });
    } else {
      // If that call was not successful (response was unexpected), it throw an error.
      Navigator.pop(context);
      throw Exception('Failed to load post');
    }
  }

  Future<StreetResponse> walksheetstreetapi() async {
    Map<String, String> headers = {'authorization': 'Bearer ' + token};
    String startblock = "0";
    String endblock = "0";
    if (startblockController.value.text != null &&
        startblockController.value.text.trim().length > 0) {
      startblock = startblockController.value.text;
    }
    if (endblockController.value.text != null &&
        endblockController.value.text.trim().length > 0) {
      endblock = endblockController.value.text;
    }

    var queryParameters = {
      'county': _countydropDownValue,
      'city': _citydropDownValue,
      'street': streetController.value.text,
      'ward': _warddropDownValue,
      'precinct': _pctdropDownValue,
      'startblock': startblock,
      'endblock': endblock
    };
    var uri = Uri.https('petitionatlas.com',
        '/walksheets/mobile/street/' + maincampaignid, queryParameters);

    var response = await http.get(
      uri,
      headers: headers,
    );

    if (response.statusCode == 200) {
      // If the call to the server was successful (returns OK), parse the JSON.
      print("success");
      Navigator.pop(context);
      // print(response.body);
      List<dynamic> values = json.decode(response.body);
      if (values.length > 0) {
        Map<String, dynamic> map;
        for (int i = 0; i < values.length; i++) {
          if (values[i] != null) {
            map = values[i];
            streetResponse.add(StreetResponse.fromJson(map));
            // print('Id-------${map['id']}');
          }
        }
      }

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("token", token);

      Navigator.pushNamed(
        context,
        '/selectvoter',
      );
    } else {
      // If that call was not successful (response was unexpected), it throw an error.
      Navigator.pop(context);
      throw Exception('Failed to load post');
    }
  }
}
