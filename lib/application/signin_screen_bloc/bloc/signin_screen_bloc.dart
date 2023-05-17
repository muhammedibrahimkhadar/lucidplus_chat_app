import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lucidplus_chat_app/domain/routes/routes.dart';

part 'signin_screen_event.dart';
part 'signin_screen_state.dart';
part 'signin_screen_bloc.freezed.dart';

class SigninScreenBloc extends Bloc<SigninScreenEvent, SigninScreenState> {
  SigninScreenBloc() : super(_Initial()) {
    on<SigninScreenEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<_NavigateToRegister>((event, emit) {
      Navigator.pushNamed(event.ctx, RoutPaths.signUpScreen);
    });
  }
}
