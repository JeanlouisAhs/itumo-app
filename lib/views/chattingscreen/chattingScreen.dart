import 'package:flutter/material.dart';
import 'package:itumo/views/chattingscreen/chatting.dart';

import 'package:itumo/views/places/statues.dart';

import '../notifs/notifScreen.dart';

import '../widgets/topbar.dart';

class ChattingScreen extends StatelessWidget {


  const ChattingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: TopBarS(
        onNotificationPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => NotifScreen()));
        },

      ),
      backgroundColor: Color(0xFFD3D3D3),
      body: ChatScreen(),

    );
  }

}
