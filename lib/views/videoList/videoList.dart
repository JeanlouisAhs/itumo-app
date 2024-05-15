import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:itumo/views/videoList/videoItem.dart';

import '../notifs/notifScreen.dart';
import '../widgets/topbar.dart';

class VideoList extends StatelessWidget {


  const VideoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: TopBarS(
        onNotificationPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => NotifScreen()));
        },

      ),
      backgroundColor: Color(0xFF01986D),
      body: VideoListView(),

    );
  }

}