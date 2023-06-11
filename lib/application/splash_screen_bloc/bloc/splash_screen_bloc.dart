import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lucidplus_chat_app/domain/constants/shared_preference_keys.dart';
import 'package:lucidplus_chat_app/domain/routes/routes.dart';

import '../../../infrastructure/local_database/secured_shared_preferences.dart';

part 'splash_screen_event.dart';
part 'splash_screen_state.dart';
part 'splash_screen_bloc.freezed.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  SplashScreenBloc() : super(_Initial()) {
    Future getUserLoggedinStatus() async {
      final securedStorageInstance = FlutterLocalSecuredStorage();
      final userLoggedinStatus = await securedStorageInstance
          .read(SharedPreferenceKeys.isUserLoggedInKey);

      log(userLoggedinStatus.toString());
      return userLoggedinStatus;
    }

    on<_Started>((event, emit) async {
      await Future.delayed(const Duration(seconds: 3));

      Navigator.pushNamed(event.ctx, RoutPaths.mainScreen);

      // if (await getUserLoggedinStatus()==SPKeyValues.TRUE) {
      //   Navigator.pushNamed(event.ctx, RoutPaths.loginScreen);
      // }else{
      //   Navigator.pushNamed(event.ctx, RoutPaths.signUpScreen);
      // }
    });
  }
}
