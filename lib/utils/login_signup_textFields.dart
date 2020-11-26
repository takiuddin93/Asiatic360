import 'package:Asiatic360/utils/universal_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String text;
  final TextEditingController fieldController;
  final bool validate, obscureText, fingerprint;
  final Size media;
  final BuildContext context;

  CustomTextField(
      {Key key,
      this.text,
      this.fieldController,
      this.validate,
      this.obscureText,
      this.fingerprint,
      this.context,
      this.media})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _keyboartType;
    Widget _prefixiconData, _suffixiconData;
    if (obscureText == false && fingerprint == false) {
      _keyboartType = TextInputType.number;
      _prefixiconData = Icon(
        Icons.account_circle,
        color: UniversalVariables.green,
      );
      _suffixiconData = Icon(
        Icons.account_circle,
        color: Colors.transparent,
      );
    } else if (obscureText == true && fingerprint == true) {
      _keyboartType = TextInputType.text;
      _prefixiconData = Icon(
        Icons.lock,
        color: UniversalVariables.green,
      );
      _suffixiconData = Icon(
        Icons.fingerprint,
        color: UniversalVariables.green,
      );
    } else {
      _keyboartType = TextInputType.text;
      _prefixiconData = Icon(
        Icons.lock,
        color: UniversalVariables.green,
      );
      _suffixiconData = Icon(
        Icons.remove_red_eye,
        color: UniversalVariables.grey,
      );
    }
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFFF),
        borderRadius: BorderRadius.circular(4.0),
        boxShadow: [
          BoxShadow(
            color: UniversalVariables.greyShadow,
            blurRadius: 4.0,
            spreadRadius: 4.0,
            offset: Offset(0.0, 2.0),
          ),
        ],
      ),
      child: Center(
        child: Column(
          children: [
            TextFormField(
              autovalidate: validate,
              controller: fieldController,
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: EdgeInsets.all(0.0),
                  child: _prefixiconData,
                ),
                labelText: text,
                labelStyle: TextStyle(
                  color: UniversalVariables.green,
                ),
                hintText: text,
                suffixIcon: Builder(
                  builder: (BuildContext context) {
                    if (fingerprint == true) {
                      return Padding(
                        padding: EdgeInsets.all(0.0),
                        child: IconButton(
                          icon: _suffixiconData,
                          onPressed: () {
                            FocusScope.of(context).unfocus();
                            print("fingerprint");
                          },
                        ),
                      );
                    } else {
                      return Padding(
                        padding: EdgeInsets.all(0.0),
                        child: IconButton(
                          icon: _suffixiconData,
                          onPressed: () {
                            print("no fingerprint");
                          },
                        ),
                      );
                    }
                  },
                ),
                fillColor: Colors.transparent,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(3.0)),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(3.0)),
                  borderSide: BorderSide(color: UniversalVariables.green),
                ),
              ),
              obscureText: obscureText,
              keyboardType: _keyboartType,
              style: TextStyle(
                fontFamily: "Poppins",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
