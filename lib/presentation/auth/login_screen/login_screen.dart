import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucidplus_chat_app/application/signin_screen_bloc/bloc/signin_screen_bloc.dart';

class LoginScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
        child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _headder(),
                _inputFields(context),
                _signIn(context),
              ],
            )),
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
          style: const TextStyle(color: Colors.black, fontSize: 14),
          children: <TextSpan>[
            TextSpan(
                text: "Register here",
                style: const TextStyle(
                    color: Colors.black, decoration: TextDecoration.underline),
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
          decoration: InputDecoration(
              labelText: "Email",
              prefixIcon: Icon(
                Icons.email,
                color: Theme.of(context).primaryColor,
              )),
          onChanged: (val) {},

          // check tha validation
          validator: (val) {
            if (RegExp(
                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                .hasMatch(val!)) {
              email = val;
            }
            return RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(val)
                ? null
                : "Please enter a valid email";
          },
        ),
        const SizedBox(height: 15),
        TextFormField(
          obscureText: true,
          decoration: InputDecoration(
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
          onChanged: (val) {},
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
        const Text(
          "LucidPlus Chat App",
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        const Text("Login now to see what they are talking!",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400)),
        Image.asset("assets/login.png"),
      ],
    );
  }
}
