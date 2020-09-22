import 'package:asiatic360/utils/mainappbar.dart';
import 'package:asiatic360/utils/universal_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    {'date': '18/10/2019', 'checkin': '10:05 AM', 'checkout': '08:47 PM'},
    {'date': '17/10/2019', 'checkin': '10:05 AM', 'checkout': '08:47 PM'},
    {'date': '16/10/2019', 'checkin': '10:05 AM', 'checkout': '08:47 PM'},
    {'date': '15/10/2019', 'checkin': '10:05 AM', 'checkout': '08:47 PM'},
    {'date': '12/10/2019', 'checkin': '10:05 AM', 'checkout': '08:47 PM'},
    {'date': '11/10/2019', 'checkin': '10:05 AM', 'checkout': '08:47 PM'},
    {'date': '10/10/2019', 'checkin': '10:05 AM', 'checkout': '08:47 PM'},
    {'date': '09/10/2019', 'checkin': '10:05 AM', 'checkout': '08:47 PM'},
    {'date': '08/10/2019', 'checkin': '10:05 AM', 'checkout': '08:47 PM'},
    {'date': '07/10/2019', 'checkin': '10:05 AM', 'checkout': '08:47 PM'}
  ];

  @override
  Widget build(BuildContext context) {
    
    Size media = MediaQuery.of(context).size;
    final double itemHeight = media.height;
    final double itemWidth = media.width;

    return Scaffold(
      appBar: PreferredSize(
        child: MainAppBar(title: widget.title, back: "attendance"),
        preferredSize: Size.fromHeight(media.height),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 2.0),
        child: GridView.count(
          crossAxisCount: 1,
          childAspectRatio: (itemWidth / itemHeight),
          padding: EdgeInsets.all(4.0),
          children: <Widget>[
            ListView.builder(
              padding: EdgeInsets.all(0.0),
              itemCount: attendance.length,
              itemBuilder: (BuildContext context, int index){
                return makeDashboardItem(
                  attendance[index]['date'],
                  attendance[index]['checkin'],
                  attendance[index]['checkout'],
                  media
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Card makeDashboardItem(String date, String checkin, String checkout, Size media) {
    return Card(
      elevation: 1.0,
      margin: EdgeInsets.only(
        left: media.width * 0.02,
        top: media.height * 0.005,
        right: media.width * 0.02,
        bottom: media.height * 0.005
      ),
      child: Container(
        height: media.height * 0.114,
        decoration: BoxDecoration(
          color: UniversalVariables.white,
          border: Border.all(
            color: UniversalVariables.green,
            width: 1.25
          ),
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
                            color: UniversalVariables.green,
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
                          bottom: media.height * 0.0
                        ),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Check-In",
                                style: TextStyle(
                                  color: UniversalVariables.green,
                                  fontSize: media.width * 0.04,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.underline,
                                  decorationColor: UniversalVariables.green,
                                  decorationThickness: 2.0,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            SizedBox(height: media.height * 0.0016,),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                checkin,
                                style: TextStyle(
                                  color: UniversalVariables.green,
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
                          bottom: media.height * 0.01
                        ),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Check-Out",
                                style: TextStyle(
                                  color: UniversalVariables.green,
                                  fontSize: media.width * 0.04,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.underline,
                                  decorationColor: UniversalVariables.green,
                                  decorationThickness: 2.0,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            SizedBox(height: media.height * 0.0016,),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                checkout,
                                style: TextStyle(
                                  color: UniversalVariables.green,
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