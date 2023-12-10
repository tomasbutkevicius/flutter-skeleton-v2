import 'package:skeleton_231210/features/auth/bloc/auth_remote/auth_remote_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeleton_231210/bloc/navigation/navigation_bloc.dart';
import 'package:skeleton_231210/constants/routes.dart';
import 'package:skeleton_231210/utilities/navigation_utilities.dart';
import 'package:skeleton_231210/widgets/navigation/navigation_widget.dart';

class NavigationWrapperWidget extends StatelessWidget {
  const NavigationWrapperWidget({super.key});

  Future<bool> _onWillPop(BuildContext context, NavigationState state) async {
    if (state.items.length < 2) {
      return true;
    }

    NavigationUtilities.goBack(context);
    return false;
  }

  bool _buildWhenNavigation(NavigationState previousState, NavigationState state) => previousState != state;

  Widget _builderNavigation(BuildContext context, NavigationState state) {
    final NavigationStateItem item = state.items.last;
    return WillPopScope(
      onWillPop: () => _onWillPop(context, state),
      child: NavigationWidget(
        path: item.path,
        params: item.params,
        item: Routes.mapping[item.path],
      ),
    );
  }

  bool _buildWhenAuthentication(AuthRemoteState previousState, AuthRemoteState state) => previousState.authData != state.authData;

  Widget _builderAuthentication(BuildContext context, AuthRemoteState state) {
    if (!state.isUserLoggedIn) {
      return NavigationWidget(
        path: Routes.login,
        item: Routes.mapping[Routes.login],
      );
    }

    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: _builderNavigation,
      buildWhen: _buildWhenNavigation,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthRemoteBloc, AuthRemoteState>(
      builder: _builderAuthentication,
      buildWhen: _buildWhenAuthentication,
    );
  }
}
