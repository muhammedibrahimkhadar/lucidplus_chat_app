// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:lucidplus_chat_app/presentation/auth/login_screen/login_screen.dart';
// import 'package:lucidplus_chat_app/presentation/home/home.dart';

// class MainScreen extends StatelessWidget {
//   const MainScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: StreamBuilder<User?>(
//         builder: (context, snapshot) {
//           print(snapshot.hasData);
//           if (snapshot.hasData) {
//             print(snapshot.hasData);
//             return HomeScreen();
//           } else {
//             return LoginScreen();
//           }
//         },
//       ),
//     );
//   }
// }
