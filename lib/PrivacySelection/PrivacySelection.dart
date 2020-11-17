import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:carousel_slider/carousel_slider.dart';
class PrivacySelection extends StatefulWidget {
  PrivacySelectionState createState() => PrivacySelectionState();
}

class PrivacySelectionState extends State<PrivacySelection> {
  @override
  Widget build(BuildContext context) {
    final bottom = Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: Column(
        children: <Widget>[
          Text(
            'Swipe and Select',
            style: TextStyle(fontSize: 16, color: Colors.black54),
          )
        ],
      ),
    );

    final public = Container(
      width: 200,
      child: Column(
        children: <Widget>[
          CircleAvatar(
            radius: 100,
            backgroundColor: _getColorFromHex("#e5e9f2"),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            'Public',
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: _getColorFromHex("#475361")),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            'Non-Monetizable Visible to self and friends only',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.black54),
          ),
        ],
      ),
    );

    final private = Container(
      width: 200,
      child: Column(
        children: <Widget>[
          CircleAvatar(
            radius: 100,
            backgroundColor: _getColorFromHex("#e5e9f2"),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            'Private',
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: _getColorFromHex("#475361")),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            'Monetizable Visible to the entire network',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.black54),
          ),
        ],
      ),
    );

    final List<Container> imagestext = [private, public];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackButton(
          onPressed: () => Navigator.pop(context),
          color: Colors.black,
        ),
        title: Text(
          'New Post',
          style: TextStyle(fontSize: 14, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
                child: Center(
              child: Container(
                  child: CarouselSlider.builder(
                itemCount: imagestext.length,
                options: CarouselOptions(
                  autoPlay: false,
                  viewportFraction: 0.65,
                  height: 350,
                  reverse: false,
                  enableInfiniteScroll: false,
                  enlargeCenterPage: true,
                ),
                itemBuilder: (context, index) {
                  return Container(
                      child: new GestureDetector(
                    onTap: () {
                      if (index == 0) {
                        print("public");
                        Navigator.pushNamed(context, '/description',
                            arguments: {'privacytype': "false"});
                      } else if (index == 1) {
                        print("private");
                        // _getMediaFile(true,context);
                        Navigator.pushNamed(context, '/description',
                            arguments: {'privacytype': "true"});
                      }
                    },
                    child: Center(
                      child: imagestext[index],
                    ),
                  ));
                },
              )),
            )),
            Align(
              alignment: Alignment.bottomCenter,
              child: bottom,
            )
          ],
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
}
