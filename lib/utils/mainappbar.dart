import 'package:asiatic360/asiatic360_app_icons_icons.dart';
import 'package:asiatic360/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:asiatic360/utils/mainappbar_style.dart';

import '../main.dart';

Color green = Color(0xFF6B8449);
Color darkgreen = Color(0xFF4C5B39);
Color black = Color(0xFF000000);
Color grey = Color(0xFF808184);
Color greyShadow = Color(0xFF33808184);
Color red = Color(0XFFFD3131);
Color white = Color(0xFFFFFFFF);

class MainAppBar extends StatelessWidget {
  final String title, back;
  static const String wavingHandEmoji = "\uD83D\uDC4B";
  static const String whiteSkinTone = "\uD83C\uDFFB";

  const MainAppBar({Key key, this.title, this.back}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Container(
        height: appBarHeight(context),
        color: white,
        child: Padding(
          padding: EdgeInsets.all(0.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex:2,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child:_buildleading(context),
                ),
              ),
              Expanded(
                flex: 6,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child:_buildLabel(context),
                ),
              ),
              Expanded(
                flex: 2,
                child: Align(
                  alignment: Alignment.centerRight,
                  child:_buildaction(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Builder _buildleading(BuildContext context) {
    IconData _iconData;
    switch (back.toString()) {
      case "dashboard" : {
        _iconData = Asiatic360AppIcons.menu;
        return Builder(
          builder: (context) => IconButton(
            color: green,
            icon: new Icon(_iconData,),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        );
      }
      break;
      case "attendance" : {
        _iconData = Icons.arrow_back;
      }
      break;
      case "vacation" : {
        _iconData = Icons.arrow_back;
      }
      break;
      case "leaverequest" : {
        _iconData = Icons.arrow_back;
      }
      break;
      case "newleaverequest" : {
        _iconData = Icons.arrow_back;
      }
      break;
      case "hrservices" : {
        _iconData = Icons.arrow_back;
      }
      break;
      case "salarycertificate" : {
        _iconData = Icons.arrow_back;
      }
      break;
      case "newsalarycertificate" : {
        _iconData = Icons.arrow_back;
      }
      break;
      case "payslip" : {
        _iconData = Icons.arrow_back;
      }
      break;
      case "health" : {
        _iconData = Icons.arrow_back;
      }
      break;
      case "medicalallowance" : {
        _iconData = Icons.arrow_back;
      }
      break;
      case "newmedicalrequest" : {
        _iconData = Icons.arrow_back;
      }
      break;
      case "blooddonation" : {
        _iconData = Icons.arrow_back;
      }
      break;
      case "employee" : {
        _iconData = Icons.arrow_back;
      }
      break;
      case "employeedetails" : {
        _iconData = Icons.arrow_back;
      }
      break;
      case "payroll" : {
        _iconData = Icons.arrow_back;
      }
      break;
      case "security" : {
        _iconData = Icons.arrow_back;
      }
      break;
      case "learning" : {
        _iconData = Icons.arrow_back;
      }
      break;
      default: {
        Navigator.pop(context);
        Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => Dashboard())
        );
      }
      break;
    }
    return Builder(
      builder: (context) => IconButton(
        color: green,
        icon: new Icon(_iconData, color: green,),
        onPressed: () {
          Navigator.pop(context);
          Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => Dashboard())
          );                
        },
      ),
    );
  }
  
  RichText _buildLabel(BuildContext context) {
    String _getEmoji;
    if(title == 'Hi there ' + prefs.getString("name").split(" ")[0] + '!') {
      _getEmoji = getEmoji(context);
    } else {
      _getEmoji = '';
    }
    return RichText(
        text: TextSpan(
          style: new TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            fontSize: 24.0,
            color: green,
          ),
          children: [
            TextSpan(
              text: title,
            ),
            TextSpan(text: _getEmoji),
          ],
        ),
      );
  }

  Builder _buildaction(BuildContext context) {
    String _alertdialogTitle, _alertdialogDescription, _alertdialogButton;
    if(title == 'Hi there ' + prefs.getString("name").split(" ")[0] + '!') {
      _alertdialogTitle = 'Work in Progress';
      _alertdialogDescription = 'This feature has not been implemented yet!';
      _alertdialogButton = 'Back';
    } else {

    }
    return Builder(
      builder: (context) => IconButton(
        color: green,
        icon: new Icon(Asiatic360AppIcons.notification),
        onPressed: () {
          showDialog<void>(
            context: context,
            barrierDismissible: false, // user must tap button!
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(_alertdialogTitle),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[
                      Text(_alertdialogDescription),
                    ],
                  ),
                ),
                actions: <Widget>[
                  FlatButton(
                    child: Text(_alertdialogButton),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }

  // https://github.com/flutter/flutter/issues/9652
  String getEmoji(BuildContext context) {
    return Theme.of(context).platform == TargetPlatform.iOS
        ? wavingHandEmoji
        : wavingHandEmoji + whiteSkinTone;
  }
}
