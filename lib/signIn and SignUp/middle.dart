import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flightbooking/models/user_model.dart';
import 'package:flightbooking/pages/dashboard.dart';
import 'package:flightbooking/pages/home_page.dart';
import 'package:flightbooking/signIn%20and%20SignUp/signIn.dart';
import 'package:flutter/material.dart';

class Middle extends StatefulWidget {
  @override
  _MiddleState createState() => _MiddleState();
}

class _MiddleState extends State<Middle> {
  Future<UserModel> getUser(User user) async {
    DocumentSnapshot<Map<String,dynamic>> documentSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();
    UserModel userModel = UserModel.fromMap(documentSnapshot.data()!);
    return userModel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return FutureBuilder<UserModel>(
              future: getUser(snapshot.data!),
              builder: (context, userSnapshot) {
                if (snapshot != null && snapshot.hasData) {
                  return Dashboard();
                } else {
                  return Scaffold(
                    body: Center(child: CircularProgressIndicator()),
                  );
                }
              },
            );
          } else {
            return SignIn();
          }
        },
      ),
    );
  }
}
