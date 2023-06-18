import 'dart:developer';
import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:lottie/lottie.dart';
import 'package:lucidplus_chat_app/domain/routes/routes.dart';
import 'package:lucidplus_chat_app/infrastructure/global_database/signup_repo/irepo.dart';
import 'package:lucidplus_chat_app/presentation/about_screen/abour_screen.dart';
import 'package:lucidplus_chat_app/presentation/women_safty_web_view/women_safty_web_view.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:sensors_plus/sensors_plus.dart';
import 'package:url_launcher/url_launcher.dart';

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
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Colors.black,
              Color.fromARGB(255, 46, 46, 46),
            ], begin: Alignment.bottomLeft, end: Alignment.topRight)),
            child: Center(
              child: ListView(
                children: [
                  _appbar(context),
                  _info(context),
                  // Container(
                  //   height: 450,
                  //   padding: const EdgeInsets.only(left: 30, right: 30),
                  //   child: Column(
                  //     children: [
                  //       isenterd
                  //           ? Container(
                  //               alignment: Alignment.bottomCenter,
                  //               height: 300,
                  //               child: Text(
                  //                 "You are good to go !!!",
                  //                 style: TextStyle(color: Colors.grey),
                  //               ),
                  //             )
                  //           : Column(
                  //               children: [
                  //                 SizedBox(
                  //                   height: MediaQuery.of(context).size.height *
                  //                       (25 / 100),
                  //                 ),
                  //                 Padding(
                  //                     padding: const EdgeInsets.all(30.0),
                  //                     child: TextFormField(
                  //                         style: TextStyle(color: Colors.grey),
                  //                         onChanged: (value) async {
                  //                           telegramId = value;
                  //                         },
                  //                         onTap: () async =>
                  //                             Permission.contacts.request(),
                  //                         decoration: InputDecoration(
                  //                           border: OutlineInputBorder(
                  //                               borderSide: BorderSide(
                  //                                   color: Colors.grey),
                  //                               borderRadius:
                  //                                   BorderRadius.circular(8)),
                  //                           hintStyle:
                  //                               TextStyle(color: Colors.grey),
                  //                           hintText:
                  //                               "Enter the telegram user ID",
                  //                           enabledBorder: OutlineInputBorder(
                  //                               borderSide: BorderSide(
                  //                                   color: Colors.grey),
                  //                               borderRadius:
                  //                                   BorderRadius.circular(8)),
                  //                         ))),
                  //                 Padding(
                  //                     padding: const EdgeInsets.only(
                  //                         left: 30,
                  //                         right: 30,
                  //                         top: 15,
                  //                         bottom: 15),
                  //                     child: GestureDetector(
                  //                       onTap: () {},
                  //                       child: const Text(
                  //                         "***Please note that this is a one time process so please make sure you enter correct user id***",
                  //                         style: TextStyle(color: Colors.grey),
                  //                       ),
                  //                     )),
                  //                 ElevatedButton(
                  //                   onPressed: () async {
                  //                     if (telegramId == "") {
                  //                       setState(() {
                  //                         enterA_ValidID = true;
                  //                       });
                  //                     } else {
                  //                       await FlutterLocalSecuredStorage()
                  //                           .write("telegram_id", telegramId);
                  //                       if (await FlutterLocalSecuredStorage()
                  //                           .getbool("telegram_id")) {
                  //                         setState(() {
                  //                           isenterd = true;
                  //                         });
                  //                       }
                  //                     }
                  //                   },
                  //                   child: Container(
                  //                     height: 40,
                  //                     width: 100,
                  //                     alignment: Alignment.center,
                  //                     decoration: BoxDecoration(
                  //                         color: Colors.pink,
                  //                         borderRadius:
                  //                             BorderRadius.circular(20)),
                  //                     child: Text(
                  //                       "Submit",
                  //                       style: TextStyle(color: Colors.white),
                  //                     ),
                  //                   ),
                  //                 ),
                  //               ],
                  //             ),
                  //       Spacer(),
                  //     ],
                  //   ),
                  // ),

                  _callForHelpSection(context),
                  _womenSafetyWebRedirect(context),
                ],
              ),
            )),
      ),
    );
  }

  GestureDetector _womenSafetyWebRedirect(BuildContext context) {
    return GestureDetector(
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
            color: Colors.grey[600], borderRadius: BorderRadius.circular(14)),
        child: const Text(
          "Go to Women Safty Division of \n Central Govt of India",
          style: TextStyle(
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Container _callForHelpSection(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50, right: 25, left: 25),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.pink),
                      borderRadius: BorderRadius.circular(15)),
                  width: MediaQuery.of(context).size.width * (40 / 100),
                  child: Column(
                    children: [
                      LottieBuilder.asset(
                        "assets/Sergent police riding on a motorcycle (1).json",
                        height: 100,
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: const Text(
                          "Call Police Helpline \n100",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 13,
                            color: Colors.grey,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  final url =
                      "https://maps.google.com/?q=police+stations+with+in+10kms";
                  try {
                    await launchUrl(Uri.parse(url));
                  } catch (e) {
                    print(e);
                  }
                },
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.pink),
                      borderRadius: BorderRadius.circular(15)),
                  width: MediaQuery.of(context).size.width * (40 / 100),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 13,
                      ),
                      SvgPicture.asset(
                        "assets/policeStation.svg",
                        height: 65,
                      ),
                      Spacer(),
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: const Text(
                          "Near By Police \n Station",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 13,
                            color: Colors.grey,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 150,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.pink),
                    borderRadius: BorderRadius.circular(15)),
                width: MediaQuery.of(context).size.width * (40 / 100),
                child: Column(
                  children: [
                    LottieBuilder.asset(
                      "assets/121527-tech-support-and-customer-service.json",
                      height: 100,
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: const Text(
                        "Contact Women Safty\nCell",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 13,
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 150,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.pink),
                    borderRadius: BorderRadius.circular(15)),
                width: MediaQuery.of(context).size.width * (40 / 100),
                child: Column(
                  children: [
                    SizedBox(
                      height: 13,
                    ),
                    Image.asset(
                      "assets/1608.m00.i125.n001.P.c25.412978636_Active_running_woman_vector_illustration._Energy_jogging_woman_design-removebg-preview.png",
                      height: 85,
                    ),
                    Spacer(),
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: const Text(
                        "Escape Tips",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 13,
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container _info(BuildContext context) {
    return Container(
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
    );
  }

  Container _appbar(BuildContext context) {
    return Container(
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
    );
  }
}
