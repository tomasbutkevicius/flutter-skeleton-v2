import 'package:skeleton_231210/constants/proxy.dart';
import 'package:flutter/material.dart';
import 'package:skeleton_231210/features/auth/widgets/login_form_widget.dart';
import 'package:skeleton_231210/widgets/proxy/spacing/proxy_spacing_widget.dart';

class LoginWrapperWidget extends StatelessWidget {
  const LoginWrapperWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          LoginFormWidget(),
          ProxySpacingVerticalWidget(
            size: ProxySpacing.huge,
          ),
        ],
      ),
    );
  }
}
