import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moshtra/utils/constants/colors.dart';
import '../../utils/custom_widgets/build_appbar.dart';
import 'ChatMessage/view.dart';
import 'controller/controller.dart';



class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  ChatBootController chatBootController = Get.put(ChatBootController());
  @override
  void initState() {
    super.initState();
    // Add a welcome message when the chatbot opens
    _addBotResponse('Welcome to moshtra customer service..');
  }

  void _handleSubmitted(String text) {
    chatBootController.textController.clear();
    ChatMessage message = ChatMessage(
      text: text,
      isUserMessage: true,
    );
    setState(() {
      chatBootController.messages.insert(0, message);
    });
    _generateBotResponse(text);
  }

  void _generateBotResponse(String userQuery) {
    setState(() {
      chatBootController.isBotTyping = true;
    });

    chatBootController. typingTimer = Timer(Duration(seconds: 2), () {

      if (userQuery.toLowerCase().contains('hello')) {
        chatBootController. botResponse = 'Hi there!';
      } else if (userQuery.toLowerCase().contains('how are you')) {
        chatBootController. botResponse = 'I am doing well, thank you!';
      } else if (userQuery.toLowerCase().contains('can you help me?')) {
        chatBootController. botResponse = 'Sure, what do you need?';
      } else if (userQuery.toLowerCase().contains('عامل اي')) {
        chatBootController. botResponse = 'الحمد لله وأنت؟';
      } else if (userQuery.toLowerCase().contains('what is the price of the nike shoes')) {
        chatBootController. botResponse = 'The price ranges from 200 to 800 pounds.';
      } else {
        chatBootController.  botResponse = "I can't understand.";
      }

      _addBotResponse( chatBootController.botResponse);
      setState(() {
        chatBootController.isBotTyping = false;
      });
    });
  }

  void _addBotResponse(String text) {
    ChatMessage message = ChatMessage(
      text: text,
      isUserMessage: false,
    );
    setState(() {
      chatBootController.messages.insert(0, message);
    });
  }

  @override
  void dispose() {
    chatBootController. typingTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grayish_blue,
      appBar:buildAppBar(title: 'Technical Support', arrowBackDisblay: true, SearchDisplay: false),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount:  chatBootController.messages.length,
              itemBuilder: (_, int index) =>  chatBootController.messages[index],
            ),
          ),

          Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 20.0,left: 30.0,right: 30.0),
              child: Container(
                decoration: BoxDecoration(color: AppColors.white,
                border: Border.all(color: AppColors.white,width: 2,),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: _buildTextComposer(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextComposer() {
    return Container(
      decoration: BoxDecoration(color: AppColors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      margin: EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        children: <Widget>[
          Flexible(
            child: TextField(
              controller: chatBootController.textController,
              onSubmitted: _handleSubmitted,
              decoration: InputDecoration.collapsed(
                hintText: 'Ask something',
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 4.0),
            child: IconButton(
              icon: chatBootController.isBotTyping
                  ? SizedBox(
                width: 24.0,
                height: 24.0,
                child: CircularProgressIndicator(
                  strokeWidth: 2.0,
                ),
              )
                  : Icon(Icons.send,color: AppColors.blue,),
              onPressed: chatBootController.isBotTyping
                  ? null
                  : () => _handleSubmitted( chatBootController.textController.text),
            ),
          ),
        ],
      ),
    );
  }
}

