import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeleton_231210/bloc/navigation/navigation_bloc.dart';
import 'package:skeleton_231210/models/navigation/navigation_params_model.dart';

class NavigationUtilities {
  static void reset(BuildContext context) => context.read<NavigationBloc>().add(NavigationEventReset());

  static void goBack(BuildContext context) => context.read<NavigationBloc>().add(NavigationEventGoBack());

  static void goBackTo({required String path, required BuildContext context}) =>
      context.read<NavigationBloc>().add(NavigationEventGoBackTo(path));

  static void push({required String path, required BuildContext context, NavigationParams? params}) =>
      context.read<NavigationBloc>().add(NavigationEventPush(path, params: params));

  static void replace({required String path, required BuildContext context, NavigationParams? params}) =>
      context.read<NavigationBloc>().add(NavigationEventReplace(path, params: params));

  static void dismissDialog(BuildContext context) {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context, rootNavigator: true).pop();
    }
  }
}
