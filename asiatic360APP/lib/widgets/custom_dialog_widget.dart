import 'package:Asiatic360/login.dart';
import 'package:Asiatic360/main.dart';
import 'package:Asiatic360/utils/universal_variables.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

var _loginState;

class CustomDialog {
  static Future showScaleAlertBox({
    @required BuildContext context,
    @required String title,
    IconData icon,
    @required Color color,
    @required String text,
    @required String firstButton,
    @required String secondButton,
  }) {
    return showGeneralDialog(
        barrierColor: Colors.black.withOpacity(0.7),
        transitionBuilder: (context, a1, a2, widget) {
          return Transform.scale(
            scale: a1.value,
            child: Opacity(
              opacity: a1.value,
              child: AlertDialog(
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                title: Center(
                    child: Text(
                  title,
                  style: TextStyle(color: UniversalVariables.black),
                )),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(
                      icon,
                      color: color,
                    ),
                    Container(
                      height: 10,
                    ),
                    Container(
                      child: Text(
                        text,
                        style: TextStyle(color: UniversalVariables.black),
                      ),
                    ),
                  ],
                ),
                actions: <Widget>[
                  MaterialButton(
                    // OPTIONAL BUTTON
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                    color: UniversalVariables.white,
                    child: Text(secondButton),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        },
        transitionDuration: Duration(milliseconds: 128),
        barrierDismissible: true,
        barrierLabel: '',
        context: context,
        pageBuilder: (context, animation1, animation2) {
          return null;
        });
  }
}
