import 'package:flutter/material.dart';

class CurvedEdges extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);

    final leftCurvePoint1 = Offset(0, size.height - 20);
    final leftCurvePoint2 = Offset(30, size.height - 20);
    path.quadraticBezierTo(leftCurvePoint1.dx, leftCurvePoint1.dy,
        leftCurvePoint2.dx, leftCurvePoint2.dy);

    final middleLinePoint1 = Offset(0, size.height - 20);
    final middleLinePoint2 = Offset(size.width - 30, size.height - 20);
    path.quadraticBezierTo(middleLinePoint1.dx, middleLinePoint1.dy,
        middleLinePoint2.dx, middleLinePoint2.dy);

    final rightCurvePoint1 = Offset(size.width, size.height - 20);
    final rightCurvePoint2 = Offset(size.width, size.height);
    path.quadraticBezierTo(rightCurvePoint1.dx, rightCurvePoint1.dy,
        rightCurvePoint2.dx, rightCurvePoint2.dy);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
