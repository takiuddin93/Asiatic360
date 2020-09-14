import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:asiatic360/utils/mainappbar.dart';

Color black = Color(0xFF000000);
Color white = Color(0xFFFFFFFF);
Color green = Color(0xFF6B8449);
Color darkgreen = Color(0xFF4C5B39);

void main() {
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(Security());
}

class Security extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Security',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MySecurity(title: 'Security'),
    );
  }
}

class MySecurity extends StatefulWidget {
  MySecurity({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MySecurityState createState() => _MySecurityState();
}

class _MySecurityState extends State<MySecurity> {

  @override
  Widget build(BuildContext context) {
    
    Size media = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        child: MainAppBar(title: widget.title, back: "security"),
        preferredSize: Size.fromHeight(media.height),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 2.0),
        child: GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.all(3.0),
          children: <Widget>[
            makeDashboardItem("Health Pay", Icons.book, media),
            makeDashboardItem("Blood Donation Request", Icons.alarm, media)
          ],
        ),
      ),
    );
  }

Card makeDashboardItem(String title, IconData icon, Size media) {
    return Card(
      elevation: 1.0,
      margin: EdgeInsets.only(
        left: media.width * 0.02,
        top: media.height * 0.01,
        right: media.width * 0.02,
        bottom: media.width * 0.01
      ),
      child: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(220, 220, 220, 1.0)),
        child: new InkWell(
          onTap: () {},
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            verticalDirection: VerticalDirection.down,
            children: <Widget>[
              SizedBox(height: 50.0),
              Center(
                  child: Icon(
                icon,
                size: 40.0,
                color: Colors.black,
              )),
              SizedBox(height: 20.0),
              new Center(
                child: new Text(title,
                  style: new TextStyle(fontSize: 18.0, color: Colors.black)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
