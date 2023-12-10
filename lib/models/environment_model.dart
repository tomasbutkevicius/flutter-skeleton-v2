import 'package:flutter/cupertino.dart';

@immutable
class Environment {
  final String apiHost;
  final String webHost;
  final String imgHost;
  final String webAuthKey;

  const Environment({
    required this.apiHost,
    required this.webHost,
    required this.imgHost,
    required this.webAuthKey,
  });
}
