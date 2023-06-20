import 'dart:developer';
import 'dart:async';

import 'package:current_location/current_location.dart';
import 'package:current_location/model/location.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:location_plus/location_plus.dart';
import 'package:lottie/lottie.dart';
import 'package:lucidplus_chat_app/domain/routes/routes.dart';
import 'package:lucidplus_chat_app/infrastructure/global_database/signup_repo/irepo.dart';
import 'package:lucidplus_chat_app/infrastructure/local_database/hive.dart';
import 'package:lucidplus_chat_app/presentation/about_screen/abour_screen.dart';
import 'package:lucidplus_chat_app/presentation/women_safty_web_view/women_safty_web_view.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:sensors_plus/sensors_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../infrastructure/global_database/telegram_apis/send_message/irepo.dart';
import '../../infrastructure/local_database/secured_shared_preferences.dart';

class SavedUsers extends StatefulWidget {
  SavedUsers({super.key});

  @override
  State<SavedUsers> createState() => _SavedUsersState();
}

class _SavedUsersState extends State<SavedUsers> {
  bool isenterd = false;

  bool enterA_ValidID = false;

  String telegramId = "";
  // Location
  late String address;
  late bool val;

  Future<String> loc() async {
    String result = await LocationPlus.getCurrentLocation();

    var loc = await Geolocator.getLocationAccuracy();
    return loc.name;
    // return result['locality'];
  }

  late StreamSubscription _volumeButtonSubscription;

  String? _latestHardwareButtonEvent;

  StreamSubscription<String>? _buttonSubscription;

  double dx = 7, dy = 350;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loc();
  }

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

  TextEditingController nameController = TextEditingController();
  TextEditingController idController = TextEditingController();

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
                  Container(
                    margin: EdgeInsets.only(top: 30,left: 20),
                    child: Text("Contact Lists",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700,color: Colors.white),)),
                  Container(
                    margin: EdgeInsets.only(top: 20, left: 30, right: 30),
                    height: MediaQuery.of(context).size.height * (90 / 100),
                    child: ValueListenableBuilder(
                      valueListenable:
                          Hive.box<Contact>('contacts').listenable(),
                      builder: (BuildContext context, Box<Contact> box,
                          Widget? child) {
                        final contacts = box.values.toList();
                        log(contacts.length.toString());
                        return ListView.builder(
                          itemCount: contacts.length,
                          itemBuilder: (BuildContext context, int index) {
                            final contact = contacts[index];
                            return Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color.fromARGB(255, 231, 203, 118)),
                              margin: EdgeInsets.only(top: 10),
                              height: 60,
                              width: 300,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Contact name: ${contact.name}",
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 54, 89, 244))),
                                      Text(
                                        'Telegram ID: ${contact.contact}',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 54, 89, 244)),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      final box = Hive.box<Contact>('contacts');
                                      box.deleteAt(index);
                                    },
                                    child: Container(
                                        margin: EdgeInsets.only(right: 10),
                                        child: Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        )),
                                  )
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            )),
      ),
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
