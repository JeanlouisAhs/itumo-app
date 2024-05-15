import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_3.dart';

class HumanConversation extends StatelessWidget {
  List<Map<String, String>> _messages = [
    {'text': 'jdoonu mi ɖo fi wenu ? ', 'sender': 'person1'},
    {'text': ' yovosu jaye lε ɔ gbe bε u blo ma sɔ ', 'sender': 'person2'},
    {'text': 'ɖobosu yovosu jaye lε ɔ gbea', 'sender': 'person1'},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: _messages.length,
            itemBuilder: (BuildContext context, int index) {
              return _buildMessage(_messages[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildMessage(Map<String, String> message) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment:
        message['sender'] == 'person1' ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: Color(0xFF058ED9),
            child: Icon(Icons.person),
          ),
          SizedBox(
            width: 8.0,
          ),
          ChatBubble(
            clipper: ChatBubbleClipper3(type: message['sender'] == 'person1'
                ? BubbleType.sendBubble
                : BubbleType.receiverBubble),
            margin: EdgeInsets.only(top: 20),
            backGroundColor: message['sender'] == 'person1'
                ? Colors.blueAccent
                : Colors.grey[300],
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                message['text']!,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
