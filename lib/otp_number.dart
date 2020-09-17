import 'package:asiatic360/constants/strings.dart';
import 'package:asiatic360/utils/login_signup_textFields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:asiatic360/dashboard.dart';
import 'package:asiatic360/signup.dart';

Color green = Color(0xFF6B8449);
Color black = Color(0xFF000000);
Color grey = Color(0xFF808184);
Color greyShadow = Color(0xFF33808184);
Color red = Color(0XFFFD3131);
Color white = Color(0xFFFFFFFF);

var _loginState;

void main() {
  runApp(OTPNumber());
}

class OTPNumber extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Asiatic360',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyOTPNumberPage(title: 'Asiatic360'),
    );
  }
}

class MyOTPNumberPage extends StatefulWidget {
  MyOTPNumberPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyOTPNumberPageState createState() => _MyOTPNumberPageState();
}

class _MyOTPNumberPageState extends State<MyOTPNumberPage> {
  final String assetName = 'assets/svgs/asiatic360_logo.svg';

  bool _validate = false;
  bool _errorVisible = false;
  TextEditingController _mobileNumber = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;
    print("Width: ");
    print(media.width);
    print("Height: ");
    print(media.height);
    return Stack(
      children: <Widget>[
        Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            height: media.height,
            width: media.width,
            child: Stack(
              children: <Widget>[
                // Background Image
                Positioned(
                  top: media.height / 2 - 512,
                  left: -(media.width * 1.25) / 2,
                  width: media.width * 1.25,
                  child: Container(
                    width: media.width,
                    alignment: Alignment.centerLeft,
                    child: SvgPicture.asset(
                      assetName,
                      semanticsLabel: 'Asiatic360 Logo',
                    ),
                  ),
                ),
                // OTP Verfication text 1
                Positioned(
                  width: media.width,
                  child: Container(
                    padding: EdgeInsets.only(
                        top: media.height * 0.11765,
                        right: media.width * 0.10,
                        bottom: media.width * 0.0,
                        left: media.width * 0.10),
                    child: Text(
                      "OTP Verfication",
                      style: TextStyle(
                        color: green,
                        fontSize: media.width * 0.075,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                // OTP Verfication text 2
                Positioned(
                  child: Container(
                    padding: EdgeInsets.only(
                        top: media.height * 0.17524,
                        right: media.width * 0.10,
                        bottom: media.width * 0.0,
                        left: media.width * 0.10),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            "We will send you an One Time Password on this mobile number.",
                            style: TextStyle(
                              color: green,
                              fontSize: media.width * 0.04,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w300,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                // Mobile Number
                Positioned(
                  width: media.width,
                  child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      FocusScope.of(context).requestFocus(new FocusNode());
                    },
                    child: Container(
                      padding: EdgeInsets.only(
                        top: media.height * 0.45,
                        left: media.width * 0.10,
                        right: media.width * 0.10,
                      ),
                      child: CustomTextField(
                          text: "Mobile Number",
                          fieldController: _mobileNumber,
                          validate: _validate,
                          obscureText: false,
                          fingerprint: false,
                          media: media),
                    ),
                  ),
                ),
                // Mobile Number error message
                Positioned(
                  child: Visibility(
                    visible: _errorVisible,
                    child: Container(
                      padding: EdgeInsets.only(
                          top: media.height * 0.525,
                          right: media.width * 0.10,
                          bottom: media.width * 0.0,
                          left: media.width * 0.10),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              "Mobile Number cannot be empty",
                              style: TextStyle(
                                color: red,
                                fontSize: media.width * 0.025,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                // Submit Button
                Positioned(
                  top: media.height * 0.85,
                  left: media.width * 0.6,
                  right: media.width * 0.10,
                  child: GestureDetector(
                    child: Container(
                      padding: EdgeInsets.only(
                          top: media.height * 0.0,
                          left: media.width * 0.0,
                          bottom: 0.0,
                          right: media.width * 0.0),
                      height: media.height * 0.05,
                      width: media.width,
                      decoration: BoxDecoration(
                        color: green,
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Get OTP",
                            style: TextStyle(
                              color: white,
                              fontSize: media.width * 0.037,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      gotoDashboard("Taki Uddin", "3130");
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  gotoOTPVerify() {
    Navigator.of(context)
        .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
      return new Signup();
    }));
  }

  gotoDashboard(eName, eMail) async {
    print(_mobileNumber.text);
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    prefs.setString("name", eName);
    prefs.setString("email", eMail);
    Navigator.of(context)
        .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
      return new Dashboard();
    }));
  }
}
