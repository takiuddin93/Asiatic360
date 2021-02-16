import 'package:Asiatic360/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:Asiatic360/utils/universal_variables.dart';
import 'package:Asiatic360/utils/Asiatic360_app_icons_icons.dart';
import 'package:Asiatic360/widgets/custom_dialog_widget.dart';
import 'package:Asiatic360/utils/mainappbar_style.dart';

Color green = Color(0xFF6B8449);
Color darkgreen = Color(0xFF4C5B39);
Color black = Color(0xFF000000);
Color grey = Color(0xFF808184);
Color greyShadow = Color(0xFF33808184);
Color red = Color(0XFFFD3131);
Color white = Color(0xFFFFFFFF);

bool isSwitched = false;

class UserProfile extends StatelessWidget {
  final String ePhoto, eName, ePhone, eMail, eDesignation;
  UserProfile(
      {@required this.ePhoto,
      @required this.eName,
      @required this.ePhone,
      @required this.eMail,
      @required this.eDesignation});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Employee Details',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyUserProfile(
          title: 'Employee Details',
          ePhoto: ePhoto,
          eName: eName,
          ePhone: ePhone,
          eMail: eMail,
          eDesignation: eDesignation),
    );
  }
}

class MyUserProfile extends StatefulWidget {
  final String title;

  final String ePhoto, eName, ePhone, eMail, eDesignation;

  MyUserProfile(
      {Key key,
      this.title,
      this.ePhoto,
      this.eName,
      this.ePhone,
      this.eMail,
      this.eDesignation})
      : super(key: key);

  @override
  _MyUserProfileState createState() => _MyUserProfileState(
      this.ePhoto, this.eName, this.ePhone, this.eMail, this.eDesignation);
}

class _MyUserProfileState extends State<MyUserProfile> {
  String ePhoto, eName, ePhone, eMail, eDesignation;
  _MyUserProfileState(
      this.ePhoto, this.eName, this.ePhone, this.eMail, this.eDesignation);

  @override
  Widget build(BuildContext context) {
    String title, back;
    Size media = MediaQuery.of(context).size;
    // final double itemHeight = media.height;
    // final double itemWidth = media.width;

    Builder _buildleading(BuildContext context) {
      IconData _iconData;
      switch (back.toString()) {
        case "userprofile":
          {
            _iconData = Icons.arrow_back;
          }
          break;
        default:
          {
            Navigator.pop(context);
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => Dashboard()));
          }
          break;
      }
      return Builder(
        builder: (context) => IconButton(
          color: UniversalVariables.green,
          icon: new Icon(
            _iconData,
            color: UniversalVariables.green,
          ),
          onPressed: () {
            Navigator.pop(context);
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => Dashboard()));
          },
        ),
      );
    }

    Align _buildLabel(BuildContext context) {
      return Align(
        alignment: Alignment.center,
        child: RichText(
          text: TextSpan(
            style: new TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              fontSize: 24.0,
              color: UniversalVariables.green,
            ),
            children: [
              TextSpan(
                text: title,
              ),
            ],
          ),
        ),
      );
    }

    Builder _buildaction(BuildContext context) {
      String _alertdialogTitle, _alertdialogDescription, _alertdialogButton;
      if (back == 'dashboard') {
        _alertdialogTitle = 'Work in Progress';
        _alertdialogDescription = 'This feature has not been implemented yet!';
        _alertdialogButton = 'Back';
      } else {
        _alertdialogTitle = 'Work in Progress';
        _alertdialogDescription = 'This feature has not been implemented yet!';
        _alertdialogButton = 'Back';
      }
      return Builder(
        builder: (context) => IconButton(
          color: UniversalVariables.green,
          icon: new Icon(Asiatic360AppIcons.notification),
          onPressed: () {
            CustomDialog.showScaleAlertBox(
                context: context,
                title: _alertdialogTitle,
                icon: Icons.info_outline, // IF YOU WANT TO ADD ICON
                color: UniversalVariables.primaryCrimson,
                text: _alertdialogDescription, // IF YOU WANT TO ADD
                firstButton: '',
                secondButton: _alertdialogButton);
          },
        ),
      );
    }

    return Scaffold(
      appBar: PreferredSize(
        child: Container(
          height: appBarHeight(context),
          color: UniversalVariables.white,
          child: Padding(
            padding: EdgeInsets.all(0.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: _buildleading(context),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: _buildLabel(context),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: _buildaction(context),
                  ),
                ),
              ],
            ),
          ),
        ),
        // child: MainAppBar(title: widget.title, back: "userprofile"),
        preferredSize: Size.fromHeight(media.height),
      ),
      body: Container(
        height: media.height,
        child: Stack(
          // padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 2.0),
          children: <Widget>[
            // Positioned(
            //   width: media.width,
            //   height: media.height,
            //   child: ClipPath(
            //     clipper: EmployeeTopCurveClipper(),
            //     child: Container(
            //       height: media.height,
            //       width: media.width,
            //       decoration: BoxDecoration(
            //         color: green,
            //       ),
            //     ),
            //   ),
            // ),
            // Dashboard
            Positioned(
              width: media.width,
              child: Container(
                height: media.height * 0.4,
                // padding: EdgeInsets.only(
                //   left: media.width * 0.04,
                //   top: media.height * 0.02,
                //   right: media.width * 0.0,
                //   bottom: media.width * 0.0,
                // ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(this.ePhoto),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: greyShadow,
                      blurRadius: 4.8,
                      spreadRadius: 3.0,
                      offset: Offset(0.0, 2.0),
                    )
                  ],
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(64.0),
                      bottomRight: Radius.circular(64.0)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: new Padding(
                        padding: EdgeInsets.only(
                            left: media.width * 0.024,
                            top: media.height * 0.3,
                            right: media.width * 0.0,
                            bottom: media.height * 0.01),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                "${this.eName}",
                                style: TextStyle(
                                  color: white,
                                  fontSize: media.width * 0.055,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                "${this.eDesignation}",
                                style: TextStyle(
                                  color: white,
                                  fontSize: media.width * 0.035,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w800,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: media.height * 0.41,
              width: media.width,
              height: media.height,
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (BuildContext context, int index) {
                  return Slidable(
                    key: ValueKey(index),
                    actionPane: SlidableDrawerActionPane(),
                    actions: <Widget>[
                      IconSlideAction(
                          color: green,
                          icon: Icons.call,
                          onTap: () => _call(ePhone)),
                    ],
                    secondaryActions: <Widget>[
                      IconSlideAction(
                          color: UniversalVariables.yellow,
                          icon: Icons.mail,
                          onTap: () => _message(ePhone)),
                    ],
                    dismissal: SlidableDismissal(
                      child: SlidableDrawerDismissal(),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: media.width * 0.04,
                          top: media.height * 0.0,
                          right: media.width * 0.04,
                          bottom: media.height * 0.0),
                      child: Card(
                        elevation: 1.0,
                        margin: EdgeInsets.only(
                            left: media.width * 0.02,
                            top: media.height * 0.005,
                            right: media.width * 0.02,
                            bottom: media.height * 0.005),
                        child: Container(
                          height: 48,
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(4.0),
                            boxShadow: [
                              BoxShadow(
                                color: greyShadow,
                                blurRadius: 2.0,
                                spreadRadius: 0.48,
                                offset: Offset(0.0, 4.2),
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
                                    left: 8,
                                    top: 8,
                                    right: 8,
                                    bottom: 8,
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Expanded(
                                        flex: 10,
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
                                                  ePhone,
                                                  style: TextStyle(
                                                    color: black,
                                                    fontSize:
                                                        media.width * 0.045,
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
                      ),
                    ),
                  );
                },
              ),
            ),
            Positioned(
              top: media.height * 0.50,
              width: media.width,
              height: 53.8344,
              child: Padding(
                padding: EdgeInsets.only(
                    left: media.width * 0.04,
                    top: media.height * 0.0,
                    right: media.width * 0.04,
                    bottom: media.height * 0.0),
                child: Card(
                  elevation: 1.0,
                  margin: EdgeInsets.only(
                      left: media.width * 0.02,
                      top: media.height * 0.005,
                      right: media.width * 0.02,
                      bottom: media.height * 0.005),
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(4.0),
                      boxShadow: [
                        BoxShadow(
                          color: greyShadow,
                          blurRadius: 2.0,
                          spreadRadius: 0.48,
                          offset: Offset(0.0, 4.2),
                        )
                      ],
                    ),
                    child: new InkWell(
                      onTap: () => _mail(eMail),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        verticalDirection: VerticalDirection.down,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(
                              left: 8,
                              top: 8,
                              right: 8,
                              bottom: 8,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  flex: 10,
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
                                            eMail,
                                            style: TextStyle(
                                              color: black,
                                              fontSize: media.width * 0.045,
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
                ),
              ),
            ),
            Positioned(
              top: media.height * 0.59,
              width: media.width,
              height: 53.8344,
              child: Padding(
                padding: EdgeInsets.only(
                    left: media.width * 0.04,
                    top: media.height * 0.0,
                    right: media.width * 0.04,
                    bottom: media.height * 0.0),
                child: Card(
                  elevation: 1.0,
                  margin: EdgeInsets.only(
                      left: media.width * 0.02,
                      top: media.height * 0.005,
                      right: media.width * 0.02,
                      bottom: media.height * 0.005),
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(4.0),
                      boxShadow: [
                        BoxShadow(
                          color: greyShadow,
                          blurRadius: 2.0,
                          spreadRadius: 0.48,
                          offset: Offset(0.0, 4.2),
                        )
                      ],
                    ),
                    child: new InkWell(
                      onTap: () => _mail(eMail),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        verticalDirection: VerticalDirection.down,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(
                              left: 8,
                              top: 8,
                              right: 8,
                              bottom: 8,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  flex: 10,
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
                                            "O+",
                                            style: TextStyle(
                                              color: black,
                                              fontSize: media.width * 0.045,
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
                                // Expanded(
                                //   flex: 10,
                                //   child: new Padding(
                                //     padding: EdgeInsets.only(
                                //         left: media.width * 0.0,
                                //         top: media.height * 0.0,
                                //         right: media.width * 0.04,
                                //         bottom: media.height * 0.0),
                                //     child: Column(
                                //       mainAxisAlignment:
                                //           MainAxisAlignment.center,
                                //       crossAxisAlignment:
                                //           CrossAxisAlignment.center,
                                //       children: [
                                //         Align(
                                //           alignment: Alignment.centerRight,
                                //           child: Switch(
                                //             value: isSwitched,
                                //             onChanged: (value) {
                                //               setState(() {
                                //                 isSwitched = value;
                                //                 print(isSwitched);
                                //               });
                                //             },
                                //             activeTrackColor:
                                //                 Colors.lightGreenAccent,
                                //             activeColor: Colors.green,
                                //           ),
                                //         ),
                                //       ],
                                //     ),
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _call(String ePhone) async {
    if (await canLaunch('tel:$ePhone')) {
      await launch('tel:$ePhone');
    } else {
      throw 'Could not Call {$ePhone}';
    }
  }

  _message(String ePhone) async {
    if (await canLaunch('sms:$ePhone')) {
      await launch('sms:$ePhone');
    } else {
      throw 'Could not Message the Number';
    }
  }

  _mail(String eMail) async {
    if (await canLaunch('mailto:$eMail')) {
      await launch('mailto:$eMail');
    } else {
      throw 'Could not Mail the E-mail Address';
    }
  }
}
