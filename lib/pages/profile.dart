import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flightbooking/models/user_model.dart';
import 'package:flightbooking/pages/edit_profile.dart';
import 'package:flightbooking/signIn%20and%20SignUp/signIn.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  FirebaseAuth user = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
              child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(icon: Icon(Icons.edit,color: Colors.blueGrey,), onPressed: (){
          //        Navigator.push(context, MaterialPageRoute(builder: (context)=>EditProfile()));
                })
              ],
            ),
            SizedBox(height: 60,),


            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 150,
                  width: 150,
                  child: Image.network('https://static.india.com/wp-content/uploads/2019/12/FLIGHTS.jpg',
                  fit: BoxFit.cover,
                  )
                ),
              ],
            ),


            SizedBox(height: 50,),
            StreamBuilder<DocumentSnapshot<Map<String,dynamic>>>(
            stream: FirebaseFirestore.instance.collection("users").doc(user.currentUser!.uid).snapshots(),
              builder: (context, snapshot){
                if(snapshot!=null&&snapshot.hasData){
                UserModel userModel = UserModel.fromMap(snapshot.data!.data()!);


                  return Column(
                    children: [


                      ListTile(
                        leading: Icon(Icons.person),
                        title: Text("Name"),
                     subtitle: Text(userModel.name),
                      ),


                       ListTile(
                        leading: Icon(Icons.person),
                        title: Text("User"),
                     subtitle: Text(userModel.username),
                      ),



                      ListTile(
                        leading: Icon(Icons.email),
                        title: Text("Email"),
                     subtitle: Text(userModel.email),
                      ),



                      ListTile(
                        leading: Icon(Icons.location_on),
                        title: Text("Address"),
                        subtitle: Row(
                          children: [
                            Text(userModel.add),
                            Text( userModel.pincode)
                          ],
                        ),
                      ),



                      ListTile(
                        leading: Icon(Icons.phone),
                        title: Text("Contact Number"),
                        subtitle: Text(userModel.number),
                      ),

                      ListTile(
                        leading: Icon(Icons.logout_outlined),
                        title: Text("LogOut"),
                        onTap: (){
                          FirebaseAuth.instance.signOut().then((value) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignIn())));
                        },
                      )

                    ],
                  );
                }

                else{
                return Center(child: CircularProgressIndicator(),);
                }
              },
            )


          ],
        ),
      ),
    );
  }
}