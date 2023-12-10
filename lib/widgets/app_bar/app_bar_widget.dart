import 'package:flutter/material.dart';
import 'package:skeleton_231210/constants/styles.dart';
import 'package:skeleton_231210/theme/theme_colors.dart';
import 'package:skeleton_231210/widgets/app_bar/app_bar_logo_widget.dart';

import 'app_bar_bottom_widget.dart';


class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      titleSpacing: 0.0,
      automaticallyImplyLeading: false,
      backgroundColor: ThemeColors.tangerine100,
      bottom: const AppBarBottomWidget(),
      flexibleSpace: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 5.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              AppBarLogoWidget(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(StylesConstants.heightAppBar);
}
