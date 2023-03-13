import 'package:Asiatic360/constants/strings.dart';
import 'package:Asiatic360/otp_number.dart';
import 'package:Asiatic360/utils/login_signup_textFields.dart';
import 'package:Asiatic360/utils/universal_variables.dart';
import 'package:Asiatic360/widgets/custom_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:Asiatic360/dashboard.dart';
import 'package:Asiatic360/signup.dart';

var _loginState;

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
  final String assetName = 'assets/svgs/Asiatic360_logo.svg';

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
                        color: UniversalVariables.green,
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
                              color: UniversalVariables.green,
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
                                color: UniversalVariables.red,
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
                          fingerprint: false,
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
                                color: UniversalVariables.red,
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
                            color: UniversalVariables.black,
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
                        color: UniversalVariables.green,
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Login",
                            style: TextStyle(
                              color: UniversalVariables.white,
                              fontSize: media.width * 0.037,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      _validateInputs();
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
                            color: UniversalVariables.black,
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
                            "Sign Up",
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

  _validateInputs() {
    if (_employeeID.text != '' && _employeePassword.text != '') {
      try {
        doLogin(_employeeID.text, _employeePassword.text);
      } on Exception catch (e) {
        throw Exception(e);
      }
    } else {
      // validation error
      setState(() {
        _validate = true;
        _errorVisible = true;
      });
    }
  }

  doLogin(empId, empPassword) async {
    var loginResponse = await http.post(
        // Encode the url
        API_URL + "/api/user/login",
        // Only accept JSON response
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(
            <String, dynamic>{"emp_id": empId, "emp_password": empPassword}));
    // List data;

    Map<String, dynamic> data = json.decode(loginResponse.body);
    print(data["response"].toString());
    if (data["response"].toString() == "0") {
      print("Database error");
    } else if (data["response"].toString() == "1") {
      CustomDialog.showScaleAlertBox(
          context: context,
          title: 'Error!',
          icon: Icons.info_outline, // IF YOU WANT TO ADD ICON
          color: UniversalVariables.primaryCrimson,
          text: 'Invalid Employee ID or Password', // IF YOU WANT TO ADD
          firstButton: '',
          secondButton: 'Ok');
    } else if (data["response"].toString() == "2") {
      var userdetailsResponse = await http.get(
          // Encode the url
          API_URL + "/api/user/" + _employeeID.text);
      Map<String, dynamic> userData = json.decode(userdetailsResponse.body);
      if (userData["response"].toString() == "1") {
        print("Data: " + userData["employee"]["emp_name"]);
        print("Data: " + userData["employee"]["emp_id"].toString());
        gotoDashboard(
            userData["employee"]["emp_name"], userData["employee"]["emp_id"]);
      }
    } else {
      CustomDialog.showScaleAlertBox(
          context: context,
          title: 'Error!',
          icon: Icons.info_outline, // IF YOU WANT TO ADD ICON
          color: UniversalVariables.primaryCrimson,
          text: 'Invalid Employee ID or Password', // IF YOU WANT TO ADD
          firstButton: '',
          secondButton: 'Ok');
    }
  }

  gotoDashboard(empName, empId) async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    prefs.setString("name", empName);
    prefs.setInt("id", empId);
    _loginState = prefs.setString("loginState", "1");
    Navigator.of(context)
        .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
      return new Dashboard();
    }));
  }

  // gotoOTPNumber() {
  //   Navigator.of(context)
  //       .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
  //     return new OTPNumber();
  //   }));
  // }

  gotoSignUp() {
    Navigator.of(context)
        .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
      return new Signup();
    }));
  }
}
