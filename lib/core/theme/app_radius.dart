import 'package:flutter/widgets.dart';

class AppRadius {
  AppRadius._();
  static const double sm = 10;
  static const double md = 14;
  static const double lg = 20;
  static const double xl = 28;
  static const double pill = 100;

  static BorderRadius all(double r) => BorderRadius.circular(r);
}
