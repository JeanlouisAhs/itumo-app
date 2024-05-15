import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../videoList/videoList.dart';
import '../widgets/bottomnavbar.dart';



class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      Get.to(const MyBottomNav());
    });

    return Scaffold(
      backgroundColor: Color(0xFF01986D),
      body: Center(
        child: Image.asset('assets/images/end-removebg-preview.png'),
      ),
    );
  }
}
