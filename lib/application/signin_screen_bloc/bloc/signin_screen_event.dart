part of 'signin_screen_bloc.dart';

@freezed
class SigninScreenEvent with _$SigninScreenEvent {
  const factory SigninScreenEvent.started() = _Started;
  const factory SigninScreenEvent.authenticateLogin(
      {required BuildContext ctx,
      required GlobalKey<FormState> formkey,
      required String password,
      required String email}) = _AuthLogin;

  const factory SigninScreenEvent.goToRegisterPage({
    required BuildContext ctx,
  }) = _NavigateToRegister;
}
