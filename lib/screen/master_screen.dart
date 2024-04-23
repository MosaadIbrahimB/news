import 'package:flutter/material.dart';
import 'package:news_bottom/screen/tab/entertainment_tab.dart';
import 'package:news_bottom/screen/tab/health_tab.dart';
import 'package:news_bottom/screen/tab/sport_tab.dart';
import 'package:news_bottom/screen/tab/technology_tab.dart';

import 'tab/home_tab.dart';

class MasterScreen extends StatefulWidget {
  @override
  State<MasterScreen> createState() => _MasterScreenState();
}

class _MasterScreenState extends State<MasterScreen> {
  int currentIndex = 0;
  List<String> nameNews = [
    "Home",
    "Sports",
    "Health",
    "Technology",
    "Entertainment"
  ];
  List<Widget> masterBody = [
    const HomeTab(),
    const SportTab(),
    const HealthTab(),
    const TechTab(),
    const EntertainmentTab()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
          nameNews[currentIndex],
          style: const TextStyle(color: Colors.white),
        )),
        bottomNavigationBar: BottomNavigationBar(
            onTap: (value) {
              currentIndex = value;

              setState(() {});
            },
            currentIndex: currentIndex,
            selectedItemColor: Colors.blueAccent,
            unselectedItemColor: Colors.black38,
            showUnselectedLabels: true,
            showSelectedLabels: true,
            iconSize: 40,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.sports_football,
                  ),
                  label: "Sports"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.local_hospital,
                  ),
                  label: "Health"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.laptop_mac_rounded,
                  ),
                  label: "Technology"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.family_restroom,
                  ),
                  label: "Entertainment"),
            ]),
        body: masterBody[currentIndex]);
  }
}
