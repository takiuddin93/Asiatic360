import 'package:asiatic360/main.dart';
import 'package:asiatic360/utils/mainappbar.dart';
import 'package:asiatic360/widgets/custom_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:asiatic360/dashboard/attendance.dart';
import 'package:asiatic360/dashboard/vacation/vacation.dart';
import 'package:asiatic360/dashboard/hr/hrservices.dart';
import 'package:asiatic360/dashboard/health/health.dart';
import 'package:asiatic360/dashboard/employee/employee.dart';
// import 'package:asiatic360/security.dart';
// import 'package:asiatic360/learning.dart';
import 'package:asiatic360/dashboard/payroll.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_svg/flutter_svg.dart';

Color green = Color(0xFF6B8449);
Color darkgreen = Color(0xFF4C5B39);
Color black = Color(0xFF000000);
Color grey = Color(0xFF808184);
Color greyShadow = Color(0xFF33808184);
Color red = Color(0XFFFD3131);
Color white = Color(0xFFFFFFFF);

var _loginState;

void main() async {
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(Dashboard());
}

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
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;

    return WillPopScope(
        onWillPop: () async => false,
        child: new Scaffold(
          appBar: PreferredSize(
            child: MainAppBar(title: widget.title, back: "dashboard"),
            preferredSize: Size.fromHeight(media.height),
          ),
          drawer: Drawer(
            child: Container(
              color: green,
              child: ListView(
                // Important: Remove any padding from the ListView.
                padding: EdgeInsets.zero,
                children: <Widget>[
                  UserAccountsDrawerHeader(
                    decoration: BoxDecoration(
                      color: green,
                    ),
                    accountName: Text(
                      prefs.getString("name"),
                      style: TextStyle(
                        color: white,
                        fontSize: media.width * 0.05,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    accountEmail: Text(
                      prefs.getString("email"),
                      style: TextStyle(
                        color: white,
                        fontSize: media.width * 0.03,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    currentAccountPicture: CircleAvatar(
                      backgroundColor: green,
                      backgroundImage: AssetImage('assets/images/account.png'),
                    ),
                  ),
                  Container(
                    height: media.height,
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16.0),
                        topRight: Radius.circular(16.0),
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
                              color: green,
                              fontSize: media.width * 0.05,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          onTap: () {
                            dialogue();
                          },
                        ),
                        ListTile(
                          title: Text(
                            'My Activities',
                            style: TextStyle(
                              color: green,
                              fontSize: media.width * 0.05,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          onTap: () {
                            dialogue();
                          },
                        ),
                        ListTile(
                          title: Text(
                            'Team Activities',
                            style: TextStyle(
                              color: green,
                              fontSize: media.width * 0.05,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          onTap: () {
                            dialogue();
                          },
                        ),
                        ListTile(
                          title: Text(
                            'Security',
                            style: TextStyle(
                              color: green,
                              fontSize: media.width * 0.05,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          onTap: () {
                            dialogue();
                          },
                        ),
                        ListTile(
                          title: Text(
                            'Privacy',
                            style: TextStyle(
                              color: green,
                              fontSize: media.width * 0.05,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          onTap: () {
                            dialogue();
                          },
                        ),
                        ListTile(
                          title: Text(
                            'Help Center',
                            style: TextStyle(
                              color: green,
                              fontSize: media.width * 0.05,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          onTap: () {
                            dialogue();
                          },
                        ),
                        ListTile(
                          title: Text(
                            'Settings',
                            style: TextStyle(
                              color: green,
                              fontSize: media.width * 0.05,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          onTap: () {
                            dialogue();
                          },
                        ),
                        ListTile(
                          title: Text(
                            'Logout',
                            style: TextStyle(
                              color: green,
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
                            showDialog<void>(
                              context: context,
                              barrierDismissible:
                                  false, // user must tap button!
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Logout'),
                                  content: SingleChildScrollView(
                                    child: ListBody(
                                      children: <Widget>[
                                        Text('Do you want to Logout?'),
                                      ],
                                    ),
                                  ),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: Text('Confirm'),
                                      onPressed: () {
                                        _loginState =
                                            prefs.setString("loginState", "0");
                                        gotoLogout();
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    FlatButton(
                                      child: Text('Cancel'),
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
                  top: media.height * 0.0,
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
              ],
            ),
          ),
        ));
  }

  void dialogue() {
    CustomDialog.showScaleAlertBox(
      context: context,
      title: 'Work in Progress',
      icon: Icons.info_outline, // IF YOU WANT TO ADD ICON
      text: 'This feature has not been implemented yet!', // IF YOU WANT TO ADD
      firstButton: 'Back',
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
          decoration: BoxDecoration(color: white),
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
                  }
                  break;
                case "3":
                  {
                    Navigator.pop(context);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => HRServices()));
                  }
                  break;
                case "4":
                  {
                    Navigator.pop(context);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => Health()));
                  }
                  break;
                case "5":
                  {
                    Navigator.pop(context);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => Employee()));
                  }
                  break;
                case "6":
                  {
                    Navigator.pop(context);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => Payroll()));
                  }
                  break;
                case "7":
                  {
                    dialogue();
                  }
                  break;
                case "8":
                  {
                    dialogue();
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
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                SizedBox(height: media.height * 0.025),
                SvgPicture.asset(
                  icon,
                ),
                Text(title,
                    style: TextStyle(
                      color: black,
                      fontSize: media.width * 0.04,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center),
              ],
            ),
          ),
        ));
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
