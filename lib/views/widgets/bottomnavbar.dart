
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:itumo/views/chattingscreen/chatting.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import '../chattingscreen/chattingScreen.dart';
import '../places/statuesView.dart';
import '../search/serachbar.dart';
import '../videoList/videoList.dart';




class MyBottomNav extends StatefulWidget {
  const MyBottomNav({Key? key}) : super(key: key);

  @override
  State<MyBottomNav> createState() => MyBottomNavState();
}

class MyBottomNavState extends State<MyBottomNav> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getSelectedWidget(index: _currentIndex),
      bottomNavigationBar: SalomonBottomBar(
        backgroundColor: Color(0xFF01986D),
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: Text("Accueil"),
            selectedColor: Colors.white,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.question_answer),
            title: Text("Chat"),
            selectedColor: Colors.white,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.search),
            title: Text("Rechercher"),
            selectedColor: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget getSelectedWidget({required int index}) {
    switch (index) {
      case 0:
        return VideoList();
      case 1:
        return ChattingScreen();
      case 2:
        return CustomSearchBar();
      default:
        return VideoList();
    }
  }
}
