import 'package:skeleton_231210/constants/messages.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:sprintf/sprintf.dart';

class FormValidators {
  static Map<String, ValidationMessageFunction> validationMessages() {
    return {
      ValidationMessage.email: (Object error) => MessagesConstants.invalidEmail,
      ValidationMessage.required: (Object error) => MessagesConstants.fieldIsRequired,
      ValidationMessage.mustMatch: (Object error) => MessagesConstants.mustMatch,
      ValidationMessage.minLength: (Object error) =>
          sprintf(MessagesConstants.minValue, [(error as Map)['requiredLength']]),
      ValidationMessage.maxLength: (Object error) =>
          sprintf(MessagesConstants.minValue, [(error as Map)['requiredLength']]),
    };
  }
}
