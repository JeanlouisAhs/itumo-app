import 'package:flutter/material.dart';

import '../widgets/topbar.dart';


class NotifScreen extends StatelessWidget {

  const NotifScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBarS(
        onNotificationPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const NotifScreen()));
        },

      ),
      backgroundColor: const Color(0xFF2176AE),

    );
  }
}
