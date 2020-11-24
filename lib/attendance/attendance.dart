import 'package:asiatic360/attendance/attendance_logs_test.dart';
import 'package:asiatic360/utils/mainappbar.dart';
import 'package:asiatic360/utils/universal_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

void main() {
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(Attendance());
}

class Attendance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Attendance',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyAttendance(title: 'Attendance'),
    );
  }
}

class MyAttendance extends StatefulWidget {
  MyAttendance({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyAttendanceState createState() => _MyAttendanceState();
}

class _MyAttendanceState extends State<MyAttendance> {
  List attendance = [
    {'via': 'App', 'checkin': '10:05 AM'},
    {'via': 'App', 'checkin': '10:31 AM'},
    {'via': 'App', 'checkin': '11:30 AM'},
    {'via': 'App', 'checkin': '12:05 PM'},
    {'via': 'App', 'checkin': '01:05 PM'},
    {'via': 'App', 'checkin': '03:05 PM'},
    {'via': 'App', 'checkin': '04:24 PM'},
    {'via': 'App', 'checkin': '05:47 PM'}
  ];

  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;
    final double itemHeight = media.height;
    final double itemWidth = media.width;

    var dt = DateTime.now();
    var date = DateFormat.yMMMMd().format(dt);
    var time = DateFormat.jm().format(dt);
    // var timezone = DateFormat.z().format(dt);

    return Scaffold(
      appBar: PreferredSize(
        child: MainAppBar(title: widget.title, back: "attendance"),
        preferredSize: Size.fromHeight(media.height),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 2.0),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: Stack(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: UniversalVariables.grey,
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
                        margin: EdgeInsets.only(right: media.width * 0.01),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8.0),
                              bottomLeft: Radius.circular(8.0)),
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: RichText(
                                      text: TextSpan(
                                        text: "Status",
                                        style: new TextStyle(
                                          color: UniversalVariables.green,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: RichText(
                                      text: TextSpan(
                                        text: "Not Checked In",
                                        style: new TextStyle(
                                          color: UniversalVariables.green,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: RichText(
                                      text: TextSpan(
                                        text: "Date",
                                        style: new TextStyle(
                                          color: UniversalVariables.green,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Align(
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
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: RichText(
                                      text: TextSpan(
                                        text: "Time",
                                        style: new TextStyle(
                                          color: UniversalVariables.green,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: RichText(
                                      text: TextSpan(
                                        text: time,
                                        style: new TextStyle(
                                          color: UniversalVariables.green,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: media.height * 0.04,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                GestureDetector(
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        top: media.height * 0.0,
                                        left: media.width * 0.0,
                                        bottom: 0.0,
                                        right: media.width * 0.0),
                                    height: media.height * 0.05,
                                    width: media.width * 0.24,
                                    decoration: BoxDecoration(
                                      color: UniversalVariables.green,
                                      borderRadius: BorderRadius.circular(3),
                                    ),
                                    child: new Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Align(
                                          alignment: Alignment.center,
                                          child: RichText(
                                            text: TextSpan(
                                              text: "Check-In",
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
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 12.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: RichText(
                            text: TextSpan(
                              text: "Todays Logs:",
                              style: new TextStyle(
                                color: UniversalVariables.green,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(),
                    ),
                    Expanded(
                      flex: 2,
                      child: GestureDetector(
                        child: Container(
                          padding: EdgeInsets.only(
                              top: media.height * 0.0,
                              left: media.width * 0.0,
                              bottom: 0.0,
                              right: media.width * 0.0),
                          height: media.height * 0.05,
                          width: media.width * 0.2,
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
                                    text: "All Logs",
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
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  AttendanceLogs()));
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: GridView.count(
                crossAxisCount: 1,
                childAspectRatio: (itemWidth / (itemHeight * 0.9)),
                padding: EdgeInsets.all(4.0),
                children: <Widget>[
                  ListView.builder(
                    padding: EdgeInsets.all(0.0),
                    itemCount: attendance.length,
                    itemBuilder: (BuildContext context, int index) {
                      return makeDashboardItem(attendance[index]['via'],
                          attendance[index]['checkin'], media);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Card makeDashboardItem(String via, String checkin, Size media) {
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
          color: UniversalVariables.white,
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
        child: new InkWell(
          onTap: () {},
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
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
                      flex: 1,
                      child: Container(),
                    ),
                    Expanded(
                      flex: 2,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: RichText(
                          text: TextSpan(
                            text: "Via " + via,
                            style: new TextStyle(
                              color: UniversalVariables.green,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(),
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
                              alignment: Alignment.centerRight,
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
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(),
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

  getColor(checkin) {
    if (checkin < "10:30 AM") {
      return UniversalVariables.green;
    } else {
      return UniversalVariables.red;
    }
  }
}