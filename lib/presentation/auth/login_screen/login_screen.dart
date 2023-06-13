import 'dart:developer';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lucidplus_chat_app/application/signin_screen_bloc/bloc/signin_screen_bloc.dart';
import 'package:lucidplus_chat_app/domain/routes/routes.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  bool signinButtonIsPressed = false;

  String? password;

  String? email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildUI(context),
    );
  }

  SingleChildScrollView _buildUI(BuildContext context) {
    return SingleChildScrollView(
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
                  _headder(),
                  StreamBuilder(
                    stream: FirebaseAuth.instance.authStateChanges(),
                    builder: (context, snapshot) {
                      if (signinButtonIsPressed) {
                        if (snapshot.hasData) {
                          return SizedBox();
                        } else {
                          return SizedBox(
                            height: 15,
                            child: Text(
                              "incorrect credentials",
                              style: TextStyle(color: Colors.red),
                            ),
                          );
                        }
                      } else
                        return SizedBox();
                    },
                  ),
                  _inputFields(context),
                  _signIn(context),
                  StreamBuilder(
                    stream: FirebaseAuth.instance.authStateChanges(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        Navigator.of(context).pushNamed(RoutPaths.homeScreen);
                        return GestureDetector(
                            onTap: () {
                              FirebaseAuth.instance.signOut();
                            },
                            child: Text("yes",style: TextStyle(fontSize: 20,color: Colors.white),));
                      } else {
                        return SizedBox();
                      }
                    },
                  )
                ],
              )),
        ),
      ),
    );
  }

  Column _signIn(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Theme.of(context).primaryColor,
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30))),
            child: const Text(
              "Sign In",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            onPressed: () {
              setState(() {
                signinButtonIsPressed = true;
              });
              log("email :$email");
              log("pass :$password");

              BlocProvider.of<SigninScreenBloc>(context).add(
                  SigninScreenEvent.authenticateLogin(
                      ctx: context,
                      password: password!,
                      email: email!,
                      formkey: formKey));
            },
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text.rich(TextSpan(
          text: "Don't have an account? ",
          style: const TextStyle(color: Colors.grey, fontSize: 14),
          children: <TextSpan>[
            TextSpan(
                text: "Register here",
                style: const TextStyle(
                    color: Colors.grey, decoration: TextDecoration.underline),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    BlocProvider.of<SigninScreenBloc>(context)
                        .add(SigninScreenEvent.goToRegisterPage(
                      ctx: context,
                    ));
                  }),
          ],
        )),
      ],
    );
  }

  Column _inputFields(BuildContext context) {
    return Column(
      children: [
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
            if (RegExp(
                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                .hasMatch(val!)) {}
            return RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(val)
                ? null
                : "Please enter a valid email";
          },
        ),
        const SizedBox(height: 15),
        TextFormField(
          style: TextStyle(color: Colors.grey),
          obscureText: true,
          decoration: InputDecoration(
              labelStyle: TextStyle(color: Colors.grey),
              labelText: "Password",
              prefixIcon: Icon(
                Icons.lock,
                color: Theme.of(context).primaryColor,
              )),
          validator: (val) {
            if (val!.length < 6) {
              return "Password must be at least 6 characters";
            } else {
              password = val;
              return null;
            }
          },
          onChanged: (val) {
            password = val;
          },
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Column _headder() {
    return Column(
      children: [
        SvgPicture.asset("assets/logo.svg"),
        SizedBox(
          height: 25,
        ),
        const Text(
          "Women Safety SOS Application",
          style: TextStyle(
              fontSize: 35, fontWeight: FontWeight.bold, color: Colors.grey),
        ),
        const SizedBox(height: 20),
        const Text("Login now to see what they are talking!",
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.w400, color: Colors.grey)),
      ],
    );
  }
}
