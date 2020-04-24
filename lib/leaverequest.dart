import 'package:asiatic360/utils/mainappbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:asiatic360/newleaverequest.dart';

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
  runApp(LeaveRequest());
}

class LeaveRequest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Leave Request',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyLeaveRequest(title: 'Leave Request'),
    );
  }
}

class MyLeaveRequest extends StatefulWidget {
  MyLeaveRequest({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyLeaveRequestState createState() => _MyLeaveRequestState();
}

class _MyLeaveRequestState extends State<MyLeaveRequest> {

  List leaveRequest = [
    {'date': '12/01/2020', 'status': 'pending'},
    {'date': '12/10/2019', 'status': 'approved'},
    {'date': '08/05/2019', 'status': 'approved'},
    {'date': '12/03/2019', 'status': 'approved'},
    {'date': '06/03/2019', 'status': 'approved'},
    {'date': '08/02/2019', 'status': 'approved'},
    {'date': '11/12/2018', 'status': 'approved'},
    {'date': '10/10/2018', 'status': 'rejected'},
    {'date': '09/09/2018', 'status': 'approved'},
    {'date': '09/07/2018', 'status': 'approved'},
    {'date': '08/06/2018', 'status': 'rejected'},
    {'date': '07/04/2018', 'status': 'approved'},
    {'date': '08/03/2018', 'status': 'approved'},
    {'date': '07/01/2018', 'status': 'approved'}
  ];

  @override
  Widget build(BuildContext context) {
    
    Size media = MediaQuery.of(context).size;
    final double itemHeight = media.height;
    final double itemWidth = media.width;

    return Scaffold(
      appBar: PreferredSize(
        child: MainAppBar(title: widget.title, back: "leaverequest"),
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
              itemCount: leaveRequest.length,
              itemBuilder: (BuildContext context, int index){
                return makeDashboardItem(
                  leaveRequest[index]['date'],
                  leaveRequest[index]['status'],
                  media
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text("Request"),
        onPressed: () {
          Navigator.pop(context);
          Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => NewLeaveRequest())
          );
        },
        icon: Icon(Icons.add,),
        foregroundColor: white,
        backgroundColor: green,
      ),
    );
  }

  Card makeDashboardItem(String date, String status, Size media) {
    return Card(
      elevation: 1.0,
      margin: EdgeInsets.only(
        left: media.width * 0.02,
        top: media.height * 0.01,
        right: media.width * 0.02,
        bottom: media.height * 0.01
      ),
      child: Container(
        height: media.height * 0.064,
        decoration: BoxDecoration(
          color: white,
          border: Border.all(
            color: getColor(status),
            width: 1.25
          ),
          borderRadius: BorderRadius.circular(4.0),
          boxShadow: [
            BoxShadow(
              color: greyShadow,
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
                  top: media.height * 0.0,
                  right: media.width * 0.02,
                  bottom: media.height * 0.0,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 5,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          date,
                          style: TextStyle(
                            color: getColor(status),
                            fontSize: media.width * 0.04,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 5,
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
                              alignment: Alignment.centerRight,
                              child: Text(
                                status,
                                style: TextStyle(
                                  color: getColor(status),
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

  
  getColor(status) {
    if (status == "pending") {
      return yellow;
    } else if (status == "approved") {
      return green;
    } else {
      return red;
    }
  }

}

