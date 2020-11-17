import 'package:flutter/material.dart';

class Walksheet extends StatefulWidget {
  WalksheetState createState() => WalksheetState();
}

class WalksheetState extends State<Walksheet> {
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

    String _countydropDownValue;
    final countydropdown = Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5))),
        margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
        child: DropdownButtonHideUnderline(
            child: DropdownButton(
          hint: _countydropDownValue == null
              ? Text('Select County')
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

    final city = Container(
      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Text("CITY"),
    );

    String _citydropDownValue;
    final citydropdown = Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5))),
        margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
        child: DropdownButtonHideUnderline(
            child: DropdownButton(
          hint: _citydropDownValue == null
              ? Text('Select City')
              : Text(
                  _citydropDownValue,
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
                _citydropDownValue = val;
              },
            );
          },
        )));

    final ward = Container(
      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Text("WARD"),
    );

    String _warddropDownValue;
    final warddropdown = Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5))),
        margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
        child: DropdownButtonHideUnderline(
            child: DropdownButton(
          hint: _warddropDownValue == null
              ? Text('Select Ward')
              : Text(
                  _warddropDownValue,
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
                _warddropDownValue = val;
              },
            );
          },
        )));

    final pct = Container(
      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Text("PCT"),
    );

    String _pctdropDownValue;
    final pctdropdown = Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5))),
        margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
        child: DropdownButtonHideUnderline(
            child: DropdownButton(
          hint: _pctdropDownValue == null
              ? Text('Select Pct')
              : Text(
                  _pctdropDownValue,
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

    String _startblockdropDownValue;
    final startblockdropdown = Container(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5))),
      margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
      child: TextFormField(
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

    String _endblockdropDownValue;
    final endblockdropdown = Container(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5))),
      margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
      child: TextFormField(
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
          Navigator.pushNamed(
            context,
            '/selectvoter',
          );
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
