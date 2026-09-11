// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cinebox/ui/login/commands/login_with_google_command.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_view_model.g.dart';

class LoginViewModel {
  final LoginWithGoogleCommand _loginWithGoogleCommand;
  LoginViewModel({
    required LoginWithGoogleCommand loginWithGoogleCommand,
  }) : _loginWithGoogleCommand = loginWithGoogleCommand;

  void googleLogin() => _loginWithGoogleCommand.execute();
}

@riverpod
LoginViewModel loginViewModel(Ref ref) {
  return LoginViewModel(loginWithGoogleCommand: ref.watch(loginWithGoogleCommandProvider.notifier));
}
