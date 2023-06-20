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

class AddUserScreen extends StatefulWidget {
  AddUserScreen({super.key});

  @override
  State<AddUserScreen> createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {
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
                    height: 950,
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
                                          controller: nameController,
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
                                            hintText: "Enter the name",
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey),
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                          ))),
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          left: 30.0,
                                          right: 30,
                                          bottom: 10,
                                          top: 10),
                                      child: TextFormField(
                                          controller: idController,
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
                                  ElevatedButton(
                                    onPressed: () async {
                                      
                                      if (idController.text != "" &&
                                          nameController.text != "") {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text('Successful'),
                                              content: Text(
                                                  'Your Id Has Been Saved'),
                                              actions: <Widget>[
                                                TextButton(
                                                  child: Text('OK'),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                      Navigator.of(context).pop();
                                                  },
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                        final box = Hive.box<Contact>('contacts');

                                      await box.add(Contact()
                                        ..name = nameController.text
                                        ..contact = idController.text);

                                      nameController.clear();
                                      idController.clear();
                                      }else{
                                         showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text('Alert'),
                                              content: Text(
                                                  'Enter Valid values'),
                                              actions: <Widget>[
                                                TextButton(
                                                  child: Text('OK'),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      }

                                      // Navigator.of(context).pop();
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
                        Spacer(),
                      ],
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
