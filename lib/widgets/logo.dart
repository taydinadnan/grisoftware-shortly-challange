// Logo Text
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget logo() {
  return Center(
    child: SvgPicture.asset(
      'assets/logo.svg',
      fit: BoxFit.cover,
    ),
  );
}
