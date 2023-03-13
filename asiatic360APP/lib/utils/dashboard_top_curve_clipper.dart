import 'package:flutter/material.dart';

class DashboardTopCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.moveTo(size.width * 0, size.height * 0.115);
    path.quadraticBezierTo(size.width * 0.001, size.height * 0.12, size.width * 0.025, size.height * 0.12);
    path.lineTo(size.width * 0.975, size.height * 0.12);
    path.quadraticBezierTo(size.width * 0.999, size.height * 0.12, size.width, size.height * 0.115);
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
