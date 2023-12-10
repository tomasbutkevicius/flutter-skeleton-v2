import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skeleton_231210/theme/theme_colors.dart';

class LocalImageWrapperWidget extends StatelessWidget {
  final String image;
  final Color? color;
  final double? width;
  final double? height;
  final Color errorColor;

  const LocalImageWrapperWidget({
    Key? key,
    required this.image,
    this.width,
    this.height,
    this.color,
    this.errorColor = ThemeColors.blackLight,
  }) : super(key: key);

  Widget _buildError(BuildContext context, Object error, StackTrace? stackTrace) {
    return Center(
      child: Icon(
        Icons.image,
        size: 60.0,
        color: errorColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return image.endsWith('png')
        ? Image.asset(
            image,
            width: width,
            height: height,
            color: color,
            errorBuilder: _buildError,
          )
        : SvgPicture.asset(
            image,
            width: width,
            height: height,
            color: color,
          );
  }
}
