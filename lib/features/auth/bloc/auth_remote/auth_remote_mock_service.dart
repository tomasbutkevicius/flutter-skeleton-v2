import 'package:skeleton_231210/features/auth/models/auth_model.dart';
import 'package:skeleton_231210/features/auth/models/form_login_model.dart';

class AuthRemoteMockService {
  Future<AuthModel> loginWithForm(FormLoginModel formModel) async {
    return AuthModel(
      email: formModel.valueEmail,
      id: 'mocked_id',
    );
  }

  Future logout() async {
    // await service.signOut();
  }
}
