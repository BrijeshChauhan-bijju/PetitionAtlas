import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:godashdemo/petitionatlas/response/walksheetstreetresponse/Street_response.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/rendering.dart';
import 'custome_painter.dart';

class SupportVoter extends StatefulWidget {
  StreetResponse response;

  SupportVoter(StreetResponse walksheetlist) {
    response = walksheetlist;
  }

  SupportVoterState createState() => SupportVoterState(response);
}

class SupportVoterState extends State<SupportVoter> {
  static final List colors = [
    Colors.black,
    Colors.purple,
    Colors.green,
  ];
  static final List lineWidths = [3.0, 5.0, 8.0];
  String token;

  // File imageFile;
  int selectedLine = 0;
  Color selectedColor = colors[0];
  List points = [Point(colors[0], lineWidths[0], [])];
  int curFrame = 0;
  bool isClear = false;

  final GlobalKey _repaintKey = new GlobalKey();

  var signaturevisibility = false;

  int signaturestatus;

  double get strokeWidth => lineWidths[selectedLine];
  StreetResponse response;
  final signaturestatuslist = [
    "Not Attempted",
    "Not At Home",
    "Inaccessible",
    "At Home No Signature",
    "Signature Collected"
  ];

  var issuevisibility = false;

  var languagevisibility = false;

  TextEditingController phonenumbercontroller = new TextEditingController();
  TextEditingController emailcontroller = new TextEditingController();
  TextEditingController elscontroller = new TextEditingController();
  TextEditingController notescontroller = new TextEditingController();

  bool educationcheck = false;
  bool bussinesscheck = false;
  bool policingcheck = false;
  bool environmentcheck = false;
  bool housingcheck = false;
  bool gunviolencecheck = false;
  bool healthcarecheck = false;
  bool ethicscheck = false;
  bool elscheck = false;

  SupportVoterState(StreetResponse walksheetlist) {
    response = walksheetlist;
  }

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

    final following = Container(
      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Text("Please Fill Out Following"),
    );

    Widget selectvoterlistview(StreetResponse streetResponse) {
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
                        streetResponse.fullName,
                        style: TextStyle(color: Colors.white),
                      ),
                      new Text(streetResponse.fullAddress,
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
              ? Text('Collect Signature', style: TextStyle(color: Colors.black))
              : Text(
                  _countydropDownValue,
                  style: TextStyle(color: Colors.black),
                ),
          isExpanded: true,
          iconSize: 30.0,
          style: TextStyle(color: Colors.black),
          items: signaturestatuslist.map(
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
                signaturestatus = signaturestatuslist.indexOf(val);
              },
            );
          },
        )));

    final addissuedropdown = Container(
        height: 30,
        width: 320,
        padding: EdgeInsets.fromLTRB(10, 5, 5, 0),
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
        child: new GestureDetector(
            onTap: () {
              if (issuevisibility == false) {
                setState(() {
                  issuevisibility = true;
                });
              } else {
                setState(() {
                  issuevisibility = false;
                });
              }
            },
            child: Text(
              "Add Issue",
              style: TextStyle(color: Colors.black),
            )));

    var issuecontainer = Container(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
              width: 1.0,
              style: BorderStyle.solid,
              color: _getColorFromHex("#128598")),
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
      ),
      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: Row(
        children: <Widget>[
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              // mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Checkbox(
                      value: educationcheck,
                      onChanged: (newValue) {
                        setState(() {
                          educationcheck = newValue;
                        });
                      },
                    ),
                    Text(
                      "Education",
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Checkbox(
                      value: policingcheck,
                      onChanged: (newValue) {
                        setState(() {
                          policingcheck = newValue;
                        });
                      },
                    ),
                    Text(
                      "Policing",
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Checkbox(
                      value: housingcheck,
                      onChanged: (newValue) {
                        setState(() {
                          housingcheck = newValue;
                        });
                      },
                    ),
                    Text(
                      "Housing",
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Checkbox(
                      value: healthcarecheck,
                      onChanged: (newValue) {
                        setState(() {
                          healthcarecheck = newValue;
                        });
                      },
                    ),
                    Text(
                      "HealthCare",
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                )
              ]),
          SizedBox(
            width: 15,
          ),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Checkbox(
                      value: bussinesscheck,
                      onChanged: (newValue) {
                        setState(() {
                          bussinesscheck = newValue;
                        });
                      },
                    ),
                    Text(
                      "Bussiness",
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Checkbox(
                      value: environmentcheck,
                      onChanged: (newValue) {
                        setState(() {
                          environmentcheck = newValue;
                        });
                      },
                    ),
                    Text(
                      "Environment",
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Checkbox(
                      value: gunviolencecheck,
                      onChanged: (newValue) {
                        setState(() {
                          gunviolencecheck = newValue;
                        });
                      },
                    ),
                    Text(
                      "Gun Violence",
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Checkbox(
                      value: ethicscheck,
                      onChanged: (newValue) {
                        setState(() {
                          ethicscheck = newValue;
                        });
                      },
                    ),
                    Text(
                      "Ethics/ Corruption",
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                )
              ])
        ],
      ),
    );

    final electronicsignature = Container(
        height: 30,
        width: 320,
        padding: EdgeInsets.fromLTRB(10, 5, 5, 0),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(
                width: 1.0,
                style: BorderStyle.solid,
                color: _getColorFromHex("#128598")),
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
        ),
        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: new GestureDetector(
            onTap: () {
              if (signaturevisibility == false) {
                setState(() {
                  signaturevisibility = true;
                });
              } else {
                setState(() {
                  signaturevisibility = false;
                });
              }
            },
            child: Text(
              "Electronic Signature",
              style: TextStyle(color: Colors.black),
            )));

    final clear = Container(
        margin: EdgeInsets.only(left: 10.0),
        child: new GestureDetector(
            onTap: () {
              setState(() {
                reset();
              });
            },
            child: Text("clear signature",
                style: TextStyle(color: _getColorFromHex("#128598")))));

    final save = Container(
      margin: EdgeInsets.only(top: 15.0),
      padding: EdgeInsets.only(left: 10.0, right: 10.0),
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: _getColorFromHex("#253544"),
        textColor: Colors.white,
        padding: EdgeInsets.all(15),
        onPressed: () {
          _showLoaderDialog(context);
          supportvoter(response.id.toString());
        },
        child: Text(
          "Save".toUpperCase(),
          style: TextStyle(
            fontSize: 14.0,
          ),
        ),
      ),
    );

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
        controller: notescontroller,
        cursorColor: Colors.white,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          hintText: '',
          hintStyle:
              TextStyle(color: _getColorFromHex("#757575"), fontSize: 14),
        ),
      ),
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
          controller: emailcontroller,
          cursorColor: Colors.white,
          style: TextStyle(color: Colors.white),
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
          controller: phonenumbercontroller,
          cursorColor: Colors.white,
          style: TextStyle(color: Colors.white),
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

    final languageinput = Container(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      decoration: BoxDecoration(
          color: _getColorFromHex("#128598"),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: TextFormField(
          style: TextStyle(color: Colors.white),
          controller: elscontroller,
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

    final electronicsignaturepad = Container(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
          SizedBox(
            height: 200,
            width: 320,
            child: Container(
              color: Colors.white,
              margin: EdgeInsets.all(8.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    child: _buildCanvas(),
                    top: 0.0,
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                  ),
                ],
              ),
            ),
          ),
          clear
        ]));
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
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  following,
                  selectvoterlistview(response),
                  SizedBox(
                    height: 0,
                  ),
                  collectsignature,
                  signtauredropdown,
                  support,
                  addissuedropdown,
                  Visibility(
                    child: issuecontainer,
                    // maintainSize: true,
                    // maintainAnimation: true,
                    // maintainState: true,
                    visible: issuevisibility,
                  ),
                  notes,
                  notestextinput,
                  email,
                  emailtextinput,
                  phonenumber,
                  phonetextinput,
                  Row(
                    children: <Widget>[
                      Checkbox(
                        value: elscheck,
                        onChanged: (newValue) {
                          setState(() {
                            setState(() {
                              if (languagevisibility == false) {
                                languagevisibility = true;
                              } else {
                                languagevisibility = false;
                              }
                              elscheck = newValue;
                            });
                          });
                        },
                      ),
                      Text(
                        "ELS",
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                  Visibility(
                    child: languageinput,
                    // maintainSize: true,
                    // maintainAnimation: true,
                    // maintainState: true,
                    visible: languagevisibility,
                  ),
                  electronicsignature,
                  Visibility(
                    child: electronicsignaturepad,
                    // maintainSize: true,
                    // maintainAnimation: true,
                    maintainState: true,
                    visible: signaturevisibility,
                  ),
                  save
                ],
              ),
            ),
          )),
    );
  }

  Widget _buildCanvas() {
    return StatefulBuilder(builder: (context, state) {
      return CustomPaint(
        painter: CustomePainter(
          points: points,
          strokeColor: selectedColor,
          strokeWidth: strokeWidth,
          isClear: isClear,
        ),
        child: GestureDetector(
          onPanStart: (details) {
            // before painting, set color & strokeWidth.
            isClear = false;
            points[curFrame].color = selectedColor;
            points[curFrame].strokeWidth = strokeWidth;
          },
          onPanUpdate: (details) {
            RenderBox referenceBox = context.findRenderObject();
            Offset localPosition =
                referenceBox.globalToLocal(details.globalPosition);
            state(() {
              points[curFrame].points.add(localPosition);
            });
          },
          onPanEnd: (details) {
            // preparing for next line painting.
            points.add(Point(selectedColor, strokeWidth, []));
            curFrame++;
          },
        ),
      );
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

  void reset() {
    isClear = true;
    curFrame = 0;
    points.clear();
    points.add(Point(selectedColor, strokeWidth, []));
  }

  supportvoter(String voterid) async {
    Map<String, String> headers = {'authorization': 'Bearer ' + token};

    bool englishassecondlanguage;

    if (elscheck == true) {
      englishassecondlanguage = true;
    } else {
      englishassecondlanguage = false;
    }
    Map data = {
      "Email": emailcontroller.value.text,
      "Signature": "",
      "HasEnglishAsSecondLanguage": englishassecondlanguage,
      "HasIssueBusiness": bussinesscheck,
      "HasIssueEducation": educationcheck,
      "HasIssueEnvironment": environmentcheck,
      "HasIssueEthics": ethicscheck,
      "HasIssueGunViolence": gunviolencecheck,
      "HasIssueHealthcare": healthcarecheck,
      "HasIssueHousing": housingcheck,
      "HasIssuePolicing": policingcheck,
      "Notes": notescontroller.value.text,
      "Phone": phonenumbercontroller.value.text,
      "PrimaryLanguage": elscontroller.value.text,
      "SignatureStatus": signaturestatus,
      "VoterSupportLevel": 3
    };
    String body = json.encode(data);
    var response = await http.post(
        'https://petitionatlas.com/voters/support/' + voterid,
        headers: headers,
        body: body);
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

  getsharedprefences() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    setState(() {
      token = sp.getString("token");
    });
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

class Point {
  Color color;
  List points;
  double strokeWidth = 5.0;

  Point(this.color, this.strokeWidth, this.points);
}
