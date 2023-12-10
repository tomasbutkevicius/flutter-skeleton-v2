import 'package:skeleton_231210/constants/api.dart';
import 'package:skeleton_231210/constants/environment.dart';

class ImageUtilities {
  static String getUri({
    String? style,
    required String path,
    String? breakpointSuffix,
  }) {
    return Uri(
      host: environment.imgHost,
      path: path,
      scheme: ApiConstants.schemeHttps,
    ).toString();
  }

  static Map<String, String>? getHeaders() {
    return {
      'Authorization': environment.webAuthKey,
    };
  }
}
