import 'package:skeleton_231210/bloc/bottom_navigation_bar/bottom_navigation_bar_bloc.dart';
import 'package:skeleton_231210/bloc/forms/forms_bloc.dart';
import 'package:skeleton_231210/bloc/navigation/navigation_bloc.dart';
import 'package:skeleton_231210/features/auth/bloc/auth_remote/auth_remote_bloc.dart';
import 'package:skeleton_231210/features/auth/bloc/auth_remote/auth_remote_repository.dart';
import 'package:skeleton_231210/features/read_rehearsals/bloc/search_rehearsals_bloc.dart';
import 'package:skeleton_231210/widgets/listener/listener_user_widget.dart';
import 'package:skeleton_231210/widgets/navigation/navigation_wrapper_widget.dart';
import 'package:skeleton_231210/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NavigationBloc>(
          create: (_) => NavigationBloc(),
        ),
        BlocProvider<BottomNavigationBarBloc>(
          create: (_) => BottomNavigationBarBloc(),
        ),
        BlocProvider<SearchRehearsalsBloc>(
          create: (_) => SearchRehearsalsBloc(),
        ),
        BlocProvider<FormsBloc>(
          create: (_) => FormsBloc(),
        ),
        BlocProvider<AuthRemoteBloc>(
          create: (_) => AuthRemoteBloc(
            repositoryRemote: AuthRemoteRepository(),
          )..add(AuthRemoteEventInit()),
        ),
      ],
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme(),
      home: const Stack(
        children: [
          ListenerUserWidget(),
          NavigationWrapperWidget(),
        ],
      ),
    );
  }
}
