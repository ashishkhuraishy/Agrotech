import 'package:agrotech/Screens/home/camera.dart';
import 'package:agrotech/Screens/home/feeds.dart';
import 'package:agrotech/Screens/home/location.dart';
import 'package:agrotech/Screens/home/notifications.dart';
import 'package:agrotech/Screens/home/profile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _index = 0;
  PageController _pageController = new PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "AGROTECH",
          style: GoogleFonts.ubuntu(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Icon(Icons.chat, color: Colors.black,),
          )
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (val) => setState(() => _index = val),
        children: <Widget>[
          Feeds(),
          Notifications(),
          Camera(),
          Location(),
          Profile(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 32.0,
        items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.featured_play_list),
          title: Text("")
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          title: Text("")
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.camera_alt),
          title: Text("")
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.location_on),
          title: Text("")
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          title: Text("")
        ),
      ],
      currentIndex: _index,
      onTap: (val) {
        setState(() => _index = val);
        _pageController.animateTo(val.toDouble(), duration: Duration(milliseconds: 50), curve: Curves.easeIn);
      },
      unselectedItemColor: Colors.black,
      selectedItemColor: Colors.green,),
    );
  }
}
