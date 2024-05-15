import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_3.dart';
import 'package:http/http.dart' as http;
class ChatbotConversation extends StatefulWidget {
  @override
  _ChatbotConversationState createState() => _ChatbotConversationState();
}

class _ChatbotConversationState extends State<ChatbotConversation> {
  List<Map<String, String>> _messages = [];
  String _inputText = '';

  Future<void> _sendMessage() async {
    Map<String, String> message = {'text': _inputText, 'sender': 'user'};
    setState(() {
      _messages.add(message);
    });
    final response = await http.post(
      Uri.parse('YOUR_ENDPOINT_URL'),
      body: {'text': _inputText},
    );
    Map<String, String> botMessage = {
      'text': response.body,
      'sender': 'bot',
    };
    setState(() {
      _messages.add(botMessage);
      _inputText = '';
    });
  }

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
        Container(
          color: Colors.white,
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        _inputText = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Posez une question !',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.send),
                onPressed: _sendMessage,
              ),
            ],
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
        message['sender'] == 'user' ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          CircleAvatar(
            child: Icon(
              message['sender'] == 'bot' ? Icons.computer : Icons.person,
            ),
          ),
          SizedBox(
            width: 8.0,
          ),
          ChatBubble(
            clipper: ChatBubbleClipper3(type: message['sender'] == 'user'
                ? BubbleType.sendBubble
                : BubbleType.receiverBubble),
            margin: EdgeInsets.only(top: 20),
            backGroundColor: message['sender'] == 'user'
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
