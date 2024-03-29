
import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';

class ChatMessage extends StatelessWidget {
  final String text;
  final bool isUserMessage;

  const ChatMessage({
    required this.text,
    required this.isUserMessage,
  });

  @override
  Widget build(BuildContext context) {
    final BorderRadius userBorderRadius = BorderRadius.only(
      topLeft: Radius.circular(16.0),
      bottomLeft: Radius.circular(16.0),
      topRight: Radius.circular(16.0),
    );
    final BorderRadius botBorderRadius = BorderRadius.only(
      topRight:Radius.circular(16.0),
      bottomRight: Radius.circular(16.0),
      topLeft: Radius.circular(16.0),
    );

    final Color userColor = AppColors.white;
    final Color botColor = AppColors.white;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment:
        isUserMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: CircleAvatar(
              backgroundImage: isUserMessage
                  ? AssetImage('assets/images/personAvatar.jpg')
                  : AssetImage('assets/images/bootAvatar.jpg'),
            ),
          ),
          Flexible(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: isUserMessage ? userBorderRadius : botBorderRadius,
                color: isUserMessage ? userColor : botColor,
              ),
              padding: const EdgeInsets.all(8.0),
              margin: isUserMessage
                  ? const EdgeInsets.only(right: 16.0)
                  : const EdgeInsets.only(left: 16.0),
              child: Text(
                text,
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}