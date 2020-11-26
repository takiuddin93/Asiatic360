import 'package:Asiatic360/utils/mainappbar.dart';
import 'package:Asiatic360/utils/universal_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(NewLeaveRequest());
}

class NewLeaveRequest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'New Leave Request',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyNewLeaveRequest(title: 'New Leave Request'),
    );
  }
}

class MyNewLeaveRequest extends StatefulWidget {
  MyNewLeaveRequest({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyNewLeaveRequestState createState() => _MyNewLeaveRequestState();
}

class _MyNewLeaveRequestState extends State<MyNewLeaveRequest> {
  DateTime dateFrom, dateTo;

  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        child: MainAppBar(title: widget.title, back: "newleaverequest"),
        preferredSize: Size.fromHeight(media.height),
      ),
      body: Container(
        height: media.height,
        width: media.width,
        child: Stack(
          children: <Widget>[
            // Date
            Positioned(
              width: media.width,
              child: Center(
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(
                        top: media.height * 0.04,
                        left: media.width * 0.04,
                        right: media.width * 0.04,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Expanded(
                            flex: 4,
                            child: Column(
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "From:",
                                    style: TextStyle(
                                      color: UniversalVariables.green,
                                      fontSize: media.width * 0.05,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                      decorationColor: UniversalVariables.green,
                                      decorationThickness: 2.0,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                SizedBox(
                                  height: media.height * 0.0016,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFFFFFFF),
                                    borderRadius: BorderRadius.circular(2.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: UniversalVariables.greyShadow,
                                        blurRadius: 4.0,
                                        spreadRadius: 4.0,
                                        offset: Offset(0.0, 2.0),
                                      )
                                    ],
                                  ),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      // labelText: "From",
                                      // labelStyle: TextStyle(
                                      //   color: green,
                                      // ),
                                      hintText: dateFrom.toString(),
                                      fillColor: Colors.transparent,
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(2.0)),
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(2.0)),
                                        borderSide: BorderSide(
                                            color: UniversalVariables.green),
                                      ),
                                    ),
                                    obscureText: false,
                                    keyboardType: TextInputType.datetime,
                                    style: TextStyle(
                                      fontFamily: "Poppins",
                                    ),
                                    onTap: () async {
                                      final datePicker = await showDatePicker(
                                          context: context,
                                          firstDate: new DateTime.now(),
                                          initialDate: new DateTime.now(),
                                          lastDate: new DateTime(2025));
                                      if (datePicker != null) {
                                        setState(() {
                                          dateFrom = datePicker;
                                        });
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(),
                          ),
                          Expanded(
                            flex: 4,
                            child: Column(
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "To:",
                                    style: TextStyle(
                                      color: UniversalVariables.green,
                                      fontSize: media.width * 0.05,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                      decorationColor: UniversalVariables.green,
                                      decorationThickness: 2.0,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                SizedBox(
                                  height: media.height * 0.0016,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFFFFFFF),
                                    borderRadius: BorderRadius.circular(2.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: UniversalVariables.greyShadow,
                                        blurRadius: 4.0,
                                        spreadRadius: 4.0,
                                        offset: Offset(0.0, 2.0),
                                      )
                                    ],
                                  ),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      // labelText: "To",
                                      // labelStyle: TextStyle(
                                      //   color: green,
                                      // ),
                                      hintText: dateTo.toString(),
                                      fillColor: Colors.transparent,
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(2.0)),
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(2.0)),
                                        borderSide: BorderSide(
                                            color: UniversalVariables.green),
                                      ),
                                    ),
                                    obscureText: false,
                                    keyboardType: TextInputType.datetime,
                                    style: TextStyle(
                                      fontFamily: "Poppins",
                                    ),
                                    onTap: () async {
                                      final datePicker = await showDatePicker(
                                          context: context,
                                          firstDate: new DateTime.now(),
                                          initialDate: new DateTime.now(),
                                          lastDate: new DateTime(2025));
                                      if (datePicker != null) {
                                        setState(() {
                                          dateTo = datePicker;
                                        });
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Purpose
            Positioned(
              width: media.width,
              child: Container(
                padding: EdgeInsets.only(
                  top: media.height * 0.20,
                  left: media.width * 0.04,
                  right: media.width * 0.04,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFFFFF),
                    borderRadius: BorderRadius.circular(2.0),
                    boxShadow: [
                      BoxShadow(
                        color: UniversalVariables.greyShadow,
                        blurRadius: 4.0,
                        spreadRadius: 4.0,
                        offset: Offset(0.0, 2.0),
                      )
                    ],
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "Purpose",
                            labelStyle: TextStyle(
                              color: UniversalVariables.green,
                            ),
                            hintText: "Purpose",
                            fillColor: Colors.transparent,
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(2.0)),
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(2.0)),
                              borderSide:
                                  BorderSide(color: UniversalVariables.green),
                            ),
                          ),
                          textAlignVertical: TextAlignVertical.top,
                          textAlign: TextAlign.start,
                          keyboardType: TextInputType.number,
                          style: TextStyle(
                            fontFamily: "Poppins",
                          ),
                          minLines: 4,
                          maxLines: 6,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // Submit Button
            Positioned(
              top: media.height * 0.48,
              left: media.width * 0.75,
              right: media.width * 0.05,
              child: GestureDetector(
                  child: Container(
                    padding: EdgeInsets.only(
                        top: media.height * 0.0,
                        left: media.width * 0.0,
                        bottom: 0.0,
                        right: media.width * 0.0),
                    height: media.height * 0.05,
                    width: media.width,
                    decoration: BoxDecoration(
                      color: UniversalVariables.green,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Submit",
                          style: TextStyle(
                            color: UniversalVariables.white,
                            fontSize: media.width * 0.037,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {}),
            ),
          ],
        ),
      ),
    );
  }
}
