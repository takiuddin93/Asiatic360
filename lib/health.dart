import 'package:asiatic360/utils/mainappbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:asiatic360/medicalallowance.dart';
import 'package:asiatic360/blooddonation.dart';

Color black = Color(0xFF000000);
Color white = Color(0xFFFFFFFF);
Color green = Color(0xFF6B8449);
Color darkgreen = Color(0xFF4C5B39);

void main() {
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(Health());
}

class Health extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Health',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHealth(title: 'Health'),
    );
  }
}

class MyHealth extends StatefulWidget {
  MyHealth({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHealthState createState() => _MyHealthState();
}

class _MyHealthState extends State<MyHealth> {

  @override
  Widget build(BuildContext context) {
    
    Size media = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        child: MainAppBar(title: widget.title, back: "health"),
        preferredSize: Size.fromHeight(media.height),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 2.0),
        child: GridView.count(
          crossAxisCount: 3,
          padding: EdgeInsets.all(3.0),
          children: <Widget>[
            makeDashboardItem(1, "Medical Allowance", Icons.book, media),
            makeDashboardItem(2, "Blood Donation", Icons.book, media),
            makeDashboardItem(3, "BMI", Icons.book, media),
          ],
        ),
      ),
    );
  }

  Card makeDashboardItem(int i, String title, IconData icon, Size media) {
    return Card(
      elevation: 1.0,
      margin: EdgeInsets.only(
        left: media.width * 0.02,
        top: media.height * 0.01,
        right: media.width * 0.02,
        bottom: media.width * 0.01
      ),
      child: Container(
        decoration: BoxDecoration(color: white),
        child: new InkWell(
          onTap: () {
            switch(i.toString()) {
              case "1": {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => MedicalAllowance())
                );
              } 
              break;
              case "2": {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => BloodDonation())
                );
              }
              break;
              case "3": {
                showDialog<void>(
                  context: context,
                  barrierDismissible: false, // user must tap button!
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Work in Progress'),
                      content: SingleChildScrollView(
                        child: ListBody(
                          children: <Widget>[
                            Text('This feature has not been implemented yet!'),
                          ],
                        ),
                      ),
                      actions: <Widget>[
                        FlatButton(
                          child: Text('Back'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              } 
              break;
              default: {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Health())
                );
              } 
              break; 
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            verticalDirection: VerticalDirection.down,
            children: <Widget>[
              SizedBox(height: media.height * 0.025),
              Icon(
                icon,
                size: 32.0,
                color: green,
              ),
              Text(
                title,
                style: TextStyle(
                    color: black,
                    fontSize: media.width * 0.04,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                textAlign: TextAlign.center
              ),
            ],
          ),
        ),
      ),
    );
  }
}
