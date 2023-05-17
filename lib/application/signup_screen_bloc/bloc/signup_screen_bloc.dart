import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lucidplus_chat_app/infrastructure/global_database/signup_repo/repo.dart';

import '../../../domain/routes/routes.dart';

part 'signup_screen_event.dart';
part 'signup_screen_state.dart';
part 'signup_screen_bloc.freezed.dart';

class SignupScreenBloc extends Bloc<SignupScreenEvent, SignupScreenState> {
  SignupScreenBloc() : super(_Initial()) {
    FirebaseAuthImpl authService = FirebaseAuthImpl();
    final firebaseAuthInstance = FirebaseAuth.instance;

    on<SignupScreenEvent>((event, emit) {});

    on<_Register>((event, emit) async {
      if (event.formkey.currentState!.validate()) {
        emit(state.copyWith(isLoading: true));

         authService.registerUserWithEmailAndPassword(
            event.fullname.toString(),
            event.email.toString(),
            event.password.toString()).then((value) => log(value.toString()));

     
       
      }
    });
  }
}
