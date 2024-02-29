// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class TColor {
  static Color get primary => Color.fromARGB(174, 17, 66, 40);
  static Color get primaryAlpha => Color.fromARGB(173, 39, 172, 101);
  static Color get primaryBeta => Color.fromARGB(173, 6, 39, 21);
  static Color get primaryCharlie => Color.fromARGB(173, 28, 203, 110);
  static Color get primaryDelta => Color.fromARGB(173, 8, 228, 148);

  static Color get secondary => Color.fromARGB(190, 62, 175, 184);
  static Color get secondaryAlpha => Color.fromARGB(201, 227, 103, 194);
  static Color get secondaryBeta => Color.fromARGB(210, 249, 213, 83);

  static Color get tertiary => Color.fromARGB(226, 164, 133, 227);
  static Color get tertiaryAlpha => Color.fromARGB(204, 150, 85, 150);

  static Color get base => Color.fromARGB(154, 62, 156, 106);
  static Color get baseAlpha => Color.fromARGB(173, 7, 48, 26);

  static Color get gray => Color(0xff83839C);
  static Color get gray30 => Color(0xffA2A2B5);

  static Color get primaryText => Colors.white;
  static Color get secondaryText => gray30;

  static Color get white => Colors.white;
}
