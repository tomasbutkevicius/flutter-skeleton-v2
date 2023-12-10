import 'package:flutter/material.dart';
import 'package:skeleton_231210/constants/messages.dart';
import 'package:skeleton_231210/constants/proxy.dart';
import 'package:skeleton_231210/theme/theme_colors.dart';
import 'package:skeleton_231210/widgets/proxy/spacing/proxy_spacing_widget.dart';
import 'package:skeleton_231210/widgets/proxy/text/proxy_text_widget.dart';

class ErrorIconWidget extends StatelessWidget {
  final String text;
  final bool center;
  final VoidCallback? onReset;

  const ErrorIconWidget({
    Key? key,
    this.center = true,
    this.text = MessagesConstants.anErrorHasOccurred,
    this.onReset,
  }) : super(key: key);

  Widget _buildContainer(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(
          Icons.error_outline,
          color: ThemeColors.red,
        ),
        const ProxySpacingVerticalWidget(
          size: ProxySpacing.small,
        ),
        ProxyTextWidget(
          text: text,
          fontSize: ProxyFontSize.large,
          color: ThemeColors.red,
          fontWeight: ProxyFontWeight.semiBold,
        ),
        if (onReset != null)
          InkWell(
            onTap: onReset,
            child: const Icon(
              Icons.refresh,
              color: ThemeColors.red,
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return center ? Center(child: _buildContainer(context)) : _buildContainer(context);
  }
}
