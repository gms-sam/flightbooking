import 'package:flightbooking/models/booking_model.dart';
import 'package:flightbooking/pages/smry.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<BookingModel> booking =[
    BookingModel(from: "mumbai",to: "delhi",cost: "3000",isSeat: true,dateTime: "18/12/2021",id: 1),
    BookingModel(from: "delhi",to: "mumbai",cost: "2500",isSeat: true,dateTime: "18/12/2021",id: 2),
    BookingModel(from: "surat",to: "delhi",cost: "2000",isSeat: true,dateTime: "18/12/2021",id: 3),
    BookingModel(from: "surat",to: "mumbai",cost: "1500",isSeat: true,dateTime: "18/12/2021",id: 4),
    BookingModel(from: "jaipur",to: "delhi",cost: "3500",isSeat: true,dateTime: "18/12/2021",id: 5),
    BookingModel(from: "mumbai",to: "jaipur",cost: "2700",isSeat: true,dateTime: "19/12/2021",id: 6),
  ];

  List<BookingModel> selectedFlight = [
    BookingModel(from: "mumbai",to: "delhi",cost: "3000",isSeat: false,dateTime: "18/12/2021",id: 1),
    BookingModel(from: "delhi",to: "mumbai",cost: "2500",isSeat: false,dateTime: "18/12/2021",id: 2),
    BookingModel(from: "surat",to: "delhi",cost: "2000",isSeat: false,dateTime: "18/12/2021",id: 3),
    BookingModel(from: "surat",to: "mumbai",cost: "1500",isSeat: false,dateTime: "18/12/2021",id: 4),
    BookingModel(from: "jaipur",to: "delhi",cost: "3500",isSeat: false,dateTime: "18/12/2021",id: 5),
    BookingModel(from: "mumbai",to: "jaipur",cost: "2700",isSeat: false,dateTime: "19/12/2021",id: 6),
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemCount: booking.length,
          itemBuilder: (BuildContext context, int index){
          return bookingItem(booking[index].from,booking[index].to,booking[index].cost,booking[index].isSeat,index,booking[index].dateTime,booking[index].id);
        }),
      ),
    );
  }

  Widget bookingItem(String from,String to,String cost,bool isSeat, int index, String dateTime, int id){
    return InkWell(
      onTap: (){
        setState(() {
            //  booking[index].isSeat = !booking[index].isSeat;
            
             if(booking[index].isSeat== true){
                selectedFlight.add(BookingModel(from: from, to: to, cost: cost, isSeat: true,dateTime: dateTime,id: id));
              }
              else if(booking[index].isSeat == false){
                selectedFlight.removeWhere((element) => element.id == booking[index].id);
              }
              });
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Smry(from: selectedFlight[index].from,to: selectedFlight[index].to,date: selectedFlight[index].dateTime,)));
      },
      child: Container(
        decoration: BoxDecoration(
           color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(15),
               //   border: Border.all(color: Colors.black)
                ),
       
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(20),
        //height: 110,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.black)
                ),
                padding: EdgeInsets.all(10), child: Center(child: Text("From : $from",style: TextStyle(fontSize: 30),))),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.black)
                ),
                padding: EdgeInsets.all(10),child: Center(child: Text(" To : $to",style: TextStyle(fontSize: 30)))),
             
            ],
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Price : $cost",style: TextStyle(fontSize: 20),),
              Text("Date : $dateTime",style: TextStyle(fontSize: 20),),
            ],
          )
          // IconButton(onPressed: (){
          //   setState(() {
          //    // booking[index].isSeat = !booking[index].isSeat;
          //     if(booking[index].isSeat== true){
          //       selectedFlight.add(BookingModel(from: from, to: to, cost: cost, isSeat: true,dateTime: dateTime,id: id));
          //     }else if(booking[index].isSeat == false){
          //       selectedFlight.removeWhere((element) => element.id == booking[index].id);
          //     }
          //   });
          //   // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Smry(from: selectedFlight[index].from,to: selectedFlight[index].to,date: selectedFlight[index].dateTime,)));
          // }, icon: isSeat?Icon(Icons.check_circle_outline,color: Colors.grey,):Icon(Icons.check_circle,color: Colors.green[700],))
          ],
        ),
      ),
    );
  }
}
