import 'dart:developer';
import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:lucidplus_chat_app/domain/routes/routes.dart';
import 'package:lucidplus_chat_app/infrastructure/global_database/signup_repo/irepo.dart';
import 'package:lucidplus_chat_app/presentation/about_screen/abour_screen.dart';
import 'package:lucidplus_chat_app/presentation/women_safty_web_view/women_safty_web_view.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:sensors_plus/sensors_plus.dart';

import '../../infrastructure/global_database/telegram_apis/send_message/irepo.dart';
import '../../infrastructure/local_database/secured_shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isenterd = false;

  bool enterA_ValidID = false;

  String telegramId = "";

  late bool val;

  late StreamSubscription _volumeButtonSubscription;

  String? _latestHardwareButtonEvent;

  StreamSubscription<String>? _buttonSubscription;

  double dx = 7, dy = 350;

  void getval() async {
    val = await FlutterLocalSecuredStorage().getbool("telegram_id");
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
    userAccelerometerEvents.listen((UserAccelerometerEvent event) async {
      // log(event.x.toString());
      if (event.x >= 7 ||
          event.y >= 7 ||
          event.x <= -7 ||
          event.y <= -7 ||
          (event.z >= 7 || event.z <= -7)) {
        var id = await FlutterLocalSecuredStorage().read(
          "telegram_id",
        );
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Sending Message"),
        ));
        final pos = await Geolocator.getCurrentPosition();
        print(pos);
        final stringPos =
            "https://maps.google.com/?q=${pos.latitude},${pos.longitude}";
        ITelegramSendMessageRepoImpl instance = ITelegramSendMessageRepoImpl();
        instance.sendMessageTo(id,
            "Dear user this is an SOS message in the case of EMERGENCY the users current location is at $stringPos");
      }
    });
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Colors.black,
              Color.fromARGB(255, 46, 46, 46),
            ], begin: Alignment.bottomLeft, end: Alignment.topRight)),
            child: Center(
              child: ListView(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    color: Color.fromARGB(255, 48, 47, 47),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Image.asset("assets/icon.png")),
                        SizedBox(
                          width: 24,
                        ),
                        Text(
                          "Home",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        Spacer(),
                        GestureDetector(
                            onTap: () {
                              FirebaseAuth.instance.signOut();
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  RoutPaths.splashScreen, (route) => false);
                            },
                            child: Text(
                              "Logout",
                              style: TextStyle(
                                color: Color.fromARGB(255, 255, 0, 0),
                                fontSize: 12,
                              ),
                            )),
                        SizedBox(
                          width: 15,
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10, top: 10),
                    alignment: Alignment.centerRight,
                    width: MediaQuery.of(context).size.width,
                    child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => About(),
                          ));
                        },
                        child: Icon(
                          Icons.info,
                          color: Colors.pink,
                        )),
                  ),
                  Container(
                    height: 800,
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Column(
                      children: [
                        isenterd
                            ? Container(
                                alignment: Alignment.bottomCenter,
                                height: 300,
                                child: Text(
                                  "You are good to go !!!",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              )
                            : Column(
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        (25 / 100),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.all(30.0),
                                      child: TextFormField(
                                          style: TextStyle(color: Colors.grey),
                                          onChanged: (value) async {
                                            telegramId = value;
                                          },
                                          onTap: () async =>
                                              Permission.contacts.request(),
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey),
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            hintStyle:
                                                TextStyle(color: Colors.grey),
                                            hintText:
                                                "Enter the telegram user ID",
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey),
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                          ))),
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          left: 30,
                                          right: 30,
                                          top: 15,
                                          bottom: 15),
                                      child: GestureDetector(
                                        onTap: () {},
                                        child: const Text(
                                          "***Please note that this is a one time process so please make sure you enter correct user id***",
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      )),
                                  ElevatedButton(
                                    onPressed: () async {
                                      if (telegramId == "") {
                                        setState(() {
                                          enterA_ValidID = true;
                                        });
                                      } else {
                                        await FlutterLocalSecuredStorage()
                                            .write("telegram_id", telegramId);
                                        if (await FlutterLocalSecuredStorage()
                                            .getbool("telegram_id")) {
                                          setState(() {
                                            isenterd = true;
                                          });
                                        }
                                      }
                                    },
                                    child: Container(
                                      height: 40,
                                      width: 100,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: Colors.pink,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Text(
                                        "Submit",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => WomenSaftyWebView(),
                            ));
                          },
                          child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(top: 100),
                            height: 50,
                            width: 260,
                            decoration: BoxDecoration(
                                color: Colors.grey[600],
                                borderRadius: BorderRadius.circular(14)),
                            child: Text(
                              "Go to Women Safty Division of \n Central Govt of India",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  )
                  // isenterd?

                  // ListView.builder()
                ],
              ),
            )),
      ),
    );
  }
}
