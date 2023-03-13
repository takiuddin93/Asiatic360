import 'package:flutter/material.dart';

class EmployeeTopCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.moveTo(size.width * 0, size.height * 0.175);
    path.quadraticBezierTo(size.width * 0.001, size.height * 0.18, size.width * 0.025, size.height * 0.18);
    path.lineTo(size.width * 0.975, size.height * 0.18);
    path.quadraticBezierTo(size.width * 0.999, size.height * 0.18, size.width, size.height * 0.175);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
