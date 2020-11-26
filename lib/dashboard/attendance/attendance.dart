import 'dart:convert';

import 'package:Asiatic360/dashboard/attendance/attendance_logs_test.dart';
import 'package:Asiatic360/constants/strings.dart';
import 'package:Asiatic360/main.dart';
import 'package:Asiatic360/utils/mainappbar.dart';
import 'package:Asiatic360/utils/universal_variables.dart';
import 'package:Asiatic360/widgets/custom_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

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
  List _attendance;

  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;
    final double itemHeight = media.height;
    final double itemWidth = media.width;

    var dt = DateTime.now();
    var date = DateFormat("yyyy-MM-dd").format(dt);
    var time = DateFormat.jm().format(dt);
    var time0 = DateFormat("HH:mm:ss").format(dt);
    var timezone = date + " " + time0;
    int attendanceType = 1;

    print(time);
    print(timezone);

    fetchAllAttendance(media);

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
                                  flex: 2,
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
                                  flex: 4,
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
                                  flex: 2,
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
                                  flex: 4,
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
                                  flex: 2,
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
                                  flex: 4,
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
                                  onTap: () {
                                    doAttendance(prefs.getInt("id"), date,
                                        time0, timezone, attendanceType);
                                  },
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
                    itemCount: _attendance.length,
                    itemBuilder: (BuildContext context, int index) {
                      print("This is: " + _attendance[index]);
                      return makeDashboardItem(_attendance[index]['attendance_type'].toString(),
                          _attendance[index]['checkin_time'].toString(), media);
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

  fetchAllAttendance(Size media) async {
    var allAttendanceResponse = await http.get(
        // Encode the url
        API_URL + "/api/attendance/" + prefs.getInt("id").toString());
    Map<String, dynamic> allAttendanceData =
        json.decode(allAttendanceResponse.body);
    _attendance = allAttendanceData["data"];
    // if (allAttendanceData["response"].toString() == "1") {
    // for (var i = 0; i < _attendance.length; i++) {
    // print("This is: " + _attendance[i].toString());
    // print("Data: " + allAttendanceData["data"][i].toString());
    // makeDashboardItem(allAttendanceData["data"][i]["attendance_type"],
    //     allAttendanceData["data"][i]["checkin_time"], media);
    // }
    // }
  }

  doAttendance(
      empId, checkinDate, checkinTime, checkinTz, attendanceType) async {
    var attendanceResponse = await http.post(
        // Encode the url
        API_URL + "/api/attendance/",
        // Only accept JSON response
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, dynamic>{
          "emp_id": empId,
          "checkin_date": checkinDate,
          "checkin_time": checkinTime,
          "attendance_type": attendanceType
        }));
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;

    Map<String, dynamic> data = json.decode(attendanceResponse.body);
    print("Response: " + data["response"].toString());
    if (data["response"].toString() == "1") {
      print("Attendance Recorded");
      CustomDialog.showScaleAlertBox(
          context: context,
          title: 'Attendance',
          icon: Icons.done_rounded, // IF YOU WANT TO ADD ICON
          color: UniversalVariables.green,
          text: 'Attendance Recorded', // IF YOU WANT TO ADD
          firstButton: '',
          secondButton: 'Ok');
    } else {
      print("Attendance Not Recorded");
      CustomDialog.showScaleAlertBox(
          context: context,
          title: 'Attendance',
          icon: Icons.info_outline, // IF YOU WANT TO ADD ICON
          color: UniversalVariables.primaryCrimson,
          text: 'Attendance Not Recorded', // IF YOU WANT TO ADD
          firstButton: '',
          secondButton: 'Ok');
    }
  }

  getColor(checkin) {
    if (checkin < "10:30 AM") {
      return UniversalVariables.green;
    } else {
      return UniversalVariables.red;
    }
  }
}
