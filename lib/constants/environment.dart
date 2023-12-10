import 'package:skeleton_231210/models/environment_model.dart';

const Environment productionEnvironment = Environment(
  apiHost: '',
  webHost: '',
  imgHost: '',
  webAuthKey: '',
);

const Environment testEnvironment = Environment(
  apiHost: '',
  webHost: '',
  imgHost: '',
  webAuthKey: '',
);

const bool isProduction = bool.fromEnvironment('dart.vm.product');

const Environment environment = isProduction ? productionEnvironment : testEnvironment;
