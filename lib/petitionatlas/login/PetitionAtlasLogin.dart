import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:godashdemo/petitionatlas/response/loginresponse/Loginresponsse.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  var emailtext = '';
  var passwordtext = '';
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final background = Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 140),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/splash.png"), fit: BoxFit.cover)),
    );

    final image = Image.asset(
      'images/logo.png',
      width: 200.0,
      height: 70.0,
      fit: BoxFit.fill,
    );

    final userid = Text(
      "User id",
      style: TextStyle(
          color: _getColorFromHex("#757575"),
          fontSize: 14,
          fontWeight: FontWeight.bold),
    );
    final password = Text(
      "Password",
      style: TextStyle(
          color: _getColorFromHex("#757575"),
          fontSize: 14,
          fontWeight: FontWeight.bold),
    );

    final usertextinput = TextFormField(
        controller: usernameController,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: _getColorFromHex("#757575"),
              width: 1.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: _getColorFromHex("#757575"),
              width: 1.0,
            ),
          ),
          hintText: 'User Name',
          hintStyle:
              TextStyle(color: _getColorFromHex("#757575"), fontSize: 14),
          contentPadding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
        ));

    final passwordtextinput = TextFormField(
        controller: passwordController,
        keyboardType: TextInputType.visiblePassword,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: _getColorFromHex("#757575"),
              width: 1.0,
            ),
          ),
          // focusedBorder: InputBorder.none,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: _getColorFromHex("#757575"),
              width: 1.0,
            ),
          ),
          // errorBorder: InputBorder.none,
          // disabledBorder: InputBorder.none,
          // disabledBorder: InputBorder.none,
          hintText: 'Password',
          hintStyle:
              TextStyle(color: _getColorFromHex("#757575"), fontSize: 14),
          contentPadding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0.0),
        ));

    // final submitButton = Container(
    //   child: FlatButton(
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(10.0),
    //     ),
    //     color: _getColorFromHex("#128598"),
    //     textColor: Colors.white,
    //     padding: EdgeInsets.all(15),
    //     onPressed: () {},
    //     child: Text(
    //       "Submit",
    //       style: TextStyle(
    //         fontSize: 14.0,
    //       ),
    //     ),
    //   ),
    // );

    final submitButton = Container(
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: _getColorFromHex("#128598"),
        textColor: Colors.white,
        padding: EdgeInsets.all(15),
        onPressed: () {
          _showLoaderDialog(context);
          fetchPost();
          // Navigator.pushNamed(
          //   context, '/dashboard',
          //   // arguments: {'privacytype': "false"}
          // );
        },
        child: Text(
          "Login".toUpperCase(),
          style: TextStyle(
            fontSize: 14.0,
          ),
        ),
      ),
    );

    final notetext = Text(
      "Note: Please contact the campaign you are volunteer with for your User ID and Password",
      style: TextStyle(
          color: _getColorFromHex("#757575"),
          fontSize: 14,
          fontWeight: FontWeight.bold),
    );

    final cardview = Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: Colors.white,
      margin: EdgeInsets.fromLTRB(20, 70, 20, 20),
      child: new Container(
        height: 460,
        padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            new Row(
              children: <Widget>[
                image,
              ],
            ),
            SizedBox(
              height: 20,
            ),
            userid,
            SizedBox(
              height: 10,
            ),
            usertextinput,
            SizedBox(
              height: 20,
            ),
            password,
            SizedBox(
              height: 10,
            ),
            passwordtextinput,
            SizedBox(
              height: 20,
            ),
            submitButton,
            SizedBox(
              height: 20,
            ),
            notetext
          ],
        ),
      ),
    );

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: _getColorFromHex("#CED4DA"),
      appBar: AppBar(
        backgroundColor: _getColorFromHex("#128598"),
        title: Text(
          'Login',
          style: TextStyle(fontSize: 14, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[background, cardview],
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
  CircularProgressIndicator _showLoaderDialog(BuildContext context){
    AlertDialog alert=AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(margin: EdgeInsets.only(left: 7),child:Text("Loading..." )),
        ],),
    );
    showDialog(barrierDismissible: false,
      context:context,
      builder:(BuildContext context){
        return alert;
      },
    );
  }

  Future<Loginresponsse> fetchPost() async {
    Map data = {
      'username': usernameController.value.text,
      'password': passwordController.value.text
    };
    String body = json.encode(data);

    Map<String,String> headers = {'Content-Type':'application/json'};

    final response = await http.post(
        'https://petitionatlas.com/users/authentication',
        headers: headers,
        body: body);

    if (response.statusCode == 200) {
      // If the call to the server was successful (returns OK), parse the JSON.
      print("success");
      Navigator.pop(context);

      // Loginresponsse loginresponsse =response as Loginresponsse;
      //
      // print("succ "+loginresponsse.username);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      Map json = jsonDecode(response.body);
      String user = jsonEncode(Loginresponsse.fromJson(json));
      prefs.setString('logindata', user);
      // return Loginresponsse.fromJson(jsonDecode(response.body));
      Navigator.pushNamed(
        context,
        '/dashboard',
      );
    } else {
      // If that call was not successful (response was unexpected), it throw an error.
      Navigator.pop(context);
      throw Exception('Failed to load post');
    }
  }

}
