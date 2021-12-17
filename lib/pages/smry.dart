

import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flightbooking/pages/bookings.dart';
import 'package:flightbooking/pages/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';


class Smry extends StatelessWidget {
   @override
  
  late String from;
  late String to;
  late String date;

// ignore: use_key_in_widget_constructors
Smry({required this.from,required this.to,required this.date});

FirebaseAuth user = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height/3,
                child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS11ELZVVtAfW51pJy8kLM41Mx9XC0eLsGjBA&usqp=CAU",fit: BoxFit.cover,)),
              SizedBox(height: 40,),
              Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.all(20),
                width: double.infinity,
                //height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.black)
                ),
                child: Column(
                  children: [
                    Text("Passanger Name :",style: TextStyle(fontSize: 25),),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Text("From : $from",style: TextStyle(fontSize: 25)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("To : $to",style: TextStyle(fontSize: 25)),
                        Text("Date : $date",style: TextStyle(fontSize: 18))
                      ],
                    )
                  ],
                ),
              ),
              
              ElevatedButton(onPressed: ()async{
               // Booking(from: widget.from,to: widget.to,date: widget.date,);
                FlutterSecureStorage flutterSecureStorage = FlutterSecureStorage();
                flutterSecureStorage.write(key: "from", value: from);
                flutterSecureStorage.write(key: "to", value: to);
                flutterSecureStorage.write(key: "date", value: date);
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Dashboard()));
              }, child: Text("Book"))
            ],
          ),
        )
      ),
    );
  }
}