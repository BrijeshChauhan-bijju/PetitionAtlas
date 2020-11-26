import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/rendering.dart';

class AddContact extends StatefulWidget {
  AddContactState createState() => AddContactState();
}

class AddContactState extends State<AddContact> {
  final signaturestatuslist = [
    "Not Attempted",
    "Not At Home",
    "Inaccessible",
    "At Home No Signature",
    "Signature Collected"
  ];
  bool educationcheck = false;
  bool bussinesscheck = false;
  bool policingcheck = false;
  bool environmentcheck = false;
  bool housingcheck = false;
  bool gunviolencecheck = false;
  bool healthcarecheck = false;
  bool ethicscheck = false;
  bool elscheck = false;

  var issuevisibility = false;

  var languagevisibility = false;

  TextEditingController firstnamecontroller = new TextEditingController();
  TextEditingController lastnamecontroller = new TextEditingController();
  TextEditingController housenumbercontroller = new TextEditingController();
  TextEditingController streetcontroller = new TextEditingController();
  TextEditingController phonenumbercontroller = new TextEditingController();
  TextEditingController emailcontroller = new TextEditingController();
  TextEditingController elscontroller = new TextEditingController();
  TextEditingController notescontroller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future<bool> _onBackPressed() {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            Navigator.of(context).pop(true);
          });
    }

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

    final clear = Container(
      width: 170,
      margin: EdgeInsets.only(top: 15.0),
      padding: EdgeInsets.only(left: 0.0, right: 10.0),
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: _getColorFromHex("#128598"),
        textColor: Colors.white,
        padding: EdgeInsets.all(15),
        onPressed: () {
          setState(() {
            firstnamecontroller.text = "";
            lastnamecontroller.text = "";
            housenumbercontroller.text = "";
            streetcontroller.text = "";
            phonenumbercontroller.text = "";
            emailcontroller.text = "";
            elscontroller.text = "";
            notescontroller.text = "";

            educationcheck = false;
            bussinesscheck = false;
            policingcheck = false;
            environmentcheck = false;
            housingcheck = false;
            gunviolencecheck = false;
            healthcarecheck = false;
            ethicscheck = false;
            elscheck = false;
            languagevisibility = false;
            issuevisibility = false;
          });
        },
        child: Text(
          "Clear".toUpperCase(),
          style: TextStyle(
            fontSize: 14.0,
          ),
        ),
      ),
    );
    final save = Container(
      width: 170,
      margin: EdgeInsets.only(top: 15.0),
      padding: EdgeInsets.only(left: 0.0, right: 0.0),
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: _getColorFromHex("#128598"),
        textColor: Colors.white,
        padding: EdgeInsets.all(15),
        onPressed: () {},
        child: Text(
          "Save".toUpperCase(),
          style: TextStyle(
            fontSize: 14.0,
          ),
        ),
      ),
    );

    final firstname = Container(
      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
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
        style: TextStyle(color: Colors.black),
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

    final lastname = Container(
      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
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
        style: TextStyle(color: Colors.black),
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
    final housenumber = Container(
      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
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
        style: TextStyle(color: Colors.black),
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
    final street = Container(
      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
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
        style: TextStyle(color: Colors.black),
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
    final phone = Container(
      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: Text("Phone Number"),
    );

    final phonenumberinput = Container(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5))),
      margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
      child: TextFormField(
        controller: phonenumbercontroller,
        cursorColor: _getColorFromHex("#128598"),
        style: TextStyle(color: Colors.black),
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

    final emailinput = Container(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5))),
      margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
      child: TextFormField(
        controller: emailcontroller,
        cursorColor: _getColorFromHex("#128598"),
        style: TextStyle(color: Colors.black),
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

    final notes = Container(
      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: Text("Notes for campaign"),
    );

    final notestextinput = Container(
      height: 100,
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5))),
      margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
      child: TextFormField(
        controller: notescontroller,
        cursorColor: _getColorFromHex("#128598"),
        style: TextStyle(color: Colors.black),
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

    final languageinput = Container(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5))),
      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: TextFormField(
          controller: elscontroller,
          cursorColor: _getColorFromHex("#128598"),
          style: TextStyle(color: Colors.black),
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
                  phone,
                  phonenumberinput,
                  email,
                  emailinput,
                  addissuedropdown,
                  Visibility(
                    child: issuecontainer,
                    visible: issuevisibility,
                  ),
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
                    visible: languagevisibility,
                    maintainState: true,
                  ),
                  notes,
                  notestextinput,
                  Row(children: <Widget>[
                    Flexible(child: clear),
                    Flexible(child: save)
                  ])
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
