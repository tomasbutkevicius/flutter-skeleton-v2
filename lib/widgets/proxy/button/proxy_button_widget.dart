import 'package:flutter/material.dart';
import 'package:skeleton_231210/constants/proxy.dart';
import 'package:skeleton_231210/theme/theme_colors.dart';

class ProxyButtonWidget extends StatelessWidget {
  final String text;
  final Color color;
  final Color? textColor;
  final ProxyFontSize fontSize;
  final ProxyFontWeight fontWeight;
  final EdgeInsetsGeometry padding;
  final VoidCallback? onPressed;
  final bool isUpperCase;
  final bool hasShadow;
  final ProxyFontFamily fontFamily;
  final ProxyShadowSize shadowSize;
  final double? width;
  final double? height;

  const ProxyButtonWidget({
    Key? key,
    required this.text,
    this.color = ThemeColors.orange,
    this.textColor = ThemeColors.blue500,
    this.fontSize = ProxyFontSize.medium,
    this.fontWeight = ProxyFontWeight.semiBold,
    this.padding = const EdgeInsets.symmetric(
      vertical: 15.0,
      horizontal: 40.0,
    ),
    this.onPressed,
    this.isUpperCase = true,
    this.fontFamily = ProxyFontFamily.game,
    this.shadowSize = ProxyShadowSize.medium,
    this.hasShadow = true,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        boxShadow: !hasShadow
            ? []
            : [
                BoxShadow(
                  color: Colors.black,
                  blurStyle: BlurStyle.solid,
                  blurRadius: 0,
                  offset: ProxyConstants.getShadowSize(shadowSize), // Shadow position
                ),
              ],
      ),
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          backgroundColor: MaterialStateProperty.all<Color>(color),
          foregroundColor: MaterialStateProperty.all<Color>(ThemeColors.tangerine100),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(padding),
          textStyle: MaterialStateProperty.all<TextStyle>(
            TextStyle(
              color: textColor,
              fontSize: ProxyConstants.getFontSize(fontSize),
              fontWeight: ProxyConstants.getFontWeight(fontWeight),
            ),
          ),
          side: MaterialStateProperty.all(
            const BorderSide(
              color: Colors.black,
              width: 2.0,
              style: BorderStyle.solid,
            ),
          ),
        ),
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            color: textColor,
            fontFamily: ProxyConstants.getFontFamily(fontFamily),
          ),
        ),
      ),
    );
  }
}
