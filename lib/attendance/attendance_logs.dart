import 'package:asiatic360/utils/mainappbar.dart';
import 'package:asiatic360/utils/universal_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Color white = Color(0xFFFFFFFF);
Color greyShadow = Color(0xFF33808184);
Color grey = Color(0xFF808184);
Color black = Color(0xFF000000);
Color green = Color(0xFF6B8449);
Color darkgreen = Color(0xFF4C5B39);
Color yellow = Color(0xFFFFC800);
Color red = Color(0XFFFD3131);

void main() {
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(AttendanceLogs());
}

class AttendanceLogs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Attendance',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyAttendanceLogs(title: 'Attendance Logs'),
    );
  }
}

class MyAttendanceLogs extends StatefulWidget {
  MyAttendanceLogs({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyAttendanceLogsState createState() => _MyAttendanceLogsState();
}

class _MyAttendanceLogsState extends State<MyAttendanceLogs> {
  List attendanceLogs = [
    {
      'date': '18/10/2019',
      'checkin': '10:31 AM',
      'checkout': '08:47 PM',
      'late': true
    },
    {
      'date': '17/10/2019',
      'checkin': '10:05 AM',
      'checkout': '08:47 PM',
      'late': false
    },
    {
      'date': '16/10/2019',
      'checkin': '10:05 AM',
      'checkout': '08:47 PM',
      'late': false
    },
    {
      'date': '15/10/2019',
      'checkin': '10:45 AM',
      'checkout': '08:47 PM',
      'late': true
    },
    {
      'date': '12/10/2019',
      'checkin': '10:05 AM',
      'checkout': '08:47 PM',
      'late': false
    },
    {
      'date': '11/10/2019',
      'checkin': '10:15 AM',
      'checkout': '08:47 PM',
      'late': false
    },
    {
      'date': '10/10/2019',
      'checkin': '10:05 AM',
      'checkout': '08:47 PM',
      'late': false
    },
    {
      'date': '09/10/2019',
      'checkin': '10:05 AM',
      'checkout': '08:47 PM',
      'late': false
    },
    {
      'date': '08/10/2019',
      'checkin': '10:50 AM',
      'checkout': '08:47 PM',
      'late': true
    },
    {
      'date': '07/10/2019',
      'checkin': '10:05 AM',
      'checkout': '08:47 PM',
      'late': false
    }
  ];

  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;
    final double itemHeight = media.height;
    final double itemWidth = media.width;

    return Scaffold(
      appBar: PreferredSize(
        child: MainAppBar(title: widget.title, back: "attendanceLogs"),
        preferredSize: Size.fromHeight(media.height),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 2.0),
        child: GridView.count(
          crossAxisCount: 1,
          childAspectRatio: (itemWidth / (itemHeight * 0.9)),
          padding: EdgeInsets.all(4.0),
          children: <Widget>[
            ListView.builder(
              padding: EdgeInsets.all(0.0),
              itemCount: attendanceLogs.length,
              itemBuilder: (BuildContext context, int index) {
                return makeDashboardItem(
                    attendanceLogs[index]['date'],
                    attendanceLogs[index]['checkin'],
                    attendanceLogs[index]['checkout'],
                    attendanceLogs[index]['late'],
                    media);
              },
            ),
          ],
        ),
      ),
    );
  }

  Card makeDashboardItem(
      String date, String checkin, String checkout, bool late, Size media) {
    return Card(
      elevation: 1.0,
      margin: EdgeInsets.only(
          left: media.width * 0.02,
          top: media.height * 0.005,
          right: media.width * 0.02,
          bottom: media.height * 0.005),
      child: Container(
        height: media.height * 0.114,
        decoration: BoxDecoration(
          color: late == true ? red : green,
          borderRadius: BorderRadius.circular(4.0),
          boxShadow: [
            BoxShadow(
              color: UniversalVariables.greyShadow,
              blurRadius: 4.0,
              spreadRadius: 2.0,
              offset: Offset(0.0, 2.0),
            ),
          ],
        ),
        child: Container(
          height: media.height * 0.114,
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(4.0),
                bottomLeft: Radius.circular(4.0)),
          ),
          margin: EdgeInsets.only(right: media.width * 0.01),
          child: InkWell(
            onTap: () {},
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(
                    left: media.width * 0.02,
                    top: media.height * 0.0075,
                    right: media.width * 0.02,
                    bottom: media.height * 0.0075,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        flex: 4,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            date,
                            style: TextStyle(
                              color: green,
                              fontSize: media.width * 0.04,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: new Padding(
                          padding: EdgeInsets.only(
                              left: media.width * 0.04,
                              top: media.height * 0.0,
                              right: media.width * 0.0,
                              bottom: media.height * 0.0),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Check-In",
                                  style: TextStyle(
                                    color: green,
                                    fontSize: media.width * 0.04,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    decoration: TextDecoration.underline,
                                    decorationColor: green,
                                    decorationThickness: 2.0,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              SizedBox(
                                height: media.height * 0.0016,
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  checkin,
                                  style: TextStyle(
                                    color: green,
                                    fontSize: media.width * 0.04,
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
                      Expanded(
                        flex: 3,
                        child: new Padding(
                          padding: EdgeInsets.only(
                              left: media.width * 0.04,
                              top: media.height * 0.01,
                              right: media.width * 0.0,
                              bottom: media.height * 0.01),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Check-Out",
                                  style: TextStyle(
                                    color: green,
                                    fontSize: media.width * 0.04,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    decoration: TextDecoration.underline,
                                    decorationColor: green,
                                    decorationThickness: 2.0,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              SizedBox(
                                height: media.height * 0.0016,
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  checkout,
                                  style: TextStyle(
                                    color: green,
                                    fontSize: media.width * 0.04,
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
      ),
    );
  }

  getColor(checkin) {
    if (checkin < "10:30 AM") {
      return green;
    } else {
      return red;
    }
  }
}
