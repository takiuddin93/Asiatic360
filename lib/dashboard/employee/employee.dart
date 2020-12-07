import 'dart:convert';

import 'package:Asiatic360/constants/strings.dart';
import 'package:Asiatic360/main.dart';
import 'package:Asiatic360/utils/mainappbar.dart';
import 'package:Asiatic360/utils/universal_variables.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Asiatic360/dashboard/employee/employeedetails.dart';

import 'package:http/http.dart' as http;

Map<String, dynamic> etaki;
bool fetched = false;
final String noImageAvailable =
    "https://www.esm.rochester.edu/uploads/NoPhotoAvailable.jpg";

class Employee extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Employee',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyEmployee(title: 'Employee'),
    );
  }
}

class MyEmployee extends StatefulWidget {
  MyEmployee({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyEmployeeState createState() => _MyEmployeeState();
}

class _MyEmployeeState extends State<MyEmployee> {
  @override
  void initState() {
    super.initState();
    fetchAllEmployees();
  }

  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;
    final double itemHeight = media.height;
    final double itemWidth = media.width;

    return Scaffold(
      appBar: PreferredSize(
        child: MainAppBar(title: widget.title, back: "employee"),
        preferredSize: Size.fromHeight(media.height),
      ),
      body: fetched == true
          ? Container(
              height: media.height,
              padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 2.0),
              child: GridView.count(
                crossAxisCount: 1,
                childAspectRatio: (itemWidth / itemHeight),
                padding: EdgeInsets.all(3.0),
                children: <Widget>[
                  ListView.builder(
                    padding: EdgeInsets.all(0.0),
                    itemCount: etaki["data"].length,
                    itemBuilder: (BuildContext context, int index) {
                      return makeDashboardItem(
                          noImageAvailable,
                          etaki["data"][index]['emp_firstname'].toString() +
                              " " +
                              etaki["data"][index]['emp_lastname'].toString(),
                          etaki["data"][index]['emp_designation'].toString(),
                          etaki["data"][index]['emp_phone'].toString(),
                          etaki["data"][index]['emp_email'].toString(),
                          media);
                    },
                  ),
                ],
              ),
            )
          : Center(
              child: CircularProgressIndicator(
                backgroundColor: UniversalVariables.darkgreen,
                valueColor:
                    new AlwaysStoppedAnimation<Color>(UniversalVariables.green),
              ),
            ),
    );
  }

  Card makeDashboardItem(String ePhoto, String eName, String eDesignation,
      String ePhone, String eMail, Size media) {
    return Card(
      elevation: 1.0,
      margin: EdgeInsets.only(
          left: media.width * 0.02,
          top: media.height * 0.005,
          right: media.width * 0.02,
          bottom: media.height * 0.005),
      child: Container(
        height: 91.665909091,
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
          onTap: () {
            Navigator.pop(context);
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => EmployeeDetails(
                    ePhoto: ePhoto,
                    eName: eName,
                    ePhone: ePhone,
                    eMail: eMail,
                    eDesignation: eDesignation)));
          },
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
                      flex: 2,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(3.0),
                            bottomLeft: Radius.circular(3.0),
                          ),
                          child: Image.network(
                            ePhoto,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
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
                                eName,
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
                                eDesignation,
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

  fetchAllEmployees() async {
    var allEmployeesResponse = await http.get(
        // Encode the url
        API_URL + "/api/users/except/" + prefs.getInt("id").toString());
    Map<String, dynamic> allEmployeesData =
        json.decode(allEmployeesResponse.body);
    print(allEmployeesData["response"].toString());
    if (allEmployeesData["response"].toString() == "1") {
      print(allEmployeesData["data"].toString());
      setState(() {
        etaki = allEmployeesData;
        fetched = true;
      });
    } else {
      setState(() {
        etaki = allEmployeesData;
        fetched = false;
      });
    }
  }
}
