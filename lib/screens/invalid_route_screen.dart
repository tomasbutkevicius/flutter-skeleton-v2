import 'package:flutter/material.dart';
import 'package:skeleton_231210/constants/messages.dart';
import 'package:skeleton_231210/constants/proxy.dart';
import 'package:skeleton_231210/theme/theme_colors.dart';
import 'package:skeleton_231210/utilities/navigation_utilities.dart';
import 'package:skeleton_231210/widgets/proxy/button/proxy_button_widget.dart';
import 'package:skeleton_231210/widgets/proxy/spacing/proxy_spacing_widget.dart';
import 'package:skeleton_231210/widgets/proxy/text/proxy_text_widget.dart';

class InvalidRouteScreen extends StatelessWidget {
  final String path;

  const InvalidRouteScreen({
    Key? key,
    required this.path,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            ProxyTextWidget(
              fontSize: ProxyFontSize.huge,
              fontWeight: ProxyFontWeight.semiBold,
              text: '${MessagesConstants.invalidRoute}: $path',
            ),
            const ProxySpacingVerticalWidget(),
            ProxyButtonWidget(
              color: ThemeColors.blue,
              text: MessagesConstants.goBack,
              onPressed: () => NavigationUtilities.reset(context),
            ),
          ],
        ),
      ),
    );
  }
}
