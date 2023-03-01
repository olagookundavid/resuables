import 'package:flutter/material.dart';

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);

//  Container(
//             decoration: kMessageContainerDecoration,
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: <Widget>[
//                 Expanded(
//                   child: TextField(
//                     controller: _messageTextController,
//                     decoration: kMessageTextFieldDecoration,
//                   ),
//                 ),

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter A Value',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

class ChatField extends StatefulWidget {
  const ChatField({super.key});

  @override
  State<ChatField> createState() => _ChatFieldState();
}

class _ChatFieldState extends State<ChatField> {
  TextEditingController controller = TextEditingController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        border: Border(
          bottom: BorderSide(color: Colors.grey, width: 2.0),
          left: BorderSide(color: Colors.grey, width: 2.0),
          right: BorderSide(color: Colors.grey, width: 2.0),
          top: BorderSide(color: Colors.grey, width: 2.0),
        ),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          filled: false,
          border: InputBorder.none,
          hintText: 'Type your message',
          hintStyle: const TextStyle(
            fontWeight: FontWeight.normal,
            fontFamily: 'Product_Sans',
          ),
        ),
        // cursorColor: kWhiteColor,
        style: const TextStyle(
          fontWeight: FontWeight.normal,
          fontFamily: 'Product_Sans',
        ),
      ),
    );
  }
}
