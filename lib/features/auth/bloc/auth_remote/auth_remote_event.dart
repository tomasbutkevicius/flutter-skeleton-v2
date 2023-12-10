part of 'auth_remote_bloc.dart';

@immutable
abstract class AuthRemoteEvent {
  const AuthRemoteEvent();
}

@immutable
class AuthRemoteEventInit extends AuthRemoteEvent {}

@immutable
class AuthRemoteEventLoginApi extends AuthRemoteEvent {
  final FormLoginModel formModel;

  const AuthRemoteEventLoginApi({
    required this.formModel,
  });
}

@immutable
class AuthRemoteEventReset extends AuthRemoteEvent {}
//
// @immutable
// class _AuthRemoteEventRefresh extends AuthRemoteEvent {
//   final AuthModel auth;
//
//   const _AuthRemoteEventRefresh({
//     required this.auth,
//   });
// }
