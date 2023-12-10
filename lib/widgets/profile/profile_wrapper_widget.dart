import 'package:skeleton_231210/features/auth/bloc/auth_remote/auth_remote_bloc.dart';
import 'package:skeleton_231210/widgets/proxy/button/proxy_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileWrapperWidget extends StatelessWidget {
  const ProfileWrapperWidget({super.key});

  void _onTap(BuildContext context) {
    context.read<AuthRemoteBloc>().add(AuthRemoteEventReset());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProxyButtonWidget(
          text: 'Atsijungti',
          onPressed: () => _onTap(context),
        ),
      ],
    );
  }
}
