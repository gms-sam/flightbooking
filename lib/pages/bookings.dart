import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Booking extends StatefulWidget {
  
  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
   String? from;

  late String to;

  late String date;

//Booking({required this.from,required this.to,required this.date});
  void val()async{
    FlutterSecureStorage flutterSecureStorage = await FlutterSecureStorage();
    from = await flutterSecureStorage.read(key: "from");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.black),borderRadius: BorderRadius.circular(15)),
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(20),
        child: ListTile(
          title: Text("Mumbai To Delhi",style: TextStyle(fontSize: 20),),
          subtitle: Text("18/12/2021"),
          trailing: IconButton(onPressed: ()async{
            setState(() {
              FlutterSecureStorage flutterSecureStorage = FlutterSecureStorage();
              flutterSecureStorage.delete(key: "from");
              flutterSecureStorage.delete(key: "to");
              flutterSecureStorage.delete(key: "date");
            });
          }, icon: Icon(Icons.delete)),
        )
      ),
    );
  }
}