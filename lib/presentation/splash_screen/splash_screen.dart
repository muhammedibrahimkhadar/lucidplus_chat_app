import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lucidplus_chat_app/application/splash_screen_bloc/bloc/splash_screen_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<SplashScreenBloc>(context)
        .add(SplashScreenEvent.started(ctx: context));
    return Scaffold(
      body: _buildUI(context),
    );
  }

  Container _buildUI(BuildContext ctx) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Colors.black,
        Color.fromARGB(255, 46, 46, 46),
      ], begin: Alignment.bottomLeft, end: Alignment.topRight)),
      child: Center(
          child: SvgPicture.asset(
        "assets/logo.svg",
        height: MediaQuery.of(ctx).size.width - 80,
        width: MediaQuery.of(ctx).size.width - 80,
      )),
    );
  }
}
