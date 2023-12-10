import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
class AuthModel extends Equatable {
  final String email;
  final String id;

  const AuthModel({
    required this.email,
    required this.id,
  });

  // factory AuthModel.fromFirebaseUser(User user) {
  //   return AuthModel(
  //     email: user.email!,
  //     id: user.uid,
  //   );
  // }

  @override
  List<Object?> get props => [
        id,
        email,
      ];
}
