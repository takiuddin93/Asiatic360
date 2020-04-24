import 'package:asiatic360/utils/mainappbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:asiatic360/employeedetails.dart';

Color green = Color(0xFF6B8449);
Color darkgreen = Color(0xFF4C5B39);
Color black = Color(0xFF000000);
Color grey = Color(0xFF808184);
Color greyShadow = Color(0xFF33808184);
Color red = Color(0XFFFD3131);
Color white = Color(0xFFFFFFFF);

void main() {
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(Employee());
}

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

  List employees = [
    {"ePhoto": "assets/images/Neville-Ferdous-Hasan.jpg", "eName": "Nevile Ferdous Hasan", "ePhone": "", "eMail": "", "eBloodGroup" : "", "eDesignation": "Managing Director"},
    {"ePhoto": "assets/images/Aditya-Kabir.jpg", "eName": "Aditya Kabir", "ePhone": "", "eMail": "", "eBloodGroup" : "", "eDesignation": "AVP, Strategic Planning"},
    {"ePhoto": "assets/images/Salek-Shahriar.jpg", "eName": "Salek Shahriar", "ePhone": "", "eMail": "", "eBloodGroup" : "", "eDesignation": "Director"},
    {"ePhoto": "assets/images/profile-placeholder.png", "eName": "Shahriar M. Hassan", "ePhone": "", "eMail": "", "eBloodGroup" : "", "eDesignation": "Consultant"},
    {"ePhoto": "assets/images/profile-placeholder.png", "eName": "Md. Tanzib Hossain", "ePhone": "01717883717", "eMail": "tanzib.hossain@asiaticjwt.com", "eBloodGroup" : "", "eDesignation": "UI/UX Developer"},
    {"ePhoto": "assets/images/profile-placeholder.png", "eName": "Razib Biswas Tirtha", "ePhone": "01723432693", "eMail": "razib.biswas@asiaticjwt.com", "eBloodGroup" : "", "eDesignation": "UI/UX Developer"},
    {"ePhoto": "assets/images/profile-placeholder.png", "eName": "Taki Uddin", "ePhone": "01749607995", "eMail": "taki.uddin@asiaticjwt.com", "eBloodGroup" : "", "eDesignation": "App Devoloper"},
    {"ePhoto": "assets/images/profile-placeholder.png", "eName": "Akash Hasan", "ePhone": "", "eMail": "", "eBloodGroup" : "", "eDesignation": "Digital Research and Analytics Supervisor"},
    {"ePhoto": "assets/images/profile-placeholder.png", "eName": "Refat Mahmud", "ePhone": "", "eMail": "", "eBloodGroup" : "", "eDesignation": "Senior Data Analyst"},
    {"ePhoto": "assets/images/profile-placeholder.png", "eName": "Farah Diba", "ePhone": "", "eMail": "", "eBloodGroup" : "", "eDesignation": "Managing Director"}
  ];

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
      body: Container(
        height: media.height,
        padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 2.0),
        child: GridView.count(
          crossAxisCount: 1,
          childAspectRatio: (itemWidth / itemHeight),
          padding: EdgeInsets.all(3.0),
          children: <Widget>[
            ListView.builder(
              padding: EdgeInsets.all(0.0),
              itemCount: employees.length,
              itemBuilder: (BuildContext context, int index){
                return makeDashboardItem(
                  employees[index]["ePhoto"],
                  employees[index]["eName"],
                  employees[index]["ePhone"],
                  employees[index]["eMail"],
                  employees[index]["eDesignation"],
                  media
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Card makeDashboardItem(String ePhoto, String eName, String ePhone, String eMail, String eDesignation, Size media) {

    return Card(
      elevation: 1.0,
      margin: EdgeInsets.only(
        left: media.width * 0.02,
        top: media.height * 0.005,
        right: media.width * 0.02,
        bottom: media.height * 0.005
      ),
      child: Container(
        height: 77.3485715,
        decoration: BoxDecoration(
          color: white,
          border: Border.all(
            color: green,
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
          onTap: () {
            Navigator.pop(context);
            Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => EmployeeDetails(ePhoto: ePhoto, eName: eName, ePhone: ePhone, eMail: eMail, eDesignation: eDesignation))
            );
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
                          child:Image.asset(
                            ePhoto,
                            width: 128.0,
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
                          bottom: media.height * 0.0
                        ),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                eName,
                                style: TextStyle(
                                  color: black,
                                  fontSize: media.width * 0.05,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            SizedBox(height: media.height * 0.0016,),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                eDesignation,
                                style: TextStyle(
                                  color: black,
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
}
