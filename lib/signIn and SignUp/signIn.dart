// ignore: file_names
// ignore: file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flightbooking/locator.dart';
import 'package:flightbooking/models/user_model.dart';
import 'package:flightbooking/pages/dashboard.dart';
import 'package:flightbooking/pages/home_page.dart';
import 'package:flightbooking/services/authenticationServices.dart';
import 'package:flightbooking/signIn%20and%20SignUp/signUp.dart';
import 'package:flutter/material.dart';


class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  late String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AuthenticationServices authenticationServices = locator<AuthenticationServices>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         backgroundColor: Colors.blueGrey,
         title: Text("Login"),
      ),


      body: Container(

        margin: EdgeInsets.all(15),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          children: [


            TextFormField(
            // ignore: missing_return
            validator: (input){
              if(input!.isEmpty){
                return "Please Enter a Email";
              }
              if(!input.endsWith("@gmail.com")){
                return "Email Should end with @gmail.com";
              }
            },
            onSaved: (input) => _email = input!,
            decoration: InputDecoration(
              icon: Icon(Icons.email,color: Colors.blueGrey,),
              labelText: "Emal"
            ),
            ),


            TextFormField(
            // ignore: missing_return
            validator: (input){
              if(input!.isEmpty){
                return "Please Enter a password";
              }
              if(input.length < 6){
                return "Your Password must be atleast 6 character";
              }
            },
            onSaved: (input) => _password = input!,
            decoration: InputDecoration(
              icon: Icon(Icons.code,color: Colors.blueGrey,),
              labelText: "Password",
              
            ),
            obscureText: true,
            ),


            SizedBox(height: 60,),

            InkWell(
                child: Container(
                padding: EdgeInsets.symmetric(horizontal: 33,vertical: 7),
                height: 30,
                width: 110,
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(15)
                ),
                child: 
                Text("Sign In"),
              ),

              onTap: signIn,

            ),


            SizedBox(height: 30,),

            InkWell(
                child: Container(
                padding: EdgeInsets.symmetric(horizontal: 33,vertical: 7),
                height: 30,
                width: 110,
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(15)
                ),
                child: 
                Text("Sign Up"),
              ),

              onTap: navigateToSignUp,

            )


          ],
        )),
      ),
    );
  }

  Future<void> signIn() async{
    final formState = _formKey.currentState;
    if(formState!.validate()){
      formState.save();
      try{
      // ignore: unused_local_variable
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
      User? user = userCredential.user;
      
      if(user!=null){
        DocumentSnapshot<Map<String,dynamic>> documentSnapshot = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
        UserModel userModel = UserModel.fromMap(documentSnapshot.data()!);
        authenticationServices.firebaseUserStream.add(user);
        authenticationServices.userModelStream.add(userModel);

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Dashboard()));
      }else{
        return;
      }
      }catch(e){
        // ignore: avoid_print
      }
    }
  }


  void navigateToSignUp(){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignUp()));

  }


}
