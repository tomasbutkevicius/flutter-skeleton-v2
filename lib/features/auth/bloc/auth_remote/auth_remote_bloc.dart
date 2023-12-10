import 'dart:async';

import 'package:skeleton_231210/features/auth/bloc/auth_remote/auth_remote_repository.dart';
import 'package:skeleton_231210/features/auth/models/auth_model.dart';
import 'package:skeleton_231210/features/auth/models/form_login_model.dart';
import 'package:skeleton_231210/models/request_status_model.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'auth_remote_event.dart';

part 'auth_remote_state.dart';

class AuthRemoteBloc extends HydratedBloc<AuthRemoteEvent, AuthRemoteState> {
  final AuthRemoteRepository repositoryRemote;

  // StreamSubscription<User?>? _listener;

  @override
  AuthRemoteState? fromJson(Map<String, dynamic> json) => AuthRemoteState.fromMap(json);

  @override
  Map<String, dynamic>? toJson(AuthRemoteState state) => state.toMap();

  AuthRemoteBloc({
    required this.repositoryRemote,
  }) : super(const AuthRemoteState()) {
    on<AuthRemoteEventInit>(_onInit);
    on<AuthRemoteEventReset>(_onReset);
    on<AuthRemoteEventLoginApi>(_onLogin);
    // on<_AuthRemoteEventRefresh>(_onRefresh);
  }

  Future _onInit(AuthRemoteEventInit event, Emitter<AuthRemoteState> emit) async {
    // await _handleListener();
  }

  Future _onReset(AuthRemoteEventReset event, Emitter<AuthRemoteState> emit) async {
    emit(AuthRemoteState(lastUsedEmail: state.lastUsedEmail));
    await repositoryRemote.logout();
  }

  Future _onLogin(AuthRemoteEventLoginApi event, Emitter<AuthRemoteState> emit) async {
    await _handleError(emit, event, () async {
      emit(
        state.copyWith(status: RequestStatus.fetching),
      );
      AuthModel authData = await repositoryRemote.loginWithForm(event.formModel);

      emit(
        state.copyWith(
          authData: authData,
          status: RequestStatus.done,
          lastUsedEmail: event.formModel.valueEmail,
        ),
      );

      // _handleListener();
    });
  }

  Future _handleError(Emitter<AuthRemoteState> emit, AuthRemoteEvent event, Function action) async {
    try {
      await action();
    } on DioException catch (e) {
      emit(
        state.copyWith(
          status: RequestStatus.errorDio(e),
        ),
      );
    } catch (e) {
      emit(state.copyWith(
        status: RequestStatus.error(),
      ));
    }
  }

// Future _onRefresh(_AuthRemoteEventRefresh event, Emitter<AuthRemoteState> emit) async {
//   await _handleError(emit, event, () async {
//     emit(
//       state.copyWith(status: RequestStatus.fetching),
//     );
//     AuthModel authData = event.auth;
//
//     emit(
//       state.copyWith(
//         authData: authData,
//         status: RequestStatus.done,
//       ),
//     );
//   });
// }

// Future _handleListener() async {
//   await _listener?.cancel();
//   _listener = repositoryRemote.service.authStateChanges().listen(
//     (User? firebaseUser) {
//       if (firebaseUser == null) {
//         add(AuthRemoteEventReset());
//       }
//       if (firebaseUser != null && !state.isUserLoggedIn) {
//         add(_AuthRemoteEventRefresh(user: AuthModel.fromFirebaseUser(firebaseUser)));
//       }
//     },
//   );
// }
//
// @override
// Future close() async {
//   await _listener?.cancel();
//   return super.close();
// }
}
