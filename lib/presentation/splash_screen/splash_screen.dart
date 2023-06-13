import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lucidplus_chat_app/application/splash_screen_bloc/bloc/splash_screen_bloc.dart';
import 'package:lucidplus_chat_app/domain/constants/network_asset_paths.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: _buildUI(context),
    );
  }

  Container _buildUI(BuildContext ctx) {
    BlocProvider.of<SplashScreenBloc>(ctx)
        .add(SplashScreenEvent.started(ctx: ctx));
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.black,
          Color.fromARGB(255, 46, 46, 46),
        ],
        begin: Alignment.bottomLeft,
        end: Alignment.topRight
        )
      ),
      child: Center(
          child: SvgPicture.asset("assets/logo.svg")),
    );
  }
}
