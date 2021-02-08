import 'dart:convert';

import 'package:Asiatic360/constants/strings.dart';
import 'package:Asiatic360/main.dart';
import 'package:Asiatic360/utils/mainappbar.dart';
import 'package:Asiatic360/utils/universal_variables.dart';
import 'package:Asiatic360/widgets/custom_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:Asiatic360/dashboard/attendance/attendance.dart';
import 'package:Asiatic360/dashboard/vacation/vacation.dart';
import 'package:Asiatic360/dashboard/hr/hrservices.dart';
import 'package:Asiatic360/dashboard/health/health.dart';
import 'package:Asiatic360/dashboard/employee/employee.dart';
// import 'package:Asiatic360/security.dart';
// import 'package:Asiatic360/learning.dart';
import 'package:Asiatic360/dashboard/payroll.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_svg/flutter_svg.dart';

var _loginState;
Map<String, dynamic> notice;
bool fetched = false;

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyDashboard(
          title: 'Hi there ' + prefs.getString("name").split(" ")[0] + '!'),
    );
  }
}

class MyDashboard extends StatefulWidget {
  MyDashboard({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyDashboardState createState() => _MyDashboardState();
}

class _MyDashboardState extends State<MyDashboard> {
  List dashboard = [
    {'case': '1', 'field': 'Attendance', 'icon': 'assets/svgs/attendance.svg'},
    {'case': '2', 'field': 'Vacation', 'icon': 'assets/svgs/vacation.svg'},
    {
      'case': '3',
      'field': 'HR Services',
      'icon': 'assets/svgs/hr-services.svg'
    },
    {'case': '4', 'field': 'Health', 'icon': 'assets/svgs/health.svg'},
    {'case': '5', 'field': 'Employee', 'icon': 'assets/svgs/employee.svg'},
    {'case': '6', 'field': 'Payroll', 'icon': 'assets/svgs/payroll.svg'},
    {'case': '7', 'field': 'Security', 'icon': 'assets/svgs/security.svg'},
    {'case': '8', 'field': 'Learning', 'icon': 'assets/svgs/learning.svg'}
  ];

  @override
  void initState() {
    super.initState();
    getNotice();
  }

  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;
    final double itemHeight = media.height;
    final double itemWidth = media.width;

    return WillPopScope(
        onWillPop: () async => false,
        child: new Scaffold(
          appBar: PreferredSize(
            child: MainAppBar(title: widget.title, back: "dashboard"),
            preferredSize: Size.fromHeight(media.height),
          ),
          drawer: Drawer(
            child: Container(
              color: UniversalVariables.green,
              child: ListView(
                // Important: Remove any padding from the ListView.
                padding: EdgeInsets.zero,
                children: <Widget>[
                  UserAccountsDrawerHeader(
                    decoration: BoxDecoration(
                      color: UniversalVariables.green,
                    ),
                    accountName: Text(
                      prefs.getString("name"),
                      style: TextStyle(
                        color: UniversalVariables.white,
                        fontSize: 18,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    accountEmail: Text(
                      prefs.getInt("id").toString(),
                      style: TextStyle(
                        color: UniversalVariables.white,
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    currentAccountPicture: CircleAvatar(
                      backgroundColor: UniversalVariables.green,
                      backgroundImage: AssetImage('assets/images/account.png'),
                    ),
                  ),
                  Container(
                    height: media.height,
                    decoration: BoxDecoration(
                      color: UniversalVariables.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        topRight: Radius.circular(8.0),
                        bottomRight: Radius.circular(0.0),
                        bottomLeft: Radius.circular(0.0),
                      ),
                    ),
                    child: ListView(
                      // Important: Remove any padding from the ListView.
                      padding: EdgeInsets.zero,
                      children: <Widget>[
                        ListTile(
                          title: Text(
                            'My Profile',
                            style: TextStyle(
                              color: UniversalVariables.green,
                              fontSize: media.width * 0.05,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          onTap: () {
                            CustomDialog.showScaleAlertBox(
                                context: context,
                                title: 'Work in Progress',
                                icon: Icons
                                    .info_outline, // IF YOU WANT TO ADD ICON
                                color: UniversalVariables.primaryCrimson,
                                text:
                                    'This feature has not been implemented yet!', // IF YOU WANT TO ADD
                                firstButton: '',
                                secondButton: 'Back');
                          },
                        ),
                        ListTile(
                          title: Text(
                            'My Activities',
                            style: TextStyle(
                              color: UniversalVariables.green,
                              fontSize: media.width * 0.05,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          onTap: () {
                            CustomDialog.showScaleAlertBox(
                                context: context,
                                title: 'Work in Progress',
                                icon: Icons
                                    .info_outline, // IF YOU WANT TO ADD ICON
                                color: UniversalVariables.primaryCrimson,
                                text:
                                    'This feature has not been implemented yet!', // IF YOU WANT TO ADD
                                firstButton: '',
                                secondButton: 'Back');
                          },
                        ),
                        ListTile(
                          title: Text(
                            'Team Activities',
                            style: TextStyle(
                              color: UniversalVariables.green,
                              fontSize: media.width * 0.05,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          onTap: () {
                            CustomDialog.showScaleAlertBox(
                                context: context,
                                title: 'Work in Progress',
                                icon: Icons
                                    .info_outline, // IF YOU WANT TO ADD ICON
                                color: UniversalVariables.primaryCrimson,
                                text:
                                    'This feature has not been implemented yet!', // IF YOU WANT TO ADD
                                firstButton: '',
                                secondButton: 'Back');
                          },
                        ),
                        ListTile(
                          title: Text(
                            'Security',
                            style: TextStyle(
                              color: UniversalVariables.green,
                              fontSize: media.width * 0.05,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          onTap: () {
                            CustomDialog.showScaleAlertBox(
                                context: context,
                                title: 'Work in Progress',
                                icon: Icons
                                    .info_outline, // IF YOU WANT TO ADD ICON
                                color: UniversalVariables.primaryCrimson,
                                text:
                                    'This feature has not been implemented yet!', // IF YOU WANT TO ADD
                                firstButton: '',
                                secondButton: 'Back');
                          },
                        ),
                        ListTile(
                          title: Text(
                            'Privacy',
                            style: TextStyle(
                              color: UniversalVariables.green,
                              fontSize: media.width * 0.05,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          onTap: () {
                            CustomDialog.showScaleAlertBox(
                                context: context,
                                title: 'Work in Progress',
                                icon: Icons
                                    .info_outline, // IF YOU WANT TO ADD ICON
                                color: UniversalVariables.primaryCrimson,
                                text:
                                    'This feature has not been implemented yet!', // IF YOU WANT TO ADD
                                firstButton: '',
                                secondButton: 'Back');
                          },
                        ),
                        ListTile(
                          title: Text(
                            'Help Center',
                            style: TextStyle(
                              color: UniversalVariables.green,
                              fontSize: media.width * 0.05,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          onTap: () {
                            CustomDialog.showScaleAlertBox(
                                context: context,
                                title: 'Work in Progress',
                                icon: Icons
                                    .info_outline, // IF YOU WANT TO ADD ICON
                                color: UniversalVariables.primaryCrimson,
                                text:
                                    'This feature has not been implemented yet!', // IF YOU WANT TO ADD
                                firstButton: '',
                                secondButton: 'Back');
                          },
                        ),
                        ListTile(
                          title: Text(
                            'Settings',
                            style: TextStyle(
                              color: UniversalVariables.green,
                              fontSize: media.width * 0.05,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          onTap: () {
                            CustomDialog.showScaleAlertBox(
                                context: context,
                                title: 'Work in Progress',
                                icon: Icons
                                    .info_outline, // IF YOU WANT TO ADD ICON
                                color: UniversalVariables.primaryCrimson,
                                text:
                                    'This feature has not been implemented yet!', // IF YOU WANT TO ADD
                                firstButton: '',
                                secondButton: 'Back');
                          },
                        ),
                        ListTile(
                          title: Text(
                            'Logout',
                            style: TextStyle(
                              color: UniversalVariables.green,
                              fontSize: media.width * 0.05,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          onTap: () async {
                            Future<SharedPreferences> _prefs =
                                SharedPreferences.getInstance();
                            final SharedPreferences prefs = await _prefs;
                            _loginState = prefs.setString("loginState", "0");
                            _loginState = prefs.getString('loginState');
                            while (_loginState == '0') {
                              Navigator.of(context).push(
                                  MaterialPageRoute<Null>(
                                      builder: (BuildContext context) {
                                return new MyApp();
                              }));
                              break;
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: Container(
            height: media.height,
            child: Stack(
              // padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 2.0),
              children: <Widget>[
                Positioned(
                  top: media.height * 0.32,
                  width: media.width,
                  height: media.height * 0.8,
                  child: GridView.count(
                    crossAxisCount: 3,
                    padding: EdgeInsets.only(
                        left: 4.0, top: 0.0, right: 4.0, bottom: 4.0),
                    children: <Widget>[
                      makeDashboardItem(
                          1, "Attendance", "assets/svgs/attendance.svg", media),
                      makeDashboardItem(
                          2, "Vacation", "assets/svgs/vacation.svg", media),
                      makeDashboardItem(3, "HR Services",
                          "assets/svgs/hr-services.svg", media),
                      makeDashboardItem(
                          4, "Health", "assets/svgs/health.svg", media),
                      makeDashboardItem(
                          5, "Employee", "assets/svgs/employee.svg", media),
                      makeDashboardItem(
                          6, "Payroll", "assets/svgs/payroll.svg", media),
                      makeDashboardItem(
                          7, "Security", "assets/svgs/security.svg", media),
                      makeDashboardItem(
                          8, "Learning", "assets/svgs/learning.svg", media)
                    ],
                  ),
                ),
                Positioned(
                  width: media.width,
                  height: media.height * 0.32,
                  child: fetched == true
                      ? Container(
                          margin: EdgeInsets.only(
                            left: media.width * 0.04,
                            top: media.height * 0.01,
                            right: media.width * 0.04,
                            bottom: media.height * 0.01,
                          ),
                          color: UniversalVariables.red,
                          child: GridView.count(
                            crossAxisCount: 1,
                            childAspectRatio: (itemWidth / itemHeight),
                            padding: EdgeInsets.all(3.0),
                            children: <Widget>[
                              ListView.builder(
                                padding: EdgeInsets.all(0.0),
                                itemCount: notice["data"].length,
                                itemBuilder: (BuildContext context, int index) {
                                  return makeNoticeItem(
                                      notice["data"][index]['title'].toString(),
                                      notice["data"][index]['content']
                                          .toString(),
                                      media);
                                },
                              ),
                            ],
                          ),
                        )
                      : Center(
                          child: CircularProgressIndicator(
                            backgroundColor: UniversalVariables.darkgreen,
                            valueColor: new AlwaysStoppedAnimation<Color>(
                                UniversalVariables.green),
                          ),
                        ),
                )
              ],
            ),
          ),
        ));
  }

  Card makeNoticeItem(String nTitle, String nContent, Size media) {
    return Card(
      elevation: 1.0,
      margin: EdgeInsets.only(
          left: media.width * 0.02,
          top: media.height * 0.005,
          right: media.width * 0.02,
          bottom: media.height * 0.005),
      child: Container(
        height: 160,
        decoration: BoxDecoration(
          color: UniversalVariables.white,
          border: Border.all(color: UniversalVariables.green, width: 1.25),
          borderRadius: BorderRadius.circular(4.0),
          boxShadow: [
            BoxShadow(
              color: UniversalVariables.greyShadow,
              blurRadius: 4.0,
              spreadRadius: 4.0,
              offset: Offset(0.0, 2.0),
            )
          ],
        ),
        child: new InkWell(
          onTap: () {},
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            verticalDirection: VerticalDirection.down,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                  left: media.width * 0.0,
                  top: media.height * 0.0,
                  right: media.width * 0.02,
                  bottom: media.height * 0.0,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 8,
                      child: new Padding(
                        padding: EdgeInsets.only(
                            left: media.width * 0.04,
                            top: media.height * 0.0,
                            right: media.width * 0.0,
                            bottom: media.height * 0.0),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                nTitle,
                                style: TextStyle(
                                  color: UniversalVariables.black,
                                  fontSize: media.width * 0.05,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            SizedBox(
                              height: media.height * 0.0016,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                nContent,
                                style: TextStyle(
                                  color: UniversalVariables.black,
                                  fontSize: media.width * 0.032,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Card makeDashboardItem(int i, String title, String icon, Size media) {
    return Card(
        elevation: 1.0,
        margin: EdgeInsets.only(
            left: media.width * 0.02,
            top: media.height * 0.01,
            right: media.width * 0.02,
            bottom: media.height * 0.01),
        child: Container(
          decoration: BoxDecoration(color: UniversalVariables.white),
          child: new InkWell(
            onTap: () {
              switch (i.toString()) {
                case "1":
                  {
                    Navigator.pop(context);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => Attendance()));
                  }
                  break;
                case "2":
                  {
                    Navigator.pop(context);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => Vacation()));
                    // CustomDialog.showScaleAlertBox(
                    //     context: context,
                    //     title: 'Work in Progress',
                    //     icon: Icons.info_outline, // IF YOU WANT TO ADD ICON
                    //     color: UniversalVariables.primaryCrimson,
                    //     text:
                    //         'This feature has not been implemented yet!', // IF YOU WANT TO ADD
                    //     firstButton: '',
                    //     secondButton: 'Back');
                  }
                  break;
                case "3":
                  {
                    Navigator.pop(context);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => HRServices()));
                    // CustomDialog.showScaleAlertBox(
                    //     context: context,
                    //     title: 'Work in Progress',
                    //     icon: Icons.info_outline, // IF YOU WANT TO ADD ICON
                    //     color: UniversalVariables.primaryCrimson,
                    //     text:
                    //         'This feature has not been implemented yet!', // IF YOU WANT TO ADD
                    //     firstButton: '',
                    //     secondButton: 'Back');
                  }
                  break;
                case "4":
                  {
                    Navigator.pop(context);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => Health()));
                    // CustomDialog.showScaleAlertBox(
                    //     context: context,
                    //     title: 'Work in Progress',
                    //     icon: Icons.info_outline, // IF YOU WANT TO ADD ICON
                    //     color: UniversalVariables.primaryCrimson,
                    //     text:
                    //         'This feature has not been implemented yet!', // IF YOU WANT TO ADD
                    //     firstButton: '',
                    //     secondButton: 'Back');
                  }
                  break;
                case "5":
                  {
                    Navigator.pop(context);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => Employee()));
                    // CustomDialog.showScaleAlertBox(
                    //     context: context,
                    //     title: 'Work in Progress',
                    //     icon: Icons.info_outline, // IF YOU WANT TO ADD ICON
                    //     color: UniversalVariables.primaryCrimson,
                    //     text:
                    //         'This feature has not been implemented yet!', // IF YOU WANT TO ADD
                    //     firstButton: '',
                    //     secondButton: 'Back');
                  }
                  break;
                case "6":
                  {
                    Navigator.pop(context);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => Payroll()));
                    // CustomDialog.showScaleAlertBox(
                    //     context: context,
                    //     title: 'Work in Progress',
                    //     icon: Icons.info_outline, // IF YOU WANT TO ADD ICON
                    //     color: UniversalVariables.primaryCrimson,
                    //     text:
                    //         'This feature has not been implemented yet!', // IF YOU WANT TO ADD
                    //     firstButton: '',
                    //     secondButton: 'Back');
                  }
                  break;
                case "7":
                  {
                    CustomDialog.showScaleAlertBox(
                        context: context,
                        title: 'Work in Progress',
                        icon: Icons.info_outline, // IF YOU WANT TO ADD ICON
                        color: UniversalVariables.primaryCrimson,
                        text:
                            'This feature has not been implemented yet!', // IF YOU WANT TO ADD
                        firstButton: '',
                        secondButton: 'Back');
                  }
                  break;
                case "8":
                  {
                    CustomDialog.showScaleAlertBox(
                        context: context,
                        title: 'Work in Progress',
                        icon: Icons.info_outline, // IF YOU WANT TO ADD ICON
                        color: UniversalVariables.primaryCrimson,
                        text:
                            'This feature has not been implemented yet!', // IF YOU WANT TO ADD
                        firstButton: '',
                        secondButton: 'Back');
                  }
                  break;
                default:
                  {
                    Navigator.pop(context);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => Dashboard()));
                  }
                  break;
              }
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                // SizedBox(height: media.height * 0.025),
                SvgPicture.asset(
                  icon,
                  width: media.width * 0.12,
                ),
                SizedBox(height: media.height * 0.024),
                Text(title,
                    style: TextStyle(
                      color: UniversalVariables.black,
                      fontSize: media.width * 0.036,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center),
              ],
            ),
          ),
        ));
  }

  getNotice() async {
    var noticeResponse = await http.get(
        // Encode the url
        API_URL + "/api/notice/" + "1");

    notice = json.decode(noticeResponse.body);
    if (notice["response"].toString() == "1") {
      print("Notice Data: " + notice["data"][0]["content"].toString());
      setState(() {
        fetched = true;
      });
    } else {
      setState(() {
        etaki = allEmployeesData;
        fetched = false;
      });
    }
  }

  gotoLogout() {
    _loginState = prefs.getString('loginState');
    while (_loginState == '0') {
      Navigator.of(context)
          .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
        return new MyApp();
      }));
      break;
    }
  }
}
