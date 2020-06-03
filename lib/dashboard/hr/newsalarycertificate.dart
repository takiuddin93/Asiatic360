import 'package:asiatic360/utils/mainappbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  runApp(NewSalaryCertificate());
}

class NewSalaryCertificate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'New Salary Certificate',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyNewSalaryCertificate(title: 'New Salary Certificate'),
    );
  }
}

class MyNewSalaryCertificate extends StatefulWidget {
  MyNewSalaryCertificate({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyNewSalaryCertificateState createState() => _MyNewSalaryCertificateState();
}

class PurposeDropdown {
  int id;
  String name;

  PurposeDropdown(this.id, this.name);

  static List<PurposeDropdown> getCompanies() {
    return <PurposeDropdown>[
      PurposeDropdown(1, '-'),
      PurposeDropdown(2, 'Visa'),
      PurposeDropdown(3, 'Credit Card'),
      PurposeDropdown(4, 'Loan'),
      PurposeDropdown(5, 'Others'),
    ];
  }
}

class _MyNewSalaryCertificateState extends State<MyNewSalaryCertificate> {
  DateTime dateFrom, dateTo;
  List<PurposeDropdown> _companies = PurposeDropdown.getCompanies();
  List<DropdownMenuItem<PurposeDropdown>> _dropdownMenuItems;
  PurposeDropdown _selectedCompany;

  @override
  void initState() {
    _dropdownMenuItems = buildDropdownMenuItems(_companies);
    _selectedCompany = _dropdownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<PurposeDropdown>> buildDropdownMenuItems(
      List companies) {
    List<DropdownMenuItem<PurposeDropdown>> items = List();
    for (PurposeDropdown company in companies) {
      items.add(
        DropdownMenuItem(
          value: company,
          child: Text(company.name),
        ),
      );
    }
    return items;
  }

  onChangeDropdownItem(PurposeDropdown selectedCompany) {
    setState(() {
      _selectedCompany = selectedCompany;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;
    // final double itemHeight = media.height;
    // final double itemWidth = media.width;

    return Scaffold(
      appBar: PreferredSize(
        child: MainAppBar(title: widget.title, back: "newsalarycertificate"),
        preferredSize: Size.fromHeight(media.height),
      ),
      body: Container(
        height: media.height,
        width: media.width,
        child: Stack(
          children: <Widget>[
            // Purpose DropDown
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
                                    "Purpose:",
                                    style: TextStyle(
                                      color: green,
                                      fontSize: media.width * 0.05,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                      decorationColor: green,
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
                                        color: greyShadow,
                                        blurRadius: 4.0,
                                        spreadRadius: 4.0,
                                        offset: Offset(0.0, 2.0),
                                      )
                                    ],
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                      value: _selectedCompany,
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
            // Purpose
            Positioned(
              width: media.width,
              child: Container(
                padding: EdgeInsets.only(
                  top: media.height * 0.16,
                  left: media.width * 0.04,
                  right: media.width * 0.04,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFFFFF),
                    borderRadius: BorderRadius.circular(2.0),
                    boxShadow: [
                      BoxShadow(
                        color: greyShadow,
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
                              color: green,
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
                              borderSide: BorderSide(color: green),
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
              top: media.height * 0.36,
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
                      color: green,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Submit",
                          style: TextStyle(
                            color: white,
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
