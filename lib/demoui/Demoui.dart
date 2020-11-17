import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:maps_launcher/maps_launcher.dart';

class Demoui extends StatefulWidget {
  DemouiState createState() => DemouiState();
}

class DemouiState extends State<Demoui> {
  // String mapSchema = "geo:$lat,$long";
  List<String> buttonlist = ["CALL", "ROUTE", "SHARE"];
  List<bool> isSelected = [true, false, false];

  @override
  Widget build(BuildContext context) {
    // final image = Container(
    //   margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
    //   height: 200,
    //   width: 600,
    //   child: Center(
    //       image: Image.asset('', height: 200, width: 600)
    //       // child: Image(image: Image.asset('images/download.jpg',height: 200,width: 600)),
    //       ),
    // );

    final image = Image.asset(
      'images/download.jpg',
      width: 600.0,
      height: 240.0,
      fit: BoxFit.fill,
    );

    //   // child: Column(
    //   body: Image.asset('images/image.jpg'),
    // );

    final titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Oeschinen Lake Campground',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Kandersteg, Switzerland',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          /*3*/
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          Text('41'),
        ],
      ),
    );

    Color color = Theme.of(context).primaryColor;

    final buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(color, Icons.call, 'CALL'),
          _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
          _buildButtonColumn(color, Icons.share, 'SHARE'),
        ],
      ),
    );

    final textSection = Container(
      padding: const EdgeInsets.fromLTRB(32, 32, 32, 32),
      alignment: Alignment.bottomCenter,
      child: Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
        'Alps. Situated 1,578 meters above sea level, it is one of the '
        'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
        'half-hour walk through pastures and pine forest, leads you to the '
        'lake, which warms to 20 degrees Celsius in the summer. Activities '
        'enjoyed here include rowing, and riding the summer toboggan run.',
        softWrap: true,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        // leading: BackButton(
        //   onPressed: () => Navigator.pop(context),
        //   color: Colors.black,
        // ),
        title: Text(
          'Flutter Demo',
          style: TextStyle(fontSize: 14, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: Column(
          children: <Widget>[
            // margin:EdgeInsets.fromLTRB(20, 10, 20, 0)

            image,
            titleSection,
            Container(
              padding: const EdgeInsets.fromLTRB(32,0,0,0),
              height: 40,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: buttonlist.length,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                        child: RaisedButton(
                            onPressed: () {
                              if(index==0){
                                launch("tel:7895180841");
                              }
                              else if(index==1){
                                var lat = "27.2046";
                                var long = "77.4977";
                                String googleUrl =
                                    'https://www.google.com/maps/search/?api=1&query=$lat,$long';
                                launch(googleUrl);
                              }
                              setState(() {
                                for (int i = 0; i < isSelected.length; i++) {
                                  if (i == index) {
                                    isSelected[i] = true;
                                  } else {
                                    isSelected[i] = false;
                                  }
                                }
                              });
                            },
                            color: isSelected[index] == true
                                ?  Theme.of(context).primaryColor
                                : Colors.white,
                            textColor: isSelected[index] == true
                                ? Colors.white
                                : Colors.black,
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0),
                                side: BorderSide(
                                    color:  Theme.of(context).primaryColor)),
                            child: Text(
                              buttonlist[index],
                              style: TextStyle(
                                  color: isSelected[index] == true
                                      ? Colors.white
                                      : Colors.black),
                            )));
                  }),
            ),
            textSection
          ],
        ),
      ),
    );
  }
}

Column _buildButtonColumn(Color color, IconData icon, String label) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(icon, color: color),
      Container(
        margin: const EdgeInsets.only(top: 8),
        child: new GestureDetector(
          onTap: () {
            if (label == 'CALL') {
              launch("tel:7895180841");
            }
            if (label == 'ROUTE') {
              var lat = "27.2046";
              var long = "77.4977";
              String googleUrl =
                  'https://www.google.com/maps/search/?api=1&query=$lat,$long';
              launch(googleUrl);
            }
            // if (label == 'SHARE') {
            //   launch("mailto:$email");
            // }
          },
          child: Center(
              child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          )),
        ),
        // child: Text(
        //   label,
        //   style: TextStyle(
        //     fontSize: 12,
        //     fontWeight: FontWeight.w400,
        //     color: color,
        //   ),
        // ),
      ),
    ],
  );
}
