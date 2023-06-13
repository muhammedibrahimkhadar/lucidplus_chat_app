import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lucidplus_chat_app/infrastructure/global_database/signup_repo/irepo.dart';

import '../../../domain/constants/shared_preference_keys.dart';
import '../../../domain/routes/routes.dart';
import '../../../infrastructure/global_database/firebase/database_services.dart';
import '../../../infrastructure/local_database/secured_shared_preferences.dart';

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

        await authService
            .registerUserWithEmailAndPassword(
                event.fullname!, event.email!, event.password!)
            .then((value) async {
          log("message");
        });

        await firebaseAuthInstance
            .createUserWithEmailAndPassword(
                email: event.email!, password: event.password!)
            .then((value) async => log(value.toString()));

        
      }
    });

    on<_Nav>((event, emit) =>
        {Navigator.pushNamedAndRemoveUntil(event.ctx, RoutPaths.splashScreen,(Route<dynamic> route) => false)});
  }
}
