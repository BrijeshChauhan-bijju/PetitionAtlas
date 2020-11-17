import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class DescriptionPlacesSelection extends StatefulWidget {
  DescriptionState createState() => DescriptionState();
}

class DescriptionState extends State<DescriptionPlacesSelection> {
  Map data = {};
  var count = 0;
  String privacytype = "";

  List<String> categorylist = ["Travel", "Food", "Both"];
  List<bool> isSelected = [true, false, false];
  final placenameController = TextEditingController();

  bool sendRequest = true;

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    privacytype = data['privacytype'] != null ? data['privacytype'] : "";
    _getMediaFile(privacytype, context);

    final experiernceText = Text(
      'Your Experience',
      textAlign: TextAlign.start,
      style: TextStyle(
          color: _getColorFromHex("#2e415b"),
          fontSize: 20,
          fontWeight: FontWeight.normal),
    );

    final locationText = Text(
      'Location',
      textAlign: TextAlign.start,
      style: TextStyle(
          color: _getColorFromHex("#68717c"),
          fontSize: 14,
          fontWeight: FontWeight.bold),
    );

    final searchText = Container(
      padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          border: Border.all(color: _getColorFromHex("#edeff2"), width: 1)),
      child: new GestureDetector(
        onTap: () {
          // senddata(context, placenameController);
        },
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Icon(
              Icons.search,
              color: _getColorFromHex('#aab4c1'),
            ),
            Flexible(
              child: TextFormField(
                controller: placenameController,
                onTap: () {
                  // senddata(context, placenameController);
                },
                keyboardType: TextInputType.emailAddress,
                autofocus: false,
                readOnly: true,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintText: 'Search Location',
                  hintStyle: TextStyle(color: _getColorFromHex("#a2acbb")),
                  contentPadding: EdgeInsets.fromLTRB(5.0, 0, 0.0, 0.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );

    final descriptionText = Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          border: Border.all(color: _getColorFromHex("#f2f4f7"), width: 1),
          color: _getColorFromHex("#f2f4f7"),
        ),
        child: Flexible(
          child: TextFormField(
            maxLines: 7,
            minLines: 7,
            maxLength: 60,
            autofocus: false,
            decoration: InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              hintText: 'Description here....',
              contentPadding: EdgeInsets.fromLTRB(5.0, 0, 0.0, 0.0),
            ),
          ),
        ));

    final categoryText = Text(
      'Category',
      textAlign: TextAlign.start,
      style: TextStyle(
          color: _getColorFromHex("#4f5a68"),
          fontSize: 14,
          fontWeight: FontWeight.bold),
    );

    final describeText = Text(
      'Describe',
      textAlign: TextAlign.start,
      style: TextStyle(
          color: _getColorFromHex("#4f5a68"),
          fontSize: 14,
          fontWeight: FontWeight.bold),
    );

    final wordsCountText = Align(
      alignment: Alignment.centerRight,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[Text(count.toString()), Text('/60')],
      ),
    );
    final submitButton = Container(
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        color: _getColorFromHex("#2fc9d2"),
        textColor: Colors.white,
        padding: EdgeInsets.all(15),
        onPressed: () {},
        child: Text(
          "Submit",
          style: TextStyle(
            fontSize: 14.0,
          ),
        ),
      ),
    );

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
      body: SingleChildScrollView(
          child: Container(
        child: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  experiernceText,
                  SizedBox(
                    height: 30.0,
                  ),
                  locationText,
                  SizedBox(
                    height: 15.0,
                  ),
                  searchText,
                  SizedBox(height: 20.0),
                  categoryText,
                  SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    height: 40,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categorylist.length,
                        itemBuilder: (context, index) {
                          return Padding(
                              padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                              child: RaisedButton(
                                  onPressed: () {
                                    setState(() {
                                      for (int i = 0;
                                          i < isSelected.length;
                                          i++) {
                                        if (i == index) {
                                          isSelected[i] = true;
                                        } else {
                                          isSelected[i] = false;
                                        }
                                      }
                                    });
                                  },
                                  color: isSelected[index] == true
                                      ? _getColorFromHex("#2fc9d2")
                                      : Colors.white,
                                  textColor: isSelected[index] == true
                                      ? Colors.white
                                      : Colors.black,
                                  shape: new RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(30.0),
                                      side: BorderSide(
                                          color: _getColorFromHex("#2fc9d2"))),
                                  child: Text(
                                    categorylist[index],
                                    style: TextStyle(
                                        color: isSelected[index] == true
                                            ? Colors.white
                                            : Colors.black),
                                  )));
                        }),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  describeText,
                  SizedBox(
                    height: 20.0,
                  ),
                  descriptionText,
                  SizedBox(
                    height: 40.0,
                  ),
                  submitButton
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}

// void senddata(
//     BuildContext context, TextEditingController placenameController) async {
//   dynamic result = await Navigator.pushNamed(context, "/search");
//   if (result != null) {
//     LocationData locationdata = result['locationdta'];
//     placenameController.text = locationdata.placename;
//     print("placename=" + locationdata.placename);
//     print("lat=" + locationdata.lat);
//     print("lng=" + locationdata.lng);
//   }
// }

Color _getColorFromHex(String hexColor) {
  hexColor = hexColor.replaceAll("#", "");
  if (hexColor.length == 6) {
    hexColor = "FF" + hexColor;
  }
  if (hexColor.length == 8) {
    return Color(int.parse("0x$hexColor"));
  }
}

void _getMediaFile(String multiple, BuildContext context) async {
  if (multiple == false) {
    FilePickerResult result =
        await FilePicker.platform.pickFiles(type: FileType.video);
    if (result != null) {
      PlatformFile file = result.files.first;
      print("filename:" + file.name);
      print(file.name);
      print(file.bytes);
      print(file.size);
      print(file.extension);
      print(file.path);
    } else {
      Navigator.pop(context);
    }
  } else {
    FilePickerResult result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'gif', 'jpeg', 'mp4'],
    );
    if (result != null) {
      List<File> files = result.paths.map((path) => File(path)).toList();
      for (int i = 0; i < files.length; i++) {
        print(i);
        PlatformFile file = result.files[i];
        print("filename:" + file.name);
        print(file.name);
        print(file.bytes);
        print(file.size);
        print(file.extension);
        print(file.path);
      }
    } else {
      Navigator.pop(context);
    }
  }
}
