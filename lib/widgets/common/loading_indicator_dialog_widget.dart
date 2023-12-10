import 'package:skeleton_231210/widgets/common/loading_indicator_widget.dart';
import 'package:flutter/material.dart';

class LoadingIndicatorDialogWidget {
  final BuildContext context;

  const LoadingIndicatorDialogWidget(this.context);

  void hide() {
    if (Navigator.of(context).canPop()) Navigator.of(context).pop();
  }

  Widget _builder(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: const LoadingIndicatorWidget()
    );
  }

  void show() {
    showDialog(
      context: context,
      builder: _builder,
      barrierDismissible: false,
    );
  }
}
