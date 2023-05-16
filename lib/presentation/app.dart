import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucidplus_chat_app/application/splash_screen_bloc/bloc/splash_screen_bloc.dart';

import '../domain/routes/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: ((context) => SplashScreenBloc()))
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: GetNamedRouts.getRouts(),
          title: 'Lucidplus Chat App',
          theme: ThemeData(
            backgroundColor: Colors.white,
            canvasColor: Colors.white,
            primarySwatch: Colors.blue,
          ),
          initialRoute: RoutPaths.splashScreen,
        ),
    );
  }
}
