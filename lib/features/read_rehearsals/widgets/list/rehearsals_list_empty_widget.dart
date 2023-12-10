import 'package:flutter/cupertino.dart';
import 'package:skeleton_231210/widgets/proxy/text/proxy_text_widget.dart';

class RehearsalsListEmptyWidget extends StatelessWidget {
  const RehearsalsListEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ProxyTextWidget(text: 'No items found');
  }
}
