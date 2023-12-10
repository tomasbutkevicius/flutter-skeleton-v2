import 'package:skeleton_231210/constants/messages.dart';

class ErrorConstants {
  static const String errorKeyCredentialsIncorrect = 'The user credentials were incorrect.';
  static const String errorKeyFieldSocialFacebook = 'field_social_facebook';
  static const String errorKeyFieldSocialInstagram = 'field_social_instagram';
  static const String errorKeyValidationFailed = 'validation failed';

  static const Map<String, String> errorCodeMessages = {
    errorKeyCredentialsIncorrect: MessagesConstants.credentialsIncorrect,
    errorKeyFieldSocialFacebook: MessagesConstants.invalidFacebookUrl,
    errorKeyFieldSocialInstagram: MessagesConstants.invalidInstagramUrl,
    errorKeyValidationFailed: MessagesConstants.validationFailed,
  };

  static String getErrorMessage(String errorKey) {
    return errorCodeMessages[errorKey] ?? MessagesConstants.anErrorHasOccurred;
  }
}