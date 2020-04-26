import 'package:asiatic360/utils/login_signup_textFields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
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
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(Login());
}

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Asiatic360',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyLoginPage(title: 'Asiatic360'),
    );
  }
}

class MyLoginPage extends StatefulWidget {
  MyLoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyLoginPageState createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  final String assetName = 'assets/svgs/asiatic360_logo.svg';

  bool _validate = false;
  bool _errorVisible = false;
  TextEditingController _employeeID = new TextEditingController();
  TextEditingController _employeePassword = new TextEditingController();

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
                // Login text 1
                Positioned(
                  width: media.width,
                  child: Container(
                    padding: EdgeInsets.only(
                        top: media.height * 0.11765,
                        right: media.width * 0.10,
                        bottom: media.width * 0.0,
                        left: media.width * 0.10),
                    child: Text(
                      "Login",
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
                // Login text 2
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
                            "Login to access to your dashboard",
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
                // Employee ID
                Positioned(
                  width: media.width,
                  child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      FocusScope.of(context).requestFocus(new FocusNode());
                    },
                    child: Container(
                      padding: EdgeInsets.only(
                        top: media.height * 0.40,
                        left: media.width * 0.10,
                        right: media.width * 0.10,
                      ),
                      child: CustomTextField(
                          text: "Employee ID",
                          fieldController: _employeeID,
                          validate: _validate,
                          obscureText: false,
                          fingerprint: false,
                          media: media),
                    ),
                  ),
                ),
                // Employee ID error message
                Positioned(
                  child: Visibility(
                    visible: _errorVisible,
                    child: Container(
                      padding: EdgeInsets.only(
                          top: media.height * 0.475,
                          right: media.width * 0.10,
                          bottom: media.width * 0.0,
                          left: media.width * 0.10),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              "Employee ID must be of 4 digits and cannot be empty",
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
                // Password
                Positioned(
                  width: media.width,
                  child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      FocusScope.of(context).requestFocus(new FocusNode());
                    },
                    child: Container(
                      padding: EdgeInsets.only(
                        top: media.height * 0.50,
                        left: media.width * 0.10,
                        right: media.width * 0.10,
                      ),
                      child: CustomTextField(
                          text: "Password",
                          fieldController: _employeePassword,
                          validate: _validate,
                          obscureText: true,
                          fingerprint: true,
                          context: context,
                          media: media),
                    ),
                  ),
                ),
                // Password error message
                Positioned(
                  child: Visibility(
                    visible: _errorVisible,
                    child: Container(
                      padding: EdgeInsets.only(
                          top: media.height * 0.575,
                          right: media.width * 0.10,
                          bottom: media.width * 0.0,
                          left: media.width * 0.10),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              "Password must be of 8 characters and cannot be empty",
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
                // forgot password
                Positioned(
                  child: Container(
                    padding: EdgeInsets.only(
                      top: media.height * 0.60,
                      left: media.width * 0.10,
                      right: media.width * 0.10,
                    ),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          "Forgot your password?",
                          style: TextStyle(
                            color: black,
                            fontSize: media.width * 0.035,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
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
                                "Login",
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
                          // _validateInputs();
                          gotoDashboard("Taki Uddin", "3130");
                        })),
                // Bottom Text
                Positioned(
                  child: Container(
                    padding: EdgeInsets.only(
                      top: media.height * 0.95,
                    ),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Already have an account? ",
                          style: TextStyle(
                            color: black,
                            fontSize: media.width * 0.037,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            gotoSignUp();
                          },
                          child: Text(
                            " Sign Up",
                            style: TextStyle(
                              color: Color(0xFF465062),
                              fontSize: 16.0,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  _validateInputs() async {
    print("LOGIN: " + _employeeID.text + "    " + _employeePassword.text);
    if (_employeeID.text != '' && _employeePassword.text != '') {
      var response = await http.post(
          // Encode the url
          "http://192.168.121.193:4000/api/users/login?e_id=" +
              _employeeID.text +
              "&e_password=" +
              _employeePassword.text,
          // Only accept JSON response
          headers: {
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyZXN1bHQiOnsiaWQiOjQsImVfaWQiOjEyMzQsImVfZGVzaWduYXRpb24iOm51bGwsImVfZW1haWwiOiJ0YWtpdWRkaW5AZW1haWwuY29tIiwic3RhdHVzIjoxLCJyZW1lbWJlcl90b2tlbiI6IjAiLCJsYXN0X2xvZ2luIjpudWxsLCJjcmVhdGVkX2F0IjoiMjAyMC0wNC0yNlQwODoyNzoyMi4wMDBaIiwibW9kaWZpZWRfYXQiOiIyMDIwLTA0LTI2VDA4OjI3OjIyLjAwMFoifSwiaWF0IjoxNTg3OTA3NzgwLCJleHAiOjE1ODc5MTEzODB9.HRoP1E_KysXCdb0oKQwfisnrqP83yflBPoBO3v-qeu0',
            'Content-Type': 'application/json; charset=UTF-8',
          });
      List data;
      Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
      final SharedPreferences prefs = await _prefs;

      data = json.decode(response.body)["employee"] as List;
      print("Response: " + data[0]["NID"].toString());
      if (data[0]["response"].toString() == "ok") {
        _loginState = prefs.setString("loginState", "1");
        gotoDashboard(data[0]["eName"], data[0]["eID"]);
      } else {}
    } else {
      // validation error
      setState(() {
        _validate = true;
        _errorVisible = true;
      });
    }
  }

  gotoSignUp() {
    Navigator.of(context)
        .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
      return new Signup();
    }));
  }

  gotoDashboard(eName, eMail) async {
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
