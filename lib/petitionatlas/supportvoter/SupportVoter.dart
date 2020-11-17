import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class SupportVoter extends StatefulWidget {
  SupportVoterState createState() => SupportVoterState();
}

class SupportVoterState extends State<SupportVoter> {
  @override
  Widget build(BuildContext context) {
    bool checkedValue = false;
    final europeanCountries = [
      'Albania',
      'Andorra',
      'Armenia',
      'Austria',
      'Azerbaijan',
      'Belarus',
      'Belgium',
      'Bosnia and Herzegovina',
      'Bulgaria',
      'Croatia',
      'Cyprus',
      'Czech Republic',
      'Denmark',
      'Estonia',
      'Finland',
      'France',
      'Georgia',
      'Germany',
      'Greece',
      'Hungary',
      'Iceland',
      'Ireland',
      'Italy',
      'Kazakhstan',
      'Kosovo',
      'Latvia',
      'Liechtenstein',
      'Lithuania',
      'Luxembourg',
      'Macedonia',
      'Malta',
      'Moldova',
      'Monaco',
      'Montenegro',
      'Netherlands',
      'Norway',
      'Poland',
      'Portugal',
      'Romania',
      'Russia',
      'San Marino',
      'Serbia',
      'Slovakia',
      'Slovenia',
      'Spain',
      'Sweden',
      'Switzerland',
      'Turkey',
      'Ukraine',
      'United Kingdom',
      'Vatican City'
    ];

    Future<bool> _onBackPressed() {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            Navigator.of(context).pop(true);
          });
    }

    final following = Container(
      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Text("Please Fill Out Following"),
    );

    Widget selectvoterlistview(String europeanCountri) {
      return new Row(
        children: <Widget>[
          Container(
              margin: EdgeInsets.only(top: 5.0),
              padding: EdgeInsets.only(
                  top: 10.0, bottom: 10.0, left: 10.0, right: 5.0),
              width: 320,
              decoration: BoxDecoration(
                  color: _getColorFromHex("#128598"),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: new GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/supportvoter',
                    );
                  },
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      new Text(
                        europeanCountri,
                        style: TextStyle(color: Colors.white),
                      ),
                      new Text(europeanCountri,
                          style: TextStyle(color: Colors.white))
                    ],
                  ))),
        ],
      );
    }

    final collectsignature = Container(
      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Text("Collect Signature ?"),
    );

    String _countydropDownValue;
    final signtauredropdown = Container(
        height: 30,
        padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(
                width: 1.0,
                style: BorderStyle.solid,
                color: _getColorFromHex("#128598")),
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
        ),
        margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
        child: DropdownButtonHideUnderline(
            child: DropdownButton(
          hint: _countydropDownValue == null
              ? Text('Collect Signature')
              : Text(
                  _countydropDownValue,
                  style: TextStyle(color: Colors.black),
                ),
          isExpanded: true,
          iconSize: 30.0,
          style: TextStyle(color: Colors.black),
          items: ['One', 'Two', 'Three'].map(
            (val) {
              return DropdownMenuItem<String>(
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

    String _addissuedropDownValue;
    final addissuedropdown = Container(
        height: 30,
        padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(
                width: 1.0,
                style: BorderStyle.solid,
                color: _getColorFromHex("#128598")),
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
        ),
        margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
        child: DropdownButtonHideUnderline(
            child: DropdownButton(
          hint: _addissuedropDownValue == null
              ? Text('Add Issue')
              : Text(
                  _addissuedropDownValue,
                  style: TextStyle(color: Colors.black),
                ),
          isExpanded: true,
          iconSize: 30.0,
          style: TextStyle(color: Colors.black),
          items: ['One', 'Two', 'Three'].map(
            (val) {
              return DropdownMenuItem<String>(
                value: val,
                child: Text(val),
              );
            },
          ).toList(),
          onChanged: (val) {
            setState(
              () {
                _addissuedropDownValue = val;
              },
            );
          },
        )));

    String _electronicsigndropDownValue;
    final electronicsignature = Container(
        height: 30,
        padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(
                width: 1.0,
                style: BorderStyle.solid,
                color: _getColorFromHex("#128598")),
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
        ),
        margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
        child: DropdownButtonHideUnderline(
            child: DropdownButton(
          hint: _electronicsigndropDownValue == null
              ? Text('Electronic Signature')
              : Text(
                  _electronicsigndropDownValue,
                  style: TextStyle(color: Colors.black),
                ),
          isExpanded: true,
          iconSize: 30.0,
          style: TextStyle(color: Colors.black),
          items: ['One', 'Two', 'Three'].map(
            (val) {
              return DropdownMenuItem<String>(
                value: val,
                child: Text(val),
              );
            },
          ).toList(),
          onChanged: (val) {
            setState(
              () {
                _electronicsigndropDownValue = val;
              },
            );
          },
        )));

    final support = Container(
      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Text("Support"),
    );

    final notes = Container(
      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: Text("Notes for campaign"),
    );

    final notestextinput = Container(
      height: 100,
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      decoration: BoxDecoration(
          color: _getColorFromHex("#128598"),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
      child: TextFormField(
          cursorColor: Colors.white,
          decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            hintText: '',
            hintStyle:
                TextStyle(color: _getColorFromHex("#757575"), fontSize: 14),
          )),
    );

    final email = Container(
      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: Text("Email"),
    );

    final emailtextinput = Container(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      decoration: BoxDecoration(
          color: _getColorFromHex("#128598"),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
      child: TextFormField(
          cursorColor: Colors.white,
          decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            hintText: '',
            hintStyle:
                TextStyle(color: _getColorFromHex("#757575"), fontSize: 14),
          )),
    );

    final phonenumber = Container(
      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: Text("Phone Number"),
    );

    final phonetextinput = Container(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      decoration: BoxDecoration(
          color: _getColorFromHex("#128598"),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
      child: TextFormField(
          cursorColor: Colors.white,
          decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            hintText: '',
            hintStyle:
                TextStyle(color: _getColorFromHex("#757575"), fontSize: 14),
          )),
    );

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: _getColorFromHex("#d0d4db"),
      appBar: AppBar(
        backgroundColor: _getColorFromHex("#128598"),
        title: Text(
          'Voter Information',
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
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: Container(
              margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  // SizedBox(
                  //   height: 20,
                  // ),
                  SizedBox(
                    height: 10,
                  ),
                  following,
                  selectvoterlistview(europeanCountries[0]),
                  SizedBox(
                    height: 0,
                  ),
                  collectsignature,
                  signtauredropdown,
                  support,
                  addissuedropdown,
                  notes,
                  notestextinput,
                  email,
                  emailtextinput,
                  phonenumber,
                  phonetextinput,
                  addissuedropdown,
                  CheckboxListTile(
                    title: Text("ELS"),
                    value: checkedValue,
                    onChanged: (newValue) {
                      setState(() {
                        checkedValue = newValue;
                      });
                    },
                    controlAffinity: ListTileControlAffinity
                        .leading, //  <-- leading Checkbox
                  ),
                  electronicsignature
                ],
              ),
            ),
          )),
    );
  }
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
