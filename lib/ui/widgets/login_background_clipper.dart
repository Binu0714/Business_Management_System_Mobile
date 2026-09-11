import 'package:flutter/material.dart';

class LoginBackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.moveTo(0, size.height * 0.55);

    double controlX = size.width / 2;
    double controlY = size.height * 0.60;

    double endX = size.width;
    double endY = size.height * 0.40;

    path.quadraticBezierTo(controlX, controlY, endX, endY);

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;

  }
}