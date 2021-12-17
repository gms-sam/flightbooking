// ignore: file_names
// ignore: file_names
// ignore: file_names
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flightbooking/models/user_model.dart';
import 'package:flightbooking/services/service.dart';

class AuthenticationServices extends Services{
  AuthenticationServices(){
    isLoggedIn();
  }
 
  StreamController<User> firebaseUserStream = StreamController<User>();
  StreamController<UserModel> userModelStream = StreamController<UserModel>();

  isLoggedIn() async{
    getUser();
    if(user == null ){
      firebaseUserStream.add(user);
    }else{
      DocumentSnapshot<Map<String,dynamic>> doc = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
      if(doc.exists){
        UserModel userModel = UserModel.fromMap(doc.data()!);
        userModelStream.add(userModel);
      }else{
        UserModel userModel = UserModel(
          uid: "",
          add: "",
           email: "",
           name: "",
           number: "", pincode: '', username: ''
        );
        doc.reference.set(userModel.toMap());
        userModelStream.add(userModel);
      }

    }
  }
}