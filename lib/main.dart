// ignore_for_file: unused_local_variable

import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flightbooking/locator.dart';
import 'package:flightbooking/pages/dashboard.dart';
import 'package:flightbooking/services/authenticationServices.dart';
import 'package:flightbooking/signIn%20and%20SignUp/middle.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'models/user_model.dart';

//import 'home_page.dart';

Future<void> main()async{
  WidgetsFlutterBinding.ensureInitialized();
  setUpLocator();
await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<UserModel>.value(
          initialData: UserModel(add: '', email: '', name: '', number: '', pincode: '', uid: '', username: ''),
          value: locator<AuthenticationServices>().userModelStream.stream,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Middle(),
      ),
    );
  }
}