import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skeleton_231210/constants/proxy.dart';
import 'package:skeleton_231210/theme/theme_colors.dart';
import 'package:skeleton_231210/widgets/proxy/spacing/proxy_spacing_widget.dart';
import 'package:skeleton_231210/widgets/proxy/text/proxy_text_widget.dart';

class ProxyTextIconWidget extends StatelessWidget {
  final String text;
  final String icon;
  final Color color;
  final double width;
  final bool isUppercase;

  const ProxyTextIconWidget({
    Key? key,
    this.text = '',
    this.color = ThemeColors.blue500,
    required this.icon,
    this.width = 50.0,
    this.isUppercase = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          icon,
          color: color,
          width: width,
          semanticsLabel: text,
        ),
        const ProxySpacingVerticalWidget(),
        ProxyTextWidget(
          text: text,
          color: color,
          isUppercase: isUppercase,
          fontSize: ProxyFontSize.extraLarge,
          fontWeight: ProxyFontWeight.semiBold,
        ),
      ],
    );
  }
}
