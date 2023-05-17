
import 'package:lucidplus_chat_app/presentation/auth/login_screen/login_screen.dart';
import 'package:lucidplus_chat_app/presentation/auth/signup_screen/signup_screen.dart';
import 'package:lucidplus_chat_app/presentation/splash_screen/splash_screen.dart';

abstract class RoutPaths {
  static const String splashScreen = "/SPLASH_SCREEN";
  static const String loginScreen = "/LOGIN_SCREEN";
  static const String signUpScreen = "/SIGNUP_SCREEN";
}

abstract class GetNamedRouts {
  static getRouts() {
    return {
      RoutPaths.splashScreen: (context) => const SplashScreen(),
      RoutPaths.loginScreen: (context) =>  LoginScreen(),
      RoutPaths.signUpScreen: (context) =>  SignupScreen()
    };
  }
}
