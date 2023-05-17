import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:lucidplus_chat_app/infrastructure/global_database/firebase/database_services.dart';

abstract class IFirebaseAuthenticateRepo {
  Future registerUserWithEmailAndPassword(
      String name, String email, String password);
}

class FirebaseAuthImpl implements IFirebaseAuthenticateRepo {
  final firebaseAuthInstance = FirebaseAuth.instance;

  @override
  registerUserWithEmailAndPassword(
      String name, String email, String password) async {
    try {
      User user = (await firebaseAuthInstance.createUserWithEmailAndPassword(
              email: email, password: password))
          .user!;

      if (user != null) {
        await DatabaseService(uid: user.uid).updateUserData(name, email);
        return true;
      } else {
        return false;
      }
      
    } on FirebaseAuthException catch (e) {
      log(e.toString());
      return e;
    }
  }
}
