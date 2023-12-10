import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:skeleton_231210/constants/proxy.dart';
import 'package:skeleton_231210/theme/theme_colors.dart';
import 'package:skeleton_231210/widgets/proxy/button/proxy_button_widget.dart';

class FormButtonWidget extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final ProxyFontSize fontSize;
  final VoidCallback onPressed;
  final bool activated;
  final bool hasShadow;
  final EdgeInsets padding;

  const FormButtonWidget({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color = ThemeColors.orange,
    this.textColor = ThemeColors.tangerine100,
    this.fontSize = ProxyFontSize.small,
    this.hasShadow = false,
    this.activated = true,
    this.padding = const EdgeInsets.symmetric(
      vertical: 15.0,
      horizontal: 20.0,
    ),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: !activated ? ThemeColors.tangerine100 : Colors.transparent,
          width: 1,
        ),
      ),
      child: ProxyButtonWidget(
        onPressed: onPressed,
        fontSize: fontSize,
        color: activated ? color : ThemeColors.tangerine100,
        textColor: activated ? textColor : ThemeColors.blue500,
        padding: padding,
        text: text,
        hasShadow: hasShadow,
      ),
    );
  }
}
