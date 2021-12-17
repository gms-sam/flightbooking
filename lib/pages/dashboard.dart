import 'package:flightbooking/pages/bookings.dart';
import 'package:flightbooking/pages/profile.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';

class Dashboard extends StatefulWidget {

  @override
  _DashBoardState createState() => _DashBoardState();
}
class _DashBoardState extends State<Dashboard> {


int _selectedIndex = 1;
 List<Widget> _options = <Widget>[
  Booking(),
   HomePage(),
    Profile(),
  ];


  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.blue[500],
      appBar: AppBar(
        title: Text("Online Flight Ticket Booking"),
        backgroundColor: Colors.blueGrey,
      ),


      body: _options.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.toc_outlined),
                label: 'My Booking',
                backgroundColor: Colors.white
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                backgroundColor: Colors.white
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
              backgroundColor: Colors.white,
            ),
          ],
          type: BottomNavigationBarType.shifting,
         currentIndex: _selectedIndex,
          selectedItemColor: Colors.blueGrey,
          unselectedItemColor: Colors.grey,
          iconSize: 40,
          onTap: _onItemTap,
          elevation: 5
      ),


    );
  }
}