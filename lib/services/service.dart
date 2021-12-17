import 'package:firebase_auth/firebase_auth.dart';

class Services{
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  late User user;
  getUser(){
    return user = firebaseAuth.currentUser!;
  }
}