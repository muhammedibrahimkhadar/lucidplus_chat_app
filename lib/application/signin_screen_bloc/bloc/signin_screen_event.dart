part of 'signin_screen_bloc.dart';

@freezed
class SigninScreenEvent with _$SigninScreenEvent {
  const factory SigninScreenEvent.started() = _Started;
  const factory SigninScreenEvent.goToRegisterPage({
    required BuildContext ctx
  }) = _NavigateToRegister;
}