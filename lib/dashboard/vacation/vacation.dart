import 'package:Asiatic360/utils/mainappbar.dart';
import 'package:Asiatic360/utils/universal_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Asiatic360/dashboard/vacation/leaverequest.dart';

class Vacation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vacation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyVacation(title: 'Vacation'),
    );
  }
}

class MyVacation extends StatefulWidget {
  MyVacation({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyVacationState createState() => _MyVacationState();
}

class _MyVacationState extends State<MyVacation> {
  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        child: MainAppBar(title: widget.title, back: "vacation"),
        preferredSize: Size.fromHeight(media.height),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 2.0),
        child: GridView.count(
          crossAxisCount: 3,
          padding: EdgeInsets.all(3.0),
          children: <Widget>[
            makeDashboardItem(1, "Leave Request", Icons.book, media),
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
            bottom: media.width * 0.01),
        child: Container(
          decoration: BoxDecoration(color: UniversalVariables.white),
          child: new InkWell(
            onTap: () {
              switch (i.toString()) {
                case "1":
                  {
                    Navigator.pop(context);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => LeaveRequest()));
                  }
                  break;
                default:
                  {
                    Navigator.pop(context);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => Vacation()));
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
                  color: UniversalVariables.green,
                ),
                Text(title,
                    style: TextStyle(
                      color: UniversalVariables.black,
                      fontSize: media.width * 0.04,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center),
              ],
            ),
          ),
        ));
  }
}
