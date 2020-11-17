import 'package:flutter/material.dart';

class SelectVoter extends StatefulWidget {
  SelectVoterState createState() => SelectVoterState();
}

class SelectVoterState extends State<SelectVoter> {
  @override
  Widget build(BuildContext context) {
    // backing data
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
                hintText: 'Search Location',
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

    Widget selectvoterlistview(String europeanCountri) {
      return new Row(
        children: <Widget>[
          Container(
              margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
              padding: EdgeInsets.only(
                  top: 10.0, bottom: 10.0, left: 10.0, right: 5.0),
              width: 200,
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
          new Column(children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 10.0, top: 5.0, bottom: 5.0),
              padding: EdgeInsets.only(
                  top: 17.0, bottom: 17.0, left: 15.0, right: 15.0),
              decoration: BoxDecoration(
                  color: _getColorFromHex("#128598"),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: Text("NH", style: TextStyle(color: Colors.white)),
            )
          ]),
          new Column(children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 10.0, top: 5.0, bottom: 5.0),
              padding: EdgeInsets.only(
                  top: 17.0, bottom: 17.0, left: 15.0, right: 15.0),
              decoration: BoxDecoration(
                  color: _getColorFromHex("#128598"),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: Text("IN", style: TextStyle(color: Colors.white)),
            )
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
                  itemCount: europeanCountries.length,
                  itemBuilder: (context, int i) => Column(
                    children: [selectvoterlistview(europeanCountries[i])],
                  ),
                ),
              ),
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
