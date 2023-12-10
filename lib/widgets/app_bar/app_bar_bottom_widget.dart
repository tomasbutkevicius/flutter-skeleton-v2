import 'package:flutter/cupertino.dart';
import 'package:skeleton_231210/widgets/proxy/divider/proxy_divider_widget.dart';

class AppBarBottomWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarBottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProxyDividerHorizontalWidget(
      height: 1.0,
      indent: 20.0,
      endIndent: 20.0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(1.0);
}
