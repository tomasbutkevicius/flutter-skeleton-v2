part of 'auth_remote_bloc.dart';

class AuthRemoteState extends Equatable {
  final AuthModel? authData;
  final String? lastUsedEmail;
  final RequestStatus status;

  const AuthRemoteState({
    this.authData,
    this.lastUsedEmail,
    this.status = RequestStatus.init,
  });

  AuthRemoteState copyWith({
    AuthModel? authData,
    String? lastUsedEmail,
    RequestStatus? status,
  }) {
    return AuthRemoteState(
      status: status ?? this.status,
      lastUsedEmail: lastUsedEmail ?? this.lastUsedEmail,
      authData: authData ?? this.authData,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'lastUsedEmail': lastUsedEmail,
    };
  }

  factory AuthRemoteState.fromMap(Map<String, dynamic> map) {
    return AuthRemoteState(
      lastUsedEmail: map['lastUsedEmail'] as String,
    );
  }

  bool get isUserLoggedIn => authData != null;

  String get userToken => authData!.id;

  @override
  List<Object?> get props => [authData, status, lastUsedEmail];
}
