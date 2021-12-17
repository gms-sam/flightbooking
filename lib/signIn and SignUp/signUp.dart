// ignore: file_names


import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flightbooking/locator.dart';
import 'package:flightbooking/models/user_model.dart';
import 'package:flightbooking/services/authenticationServices.dart';
import 'package:flightbooking/signIn%20and%20SignUp/signIn.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late String _email, _password, _number, _add, _name,_username,_pincode;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AuthenticationServices authenticationServices =
      locator<AuthenticationServices>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey, 
        title: Text("SignUp"),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 60,),
                InkWell(
                  onTap: (){pickImage();},
                  child: Container(
                    height: 80,
                    width: 80,
                    // decoration: BoxDecoration(
                    //  // color: Colors.black,
                    //   borderRadius: BorderRadius.circular(50)
                    // ),
                    child: image!=null?Image.file(image!):Image.network("https://cdn3.iconfinder.com/data/icons/photo-tools/65/select-512.png"),
                  ),
                ),
                SizedBox(height: 20,),
                TextFormField(
                  // ignore: missing_return
                  validator: (input) {
                    if (input!.isEmpty) {
                      return "Please Enter a Email";
                    }
                    if (!input.endsWith("@gmail.com")) {
                      return "Email Should end with @gmail.com";
                    }
                    if (input.startsWith(RegExp(r'[0-9]'))) {
                      return "Email should start with Alphabate";
                    }
                    if (input.startsWith(" ")) {
                      return "Email should not start with blank space";
                    }
                    if (input.endsWith(" ")) {
                      return "Email should not end with blank space";
                    }
                    if (input.contains(" ")) {
                      return "Email is having blank space";
                    }
                  },
                  onSaved: (input) => _email = input!,
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.email,
                        color: Colors.blueGrey,
                      ),
                      labelText: "Email"),
                ),
                TextFormField(
                  // ignore: missing_return
                  validator: (input) {
                    if (input!.isEmpty) {
                      return "Please Enter a password";
                    }
                    if (input.length < 6) {
                      return "Password must be more thn 6 character";
                    }
                  },
                  onSaved: (input) => _password = input!,
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.code,
                        color: Colors.blueGrey,
                      ),
                      labelText: "password"),
                  obscureText: true,
                ),
                TextFormField(
                  // ignore: missing_return
                  validator: (input) {
                    if (!input!.contains(" ")) {
                      return "Please Enter Your Full Name";
                    }
                    if (input.isEmpty) {
                      return "Please Enter Your Name";
                    }
                  },
                  onSaved: (input) => _name = input!,
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.person,
                        color: Colors.blueGrey,
                      ),
                      labelText: "Full Name"),
                ),
                TextFormField(
                  // ignore: missing_return
                  validator: (input) {
                    if (input!.isEmpty) {
                      return "Please Enter Your User Name";
                    }
                  },
                  onSaved: (input) => _username = input!,
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.person,
                        color: Colors.blueGrey,
                      ),
                      labelText: "User Name"),
                ),
                TextFormField(
                  // ignore: missing_return
                  validator: (input) {
                    if (input!.isEmpty) {
                      return "Please Enter Your Address";
                    }
                    if (!input.contains(" ")) {
                      return "Please Enter Your Full Address";
                    }
                    if (input.length < 15) {
                      return "Please Enter Full Address";
                    }
                  },
                  onSaved: (input) => _add = input!,
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.location_on,
                        color: Colors.blueGrey,
                      ),
                      labelText: "Address"),
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  // ignore: missing_return
                  validator: (input) {
                    if (input!.isEmpty) {
                      return "Please Enter Your PinCode";
                    }
                    if (input.length < 6) {
                      return "PinCode is not valid";
                    }
                  },
                  onSaved: (input) => _pincode = input!,
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.location_on,
                        color: Colors.blueGrey,
                      ),
                      labelText: "PinCode"),
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  // ignore: missing_return
                  validator: (input) {
                    if (input!.isEmpty) {
                      return "Please Enter Your Mobile Number";
                    }
                    if (input.length < 10) {
                      return "Number Should be 10 digit";
                    }
                    if (input.contains(RegExp(r'[A-Z]'))) {
                      return "Invalid Number";
                    }
                    if (input.contains(RegExp(r'[a-z]'))) {
                      return "Number Should be in numeric form";
                    }
                    if (input.length > 10) {
                      return "Number Should be 10 digit";
                    }
                    if (input.startsWith(" ")) {
                      return "Number should not start with blank space";
                    }
                    if (input.endsWith(" ")) {
                      return "Number should not end with blank space";
                    }
                    if (input.contains(" ")) {
                      return "Number is having blank space";
                    }
                    if (input.startsWith(RegExp(r'[0-5]'))) {
                      return "The Start digit of number should be between 6 - 9";
                    }
                  },
                  onSaved: (input) => _number = input!,
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.phone,
                        color: Colors.blueGrey,
                      ),
                      labelText: "Number"),
                ),
                SizedBox(
                  height: 60,
                ),
                InkWell(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 33, vertical: 7),
                    height: 30,
                    width: 110,
                    decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(15)),
                    child: Text("Sign Up"),
                  ),
                  onTap: signUp,
                ),
                SizedBox(
                  height: 30,
                ),
                InkWell(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 33, vertical: 7),
                    height: 30,
                    width: 110,
                    decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(15)),
                    child: Text("Sign In"),
                  ),
                  onTap: navigateToSignIn,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> signUp() async {
    final formState = _formKey.currentState;
    if (formState!.validate()) {
      formState.save();
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: _email, password: _password);
        User? user = userCredential.user;
        if (user != null) {
          UserModel userModel = UserModel(
              add: _add,
              email: _email,
              number: _number,
              uid: user.uid,
              name: _name, pincode: _pincode, username: _username);
          await FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .set(userModel.toMap());
          authenticationServices.firebaseUserStream.add(user);
          authenticationServices.userModelStream.add(userModel);
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => SignIn()));
        } else {
          return;
        }
      } catch (e) {
      }
    }
  }

  void navigateToSignIn() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => SignIn()));
  }
  File? image;
  Future pickImage() async{
   try{
     final image =  await ImagePicker().pickImage(source: ImageSource.gallery);
   if(image == null)return;
   final imageTemporary = File(image.path);
   setState(() {
     this.image = imageTemporary;
   });
   }on PlatformException catch(e){
     print("Failed to pick image : $e");
   }
  }
}
