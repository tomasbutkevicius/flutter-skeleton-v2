import 'package:skeleton_231210/features/auth/bloc/auth_remote/auth_remote_mock_service.dart';
import 'package:skeleton_231210/features/auth/models/auth_model.dart';
import 'package:skeleton_231210/features/auth/models/form_login_model.dart';

class AuthRemoteRepository {
  final AuthRemoteMockService service = AuthRemoteMockService();

  Future<AuthModel> loginWithForm(FormLoginModel formModel) async {
    return service.loginWithForm(formModel);
  }

  Future logout() async {
    return service.logout();
  }
}
