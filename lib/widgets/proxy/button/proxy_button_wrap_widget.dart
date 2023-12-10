import 'package:flutter/material.dart';
import 'package:skeleton_231210/constants/proxy.dart';
import 'package:skeleton_231210/theme/theme_colors.dart';

class ProxyButtonWrapWidget extends StatelessWidget {
  final Color? backgroundColor;
  final Widget child;
  final Size minimumSize;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final EdgeInsetsGeometry padding;
  final Color? borderColor;
  final double? borderRadius;
  final double borderWidth;
  final ProxyFontFamily fontFamily;

  const ProxyButtonWrapWidget({
    Key? key,
    this.backgroundColor = ThemeColors.orange,
    this.onLongPress,
    this.borderColor = Colors.black,
    this.borderRadius = 15,
    this.borderWidth = 2,
    required this.child,
    required this.onPressed,
    this.padding = EdgeInsets.zero,
    this.minimumSize = const Size(0, 0),
    this.fontFamily = ProxyFontFamily.header,
  }) : super(key: key);

  OutlinedBorder get _shape => RoundedRectangleBorder(
        side: borderColor == null ? BorderSide.none : BorderSide(color: borderColor!, width: borderWidth),
      );

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      onLongPress: onLongPress,
      style: TextButton.styleFrom(
        shape: _shape,
        padding: padding,
        backgroundColor: backgroundColor,
        minimumSize: minimumSize,
        textStyle: TextStyle(
          fontFamily: ProxyConstants.getFontFamily(fontFamily),
        ),
      ),
      child: child,
    );
  }
}
