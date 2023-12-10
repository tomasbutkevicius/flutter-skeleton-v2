import 'package:skeleton_231210/features/auth/bloc/auth_remote/auth_remote_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

class FormLoginModel {
  static const String fieldNameEmail = 'email';
  static const String fieldNamePassword = 'password';
  final FormGroup form;

  FormLoginModel(this.form);

  factory FormLoginModel.init(BuildContext context) {
    AuthRemoteBloc authBloc = BlocProvider.of<AuthRemoteBloc>(context);

    return FormLoginModel(
      fb.group({
        fieldNameEmail: FormControl<String>(
          value: authBloc.state.lastUsedEmail,
          validators: [
            Validators.email,
            Validators.required,
          ],
        ),
        fieldNamePassword: FormControl<String>(
          validators: [
            Validators.required,
          ],
        ),
      }),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': form.rawValue[fieldNameEmail],
      'password': form.value[fieldNamePassword],
    };
  }

  String get valueEmail => form.value[fieldNameEmail] as String;

  String get valuePassword => form.value[fieldNamePassword] as String;
}
