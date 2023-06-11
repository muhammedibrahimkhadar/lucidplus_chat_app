import 'dart:developer';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:sensors_plus/sensors_plus.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    getContactPermission();
  }

  void getContactPermission() async {
    if (await Permission.contacts.isGranted) {
      // log("message");
    } else {
      log("is not permissed ");
      try {
        await Permission.contacts.request();
      } catch (e) {
        log(e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    late StreamSubscription _volumeButtonSubscription;
    String? _latestHardwareButtonEvent;

    StreamSubscription<String>? _buttonSubscription;
    double dx = 88, dy = 350;

    userAccelerometerEvents.listen((UserAccelerometerEvent event) {
      // log(event.x.toString());
      if (event.x >= 88 ||
          event.y >= 88 ||
          event.x <= -88 ||
          event.y <= -88 ||
          (event.z >= 88 || event.z <= -88)) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Sending Message"),
        ));
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: Text("title"),
      ),
      body: Container(
        // child: StreamBuilder<GyroscopeEvent>(
        //   stream: SensorsPlatform.instance.gyroscopeEvents,
        //   builder: (context, snapshot) {
        //     if (snapshot.hasData) {
        //       dx = dx + (snapshot.data!.y * 10);
        //       dy = dy + (snapshot.data!.x * 10);
        //     }

        //     return Transform.translate(
        //       offset: Offset(dx, dy),
        //       child: CircleAvatar(radius: 20),
        //     );
        //   },
        // ),

        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
                padding: const EdgeInsets.all(30.0),
                child: TextFormField(
                    onTap: () async => Permission.contacts.request(),
                    decoration: InputDecoration(
                      hintText: "Enter Contact",
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ))),

            // ListView.builder()
          ],
        )),
      ),
    );
  }
}
