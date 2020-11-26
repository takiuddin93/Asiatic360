import 'package:Asiatic360/utils/mainappbar.dart';
import 'package:Asiatic360/utils/universal_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(BloodDonation());
}

class BloodDonation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blood Donation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyBloodDonation(title: 'Blood Donation'),
    );
  }
}

class MyBloodDonation extends StatefulWidget {
  MyBloodDonation({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyBloodDonationState createState() => _MyBloodDonationState();
}

class TypeDropdown {
  int id;
  String name;

  TypeDropdown(this.id, this.name);

  static List<TypeDropdown> getBloodGroups() {
    return <TypeDropdown>[
      TypeDropdown(1, '-'),
      TypeDropdown(2, 'A+'),
      TypeDropdown(3, 'A-'),
      TypeDropdown(4, 'B+'),
      TypeDropdown(5, 'B-'),
      TypeDropdown(2, 'O+'),
      TypeDropdown(3, 'O-'),
      TypeDropdown(4, 'AB+'),
      TypeDropdown(5, 'AB-'),
    ];
  }
}

class _MyBloodDonationState extends State<MyBloodDonation> {
  DateTime dateFrom, dateTo;
  List<TypeDropdown> _bloodGroups = TypeDropdown.getBloodGroups();
  List<DropdownMenuItem<TypeDropdown>> _dropdownMenuItems;
  TypeDropdown _selectedGroup;
  bool urgentSelected = false;

  @override
  void initState() {
    _dropdownMenuItems = buildDropdownMenuItems(_bloodGroups);
    _selectedGroup = _dropdownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<TypeDropdown>> buildDropdownMenuItems(
      List bloodGroups) {
    List<DropdownMenuItem<TypeDropdown>> items = List();
    for (TypeDropdown group in bloodGroups) {
      items.add(
        DropdownMenuItem(
          value: group,
          child: Text(group.name),
        ),
      );
    }
    return items;
  }

  onChangeDropdownItem(TypeDropdown selectedGroup) {
    setState(() {
      _selectedGroup = selectedGroup;
    });
  }

  void _urgentSelected(bool selected) => setState(() {
        urgentSelected = selected;

        if (urgentSelected) {
          // TODO: Here goes your functionality that remembers the user.
        } else {
          // TODO: Forget the user
        }
      });

  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;
    // final double itemHeight = media.height;
    // final double itemWidth = media.width;

    return Scaffold(
      appBar: PreferredSize(
        child: MainAppBar(title: widget.title, back: "blooddonation"),
        preferredSize: Size.fromHeight(media.height),
      ),
      body: Container(
        height: media.height,
        width: media.width,
        child: Stack(
          children: <Widget>[
            // Type DropDown
            Positioned(
              width: media.width,
              child: Center(
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(
                          left: media.width * 0.04,
                          top: media.height * 0.04,
                          right: media.width * 0.04,
                          bottom: media.height * 0.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 10,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Type:",
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
                                  padding: EdgeInsets.only(
                                      left: media.width * 0.04,
                                      top: media.height * 0.0,
                                      right: media.width * 0.04,
                                      bottom: media.height * 0.0),
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
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                      value: _selectedGroup,
                                      items: _dropdownMenuItems,
                                      onChanged: onChangeDropdownItem,
                                    ),
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
            // Date
            Positioned(
              width: media.width,
              child: Center(
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(
                        top: media.height * 0.16,
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
                                    "On:",
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
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Checkbox(
                                        value: urgentSelected,
                                        onChanged: (selected) {
                                          _urgentSelected(selected);
                                        },
                                        activeColor: UniversalVariables.green,
                                        checkColor: UniversalVariables.white,
                                        tristate: false,
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Urgent",
                                        style: TextStyle(
                                          color: UniversalVariables.green,
                                          fontSize: media.width * 0.05,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w400,
                                          decorationColor:
                                              UniversalVariables.green,
                                          decorationThickness: 2.0,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ],
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
                  top: media.height * 0.32,
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
              top: media.height * 0.52,
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
