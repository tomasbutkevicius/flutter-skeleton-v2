import 'package:flutter/material.dart';
import 'package:skeleton_231210/constants/proxy.dart';
import 'package:skeleton_231210/widgets/proxy/spacing/proxy_spacing_widget.dart';
import 'package:skeleton_231210/widgets/proxy/text/proxy_text_widget.dart';

class HeaderTextWidget extends StatelessWidget {
  final String text;

  const HeaderTextWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ProxySpacingVerticalWidget(
          size: ProxySpacing.large,
        ),
        Center(
          child: ProxyTextWidget(
            text: text,
            fontSize: ProxyFontSize.extraHuge,
            fontWeight: ProxyFontWeight.bold,
            isUppercase: true,
            fontFamily: ProxyFontFamily.header,
            textAlign: TextAlign.center,
          ),
        ),
        const ProxySpacingVerticalWidget(
          size: ProxySpacing.large,
        ),
      ],
    );
  }
}
