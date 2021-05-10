import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NewMessage extends StatefulWidget {
  @override
  _NewMessageState createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  final _controller = new TextEditingController();
  var _enteredMessage = '';

  void _sendMessage() async {
    FocusScope.of(context).unfocus();
    // ignore: await_only_futures
    final user = await FirebaseAuth.instance.currentUser;
    final userData = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();
    FirebaseFirestore.instance.collection('chat').add({
      'text': _enteredMessage,
      'createdAt': Timestamp.now(),
      'userId': user.uid,
      'username': userData['username']
    });
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return IconTheme(
      data: IconThemeData(color: Colors.orange[900]),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          //color:Colors.grey,
         decoration:  BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(70),
        ),
          child: Row(
            children: <Widget>[
                IconButton(
                alignment: Alignment(0.0, 0.0),
                icon:  Icon(Icons.face),
                color: Colors.orange,
                onPressed:(){},
              ),
              Expanded(
                child: TextField(
                  cursorColor: Colors.orange,
                  cursorWidth: 4.0,
                  controller: _controller,
                  decoration: InputDecoration.collapsed(
                      hintText: "Type your message..."),
                  onChanged: (value) {
                    setState(() {
                      _enteredMessage = value;
                    });
                  },
                ),
              ),
              IconButton(
                color: Colors.orange,
                icon: Icon(Icons.send,),
                onPressed: _enteredMessage.trim().isEmpty ? (){} : _sendMessage,
              )
            ],
          ),
        ),
      ),
    );
  }
}
