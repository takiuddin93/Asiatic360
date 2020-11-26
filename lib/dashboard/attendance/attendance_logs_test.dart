import 'package:Asiatic360/utils/mainappbar.dart';
import 'package:Asiatic360/utils/universal_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(AttendanceLogs());
}

class AttendanceLogs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Attendance Logs',
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
      'checkin': '10:36 AM',
      'checkout': '08:47 PM',
      'late': true
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
      child: Stack(
        children: [
          Container(
            height: 104,
            decoration: BoxDecoration(
              color: late == true
                  ? UniversalVariables.red
                  : UniversalVariables.green,
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
            child: null,
          ),
          Container(
            height: 104,
            decoration: BoxDecoration(
              color: UniversalVariables.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4.0),
                  bottomLeft: Radius.circular(4.0)),
            ),
            margin: EdgeInsets.only(right: media.width * 0.01),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                        text: TextSpan(
                          text: date,
                          style: new TextStyle(
                            color: UniversalVariables.green,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: RichText(
                                text: TextSpan(
                                  text: "Check-In",
                                  style: new TextStyle(
                                    color: UniversalVariables.green,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 2,
                              width: 64,
                              decoration: BoxDecoration(
                                color: UniversalVariables.green,
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: RichText(
                                text: TextSpan(
                                  text: checkin,
                                  style: new TextStyle(
                                    color: UniversalVariables.green,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Column(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: RichText(
                                text: TextSpan(
                                  text: "Check-Out",
                                  style: new TextStyle(
                                    color: UniversalVariables.green,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 2,
                              width: 76,
                              decoration: BoxDecoration(
                                color: UniversalVariables.green,
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: RichText(
                                text: TextSpan(
                                  text: checkout,
                                  style: new TextStyle(
                                    color: UniversalVariables.green,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    GestureDetector(
                      child: Container(
                        padding: EdgeInsets.all(0.0),
                        height: media.height * 0.05,
                        width: media.width * 0.24,
                        decoration: BoxDecoration(
                          color: UniversalVariables.green,
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Align(
                              alignment: Alignment.center,
                              child: RichText(
                                text: TextSpan(
                                  text: "View Logs",
                                  style: new TextStyle(
                                    color: UniversalVariables.white,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  getColor(checkin) {
    if (checkin < "10:30 AM") {
      return UniversalVariables.green;
    } else {
      return UniversalVariables.red;
    }
  }
}
