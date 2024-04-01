import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../ChatMessage/view.dart';

class ChatBootController extends GetxController {

  TextEditingController textController = TextEditingController();
  bool isBotTyping = false;
 final List<ChatMessage> messages = [];
  Timer? typingTimer;
  String botResponse = '';
// bool _isBotTyping = false;
// Timer? _typingTimer;

}