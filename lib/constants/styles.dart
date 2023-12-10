import 'package:flutter/cupertino.dart';

class StylesConstants {
  static const double borderRadius = 2.0;
  static const String fontFamilyHeader = 'Syne';
  static const String fontFamilyBody = 'Roboto';
  static const String fontFamilyGame = 'Pixeloid';
  static const double heightAppBar = 60.0;

  static BoxConstraints getConstraintsDropdown(BuildContext context) => BoxConstraints(
    minWidth: MediaQuery.of(context).size.width * 0.7,
    maxWidth: MediaQuery.of(context).size.width * 0.7,
    maxHeight: MediaQuery.of(context).size.height * 0.8,
  );
}
