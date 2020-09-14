import 'package:asiatic360/constants/strings.dart';
import 'package:asiatic360/otp_number.dart';
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
                      gotoOTPNumber();
                    },
                  ),
                ),
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

  gotoOTPNumber() {
    Navigator.of(context)
        .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
      return new OTPNumber();
    }));
  }

  gotoSignUp() {
    Navigator.of(context)
        .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
      return new Signup();
    }));
  }
}
