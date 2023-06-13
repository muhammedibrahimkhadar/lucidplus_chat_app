import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lucidplus_chat_app/application/signup_screen_bloc/bloc/signup_screen_bloc.dart';

import '../../../infrastructure/global_database/signup_repo/irepo.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();
  String? email;
  String? fullName;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Colors.black,
          Color.fromARGB(255, 46, 46, 46),
        ], begin: Alignment.bottomLeft, end: Alignment.topRight)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
            child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SvgPicture.asset("assets/logo.svg"),
                    SizedBox(
                      height: 25,
                    ),
                    const Text(
                      "Women Safety SOS Application",
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                    const SizedBox(height: 10),
                    const Text("Create your account now ",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey)),
                    TextFormField(
                      style: TextStyle(color: Colors.grey),
                      decoration: InputDecoration(
                          labelStyle: TextStyle(color: Colors.grey),
                          labelText: "Full Name",
                          prefixIcon: Icon(
                            Icons.person,
                            color: Theme.of(context).primaryColor,
                          )),
                      onChanged: (val) {
                        fullName = val;
                      },
                      validator: (val) {
                        if (val!.isNotEmpty) {
                          return null;
                        } else {
                          return "Name cannot be empty";
                        }
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      style: TextStyle(color: Colors.grey),

                      decoration: InputDecoration(
                          labelStyle: TextStyle(color: Colors.grey),
                          labelText: "Email",
                          prefixIcon: Icon(
                            Icons.email,
                            color: Theme.of(context).primaryColor,
                          )),
                      onChanged: (val) {
                        email = val;
                      },

                      // check tha validation
                      validator: (val) {
                        return RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(val!)
                            ? null
                            : "Please enter a valid email";
                      },
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                                          style: TextStyle(color: Colors.grey),

                      obscureText: true,
                      decoration: InputDecoration(
                        labelStyle:          TextStyle(color: Colors.grey),

                          labelText: "Password",
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Theme.of(context).primaryColor,
                          )),
                      validator: (val) {
                        if (val!.length < 6) {
                          return "Password must be at least 6 characters";
                        } else {
                          return null;
                        }
                      },
                      onChanged: (val) {
                        // setState(() {
                        password = val;
                        // });
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).primaryColor,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30))),
                        child: const Text(
                          "Register",
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                        onPressed: () async {
                          BlocProvider.of<SignupScreenBloc>(context).add(
                              SignupScreenEvent.validateAndRegister(
                                  ctx: context,
                                  formkey: formKey,
                                  fullname: fullName,
                                  password: password,
                                  email: email));

                          // final firebaseAuthInstance = FirebaseAuth.instance;
                          // FirebaseAuthImpl authService = FirebaseAuthImpl();

                          // await (authService.registerUserWithEmailAndPassword(
                          //     fullName.toString(),
                          //     email.toString(),
                          // password.toString()).then((value)async => log("message")));
                          // await firebaseAuthInstance
                          //     .createUserWithEmailAndPassword(
                          //         email: email!, password: password!).then((value) async=>log("khvkhvkhvkvkvhvk") );

                          BlocProvider.of<SignupScreenBloc>(context)
                              .add(SignupScreenEvent.navigate(ctx: context));
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text.rich(TextSpan(
                      text: "Already have an account? ",
                      style: const TextStyle(color: Colors.grey, fontSize: 14),
                      children: <TextSpan>[
                        TextSpan(
                            text: "Login now",
                            style: const TextStyle(
                                color: Colors.grey,
                                decoration: TextDecoration.underline),
                                recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // nextScreen(context, const LoginPage());
                              }),
                      ],
                    )),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
