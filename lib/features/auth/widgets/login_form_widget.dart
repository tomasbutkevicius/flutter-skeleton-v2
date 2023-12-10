import 'dart:async';

import 'package:skeleton_231210/features/auth/bloc/auth_remote/auth_remote_bloc.dart';
import 'package:skeleton_231210/features/auth/models/form_login_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeleton_231210/constants/proxy.dart';
import 'package:skeleton_231210/widgets/common/header_text_widget.dart';
import 'package:skeleton_231210/widgets/proxy/input/proxy_input_text_widget.dart';
import 'package:skeleton_231210/features/auth/widgets/login_form_buttons_widget.dart';
import 'package:skeleton_231210/widgets/proxy/spacing/proxy_spacing_widget.dart';
import 'package:reactive_forms/reactive_forms.dart';

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({super.key});

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  late final FormLoginModel _formModel;
  late final StreamSubscription<ControlStatus> _subscription;
  ControlStatus? status;

  @override
  void initState() {
    super.initState();
    _formModel = FormLoginModel.init(context);
    _subscription = _formModel.form.statusChanged.listen((ControlStatus status) {
      if (status != this.status) {
        setState(() {
          this.status = status;
        });
      }
    });
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  void _onSubmitted() {
    FocusManager.instance.primaryFocus!.unfocus();
    if (_formModel.form.valid) {
      context.read<AuthRemoteBloc>().add(AuthRemoteEventLoginApi(formModel: _formModel));
    } else {
      _formModel.form.markAllAsTouched();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ReactiveForm(
      formGroup: _formModel.form,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const HeaderTextWidget(
            text: 'Prisijungti',
          ),
          const ProxyInputTextWidget(
            label: 'El. paštas',
            keyboardType: TextInputType.emailAddress,
            formControlName: FormLoginModel.fieldNameEmail,
          ),
          const ProxySpacingVerticalWidget(),
          ProxyInputTextWidget(
            obscureText: true,
            onSubmitted: _onSubmitted,
            label: 'Slaptažodis',
            textInputAction: TextInputAction.done,
            formControlName: FormLoginModel.fieldNamePassword,
          ),
          const ProxySpacingVerticalWidget(
            size: ProxySpacing.extraLarge,
          ),
          LoginFormButtonsWidget(
            formModel: _formModel,
            onSubmitted: _onSubmitted,
          ),
        ],
      ),
    );
  }
}
