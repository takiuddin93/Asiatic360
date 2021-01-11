import 'package:Asiatic360/utils/universal_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Asiatic360/utils/mainappbar.dart';

void main() {
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(Payslip());
}

class Payslip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Payslip',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyPayslip(title: 'Payslip'),
    );
  }
}

class MyPayslip extends StatefulWidget {
  MyPayslip({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyPayslipState createState() => _MyPayslipState();
}

class _MyPayslipState extends State<MyPayslip> {
  List leaveRequest = [
    {'date': '01/01/2020'},
    {'date': '12/12/2019'},
    {'date': '08/11/2019'},
    {'date': '12/10/2019'},
    {'date': '06/09/2019'},
    {'date': '08/08/2019'},
    {'date': '11/07/2019'},
    {'date': '10/06/2019'},
    {'date': '09/05/2019'},
    {'date': '09/04/2019'},
    {'date': '08/03/2019'},
    {'date': '07/02/2019'},
    {'date': '08/01/2019'},
    {'date': '02/12/2018'},
    {'date': '03/11/2018'},
    {'date': '07/10/2018'},
    {'date': '01/09/2018'},
    {'date': '05/08/2018'},
    {'date': '04/07/2018'},
    {'date': '06/06/2018'},
    {'date': '03/05/2018'},
    {'date': '04/04/2018'},
    {'date': '02/03/2018'},
    {'date': '01/02/2018'},
    {'date': '09/01/2018'},
    {'date': '10/12/2018'},
    {'date': '11/11/2018'},
    {'date': '03/10/2018'}
  ];

  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;
    final double itemHeight = media.height;
    final double itemWidth = media.width;

    return Scaffold(
      appBar: PreferredSize(
        child: MainAppBar(title: widget.title, back: "payslip"),
        preferredSize: Size.fromHeight(media.height),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            width: media.width,
            child: Container(
              padding: EdgeInsets.only(
                left: media.width * 0.08,
                top: media.height * 0.016,
                right: media.width * 0.08,
              ),
              child: Container(
                height: media.height * 0.24,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      UniversalVariables.green,
                      Color(0XFFA7C57D),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          flex: 8,
                          child: new Padding(
                            padding: EdgeInsets.only(
                                left: media.width * 0.024,
                                top: media.height * 0.016,
                                right: media.width * 0.0,
                                bottom: media.height * 0.0),
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Pay",
                                    style: TextStyle(
                                      color: UniversalVariables.white,
                                      fontSize: media.width * 0.04,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: new Padding(
                            padding: EdgeInsets.only(
                                left: media.width * 0.0,
                                top: media.height * 0.016,
                                right: media.width * 0.024,
                                bottom: media.height * 0.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Image.asset(
                                    'assets/images/asiaticpaycard.png',
                                    width: media.width * 0.1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: media.height * 0.016),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          flex: 5,
                          child: new Padding(
                            padding: EdgeInsets.only(
                                left: media.width * 0.024,
                                top: media.height * 0.0,
                                right: media.width * 0.0,
                                bottom: media.height * 0.0),
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "monthly",
                                    style: TextStyle(
                                      color: UniversalVariables.white,
                                      fontSize: media.width * 0.025,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: new Padding(
                            padding: EdgeInsets.only(
                                left: media.width * 0.0,
                                top: media.height * 0.0,
                                right: media.width * 0.024,
                                bottom: media.height * 0.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    "yearly",
                                    style: TextStyle(
                                      color: UniversalVariables.white,
                                      fontSize: media.width * 0.025,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: null,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: media.height * 0.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          flex: 4,
                          child: new Padding(
                            padding: EdgeInsets.only(
                                left: media.width * 0.024,
                                top: media.height * 0.0,
                                right: media.width * 0.0,
                                bottom: media.height * 0.0),
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "৳ XX,XXX",
                                    style: TextStyle(
                                      color: UniversalVariables.white,
                                      fontSize: media.width * 0.05,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: new Padding(
                            padding: EdgeInsets.only(
                                left: media.width * 0.024,
                                top: media.height * 0.0,
                                right: media.width * 0.0,
                                bottom: media.height * 0.0),
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "/",
                                    style: TextStyle(
                                      color: UniversalVariables.white,
                                      fontSize: media.width * 0.05,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: new Padding(
                            padding: EdgeInsets.only(
                                left: media.width * 0.0,
                                top: media.height * 0.0,
                                right: media.width * 0.024,
                                bottom: media.height * 0.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    "৳ XXX,XXX",
                                    style: TextStyle(
                                      color: UniversalVariables.white,
                                      fontSize: media.width * 0.05,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: null,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: media.height * 0.032),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: new Padding(
                            padding: EdgeInsets.only(
                                left: media.width * 0.024,
                                top: media.height * 0.0,
                                right: media.width * 0.0,
                                bottom: media.height * 0.0),
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    "last payment",
                                    style: TextStyle(
                                      color: UniversalVariables.white,
                                      fontSize: media.width * 0.025,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w300,
                                    ),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: new Padding(
                            padding: EdgeInsets.only(
                                left: media.width * 0.024,
                                top: media.height * 0.0,
                                right: media.width * 0.0,
                                bottom: media.height * 0.0),
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "12/19",
                                    style: TextStyle(
                                      color: UniversalVariables.white,
                                      fontSize: media.width * 0.05,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: null,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: new Padding(
                            padding: EdgeInsets.only(
                                left: media.width * 0.0,
                                top: media.height * 0.0,
                                right: media.width * 0.024,
                                bottom: media.height * 0.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    "next payment",
                                    style: TextStyle(
                                      color: UniversalVariables.white,
                                      fontSize: media.width * 0.025,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w300,
                                    ),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: new Padding(
                            padding: EdgeInsets.only(
                                left: media.width * 0.0,
                                top: media.height * 0.0,
                                right: media.width * 0.024,
                                bottom: media.height * 0.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    "01/20",
                                    style: TextStyle(
                                      color: UniversalVariables.white,
                                      fontSize: media.width * 0.05,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: null,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Login text 2
          Positioned(
            child: Container(
              padding: EdgeInsets.only(
                left: media.width * 0.04,
                top: media.height * 0.28,
                right: media.width * 0.04,
                bottom: media.width * 0.0,
              ),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Text(
                      "History:",
                      style: TextStyle(
                        color: UniversalVariables.green,
                        fontSize: media.width * 0.04,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            child: Container(
              padding: EdgeInsets.only(
                left: media.width * 0.0,
                top: media.height * 0.32,
                right: media.width * 0.0,
              ),
              child: GridView.count(
                crossAxisCount: 1,
                childAspectRatio: (itemWidth / itemHeight),
                padding: EdgeInsets.all(4.0),
                children: <Widget>[
                  ListView.builder(
                    padding: EdgeInsets.all(0.0),
                    itemCount: leaveRequest.length,
                    itemBuilder: (BuildContext context, int index) {
                      return makeDashboardItem(
                          leaveRequest[index]['date'],
                          // leaveRequest[index]['status'],
                          media);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Card makeDashboardItem(String date, Size media) {
    return Card(
        elevation: 1.0,
        margin: EdgeInsets.only(
            left: media.width * 0.02,
            top: media.height * 0.0075,
            right: media.width * 0.02,
            bottom: media.height * 0.0075),
        child: Container(
          height: media.height * 0.052,
          decoration: BoxDecoration(
            color: UniversalVariables.white,
            // border: Border.all(
            //   color: getColor(status),
            //   width: 1.25
            // ),
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
                    top: media.height * 0.0,
                    right: media.width * 0.02,
                    bottom: media.height * 0.0,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Expanded(
                        flex: 9,
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
                      // Expanded(
                      //   flex: 4,
                      //   child: Align(
                      //     alignment: Alignment.centerRight,
                      //     child: Text(
                      //       status,
                      //       style: TextStyle(
                      //         color: getColor(status),
                      //         fontSize: media.width * 0.04,
                      //         fontFamily: 'Poppins',
                      //         fontWeight: FontWeight.w400,
                      //       ),
                      //       textAlign: TextAlign.left,
                      //     ),
                      //   ),
                      // ),
                      Expanded(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Image.asset(
                            'assets/images/download.png',
                            width: media.width * 0.125,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  // getColor(status) {
  //   if (status == "pending") {
  //     return yellow;
  //   } else if (status == "approved") {
  //     return green;
  //   } else {
  //     return red;
  //   }
  // }

}
