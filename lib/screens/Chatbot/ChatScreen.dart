import 'package:flutter/material.dart';

class ChatbotPage extends StatefulWidget {
  @override
  _ChatbotPageState createState() => _ChatbotPageState();
}

class _ChatbotPageState extends State<ChatbotPage> {
  bool _isUserOnline = true; // Assume user is online initially

  List<String> _questions = [
    "How to pay?",
    "Delivery time?",
    "Free shipping?",
    "Return policy?",
    "Track order?",
    "International shipping?",
    "Damaged item?",
    "Contact support?",
    "Security?",
  ];
  List<Map<String, String>> _chatHistory = [];
  Map<String, String> _questionResponses = {
    "How to pay?": "We accept credit cards, PayPal, and bank transfers.",
    "Delivery time?": "3-7 business days, depending on location.",
    "Free shipping?": "Yes, for orders over 50 pounds.",
    "Return policy?": "30-day return or exchange.",
    "Track order?": "Log in and go to 'Orders'.",
    "International shipping?": "Yes, with varying fees.",
    "Damaged item?": "Contact support for replacement.",
    "Contact support?": "support@example.com | +1 (800) 123-4567.",
    "Security?": "We use encryption for data security.",
  };

  @override
  void initState() {
    super.initState();
    _chatHistory.add({
      "sender": "Chatbot",
      "message": "Welcome to moshtra customer service.....",
    });
  }

  void _selectQuestion(String question) {
    setState(() {
      _questions.remove(question);
      _chatHistory.add({
        "sender": "User",
        "message": question,
      });
      _chatHistory.add({
        "sender": "Chatbot",
        "message": _questionResponses[question] ?? 'No response found',
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Technical Support',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 10),
              _isUserOnline
                  ? Icon(Icons.circle, color: Colors.green, size: 12) // Online indicator
                  : Icon(Icons.circle, color: Colors.grey, size: 12), // Offline indicator
            ],
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _questions.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => _selectQuestion(_questions[index]),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  _questions[index],
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                              Icon(Icons.arrow_forward_ios),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _chatHistory.length,
                itemBuilder: (context, index) {
                  final message = _chatHistory[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                    child: Align(
                      alignment: message["sender"] == "User" ? Alignment.centerRight : Alignment.centerLeft,
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: message["sender"] == "User" ? Colors.blue[200] : Colors.green[200],
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Text(
                          message["message"]!,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(ChatbotPage());
}
