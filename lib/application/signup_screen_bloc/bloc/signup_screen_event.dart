part of 'signup_screen_bloc.dart';

@freezed
class SignupScreenEvent with _$SignupScreenEvent {
  const factory SignupScreenEvent.started() = _Started;
  const factory SignupScreenEvent.validateAndRegister({
    required BuildContext ctx,
    required GlobalKey<FormState> formkey,
    required String? fullname,
    required String? password,
    required String? email
  }) = _Register;
}