import 'package:flutter/material.dart';

import 'chatbotconv.dart';
import 'humanconv.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(

      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          bottom: TabBar(
            indicatorColor: Color(0xFF058ED9),
            labelColor: Color(0xFF058ED9),
            tabs: [
              Tab(text: 'Chatbot'),
              Tab(text: 'Personne'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ChatbotConversation(),
            HumanConversation(),
          ],
        ),
      ),
    );
  }
}
