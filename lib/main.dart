import 'dart:convert';
import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:lucidplus_chat_app/infrastructure/global_database/telegram_apis/send_message/irepo.dart';
import 'package:lucidplus_chat_app/presentation/home/home.dart';
import 'package:lucidplus_chat_app/presentation/splash_screen/data_x/data_x.dart';
import 'package:teledart/teledart.dart';
import 'package:teledart/telegram.dart';

import 'domain/api/auth_token.dart';
import 'infrastructure/global_database/firebase/firebase_options.dart';
import 'presentation/app.dart';

Future<void> main() async {
  String temp = '{"status": "9208423049823094","message": ["your value" ]}';

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  bool _isServiceEnabled = await Geolocator.isLocationServiceEnabled();

  if (!_isServiceEnabled) {}
  // Geolocator.requestPermission();
  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error("Location permission denied");
    }
  }
  final pos = await Geolocator.getCurrentPosition();
  print(pos);
  final stringPos =
      "https://maps.google.com/?q=${pos.latitude},${pos.longitude}";
  ITelegramSendMessageRepoImpl instance = ITelegramSendMessageRepoImpl();
  instance.sendMessageTo("886468433",
      "Hello chtbot activated your  and  her location is $stringPos");
  // log(await Geolocator.getCurrentPosition().toString());
  //  Geolocator.requestPermission();
  runApp(MyApp());
}

double dx = 200, dy = 350;
// late StreamSubscription _volumeButtonSubscription;
// String? _latestHardwareButtonEvent;

// StreamSubscription<String>? _buttonSubscription;

//  userAccelerometerEvents.listen((UserAccelerometerEvent event) {
//     if (event.x >= 33 ||
//         event.y >= 33 ||
//         event.z >= 33 ||
//         event.x <= -33 ||
//         event.y <= -33 ||
//         event.z <= -33)
//     {
//        log("message");
//     }
//   });

// return Scaffold(
//   appBar: AppBar(
//     title: Text(widget.title),
//   ),
//   body: Container(
//     color: Colors.red,
//     child: StreamBuilder<GyroscopeEvent>(
//       stream: SensorsPlatform.instance.gyroscopeEvents,
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           dx = dx + (snapshot.data!.y * 10);
//           dy = dy + (snapshot.data!.x * 10);
//         }

//         return Transform.translate(
//           offset: Offset(dx, dy),
//           child: CircleAvatar(radius: 20),
//         );
//       },
//     ),
//   ),
// );
