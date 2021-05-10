import 'dart:ui';

import 'package:flutter/material.dart';
import 'Chat/chat_screen.dart';
import 'Music/pages/root_app.dart';
import 'Screen/DrawerContent.dart';
import 'face_detection.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    MyApp(),
    FaceDetection(),
    ChatScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    DrawerContent drawerItems = DrawerContent(context: context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            iconSize: 30.0,
            icon: Icon(Icons.help_outline),
            onPressed: () => _about(context),
          ),
        ],
        title: Text(
          'VisionSwing',
          style: TextStyle(
              fontWeight: FontWeight.w700, color: Colors.black, fontSize: 25),
        ),
      ),
      drawer: Drawer(
        child: drawerItems,
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.audiotrack,
              size: 40,
            ),
            // ignore: deprecated_member_use
            title: Text('Music'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.camera_alt_outlined,
              size: 40,
            ),
            // ignore: deprecated_member_use
            title: Text('Camera'),
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.chat,
                size: 40,
              ),
              // ignore: deprecated_member_use
              title: Text('Chat'))
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}

void _about(BuildContext context) {
  showDialog(
    context: context,
    builder: (_) => Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            title: Text('VisionSwing',
                style: TextStyle(
                  color: Colors.orange[900],
                  fontSize: 23,
                  fontWeight: FontWeight.w700,
                )),
            subtitle: Text('- Team VisionSwing'),
            trailing: IconButton(
              icon: Icon(Icons.close),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          Flexible(
            fit: FlexFit.loose,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    'VisionSwing is an initiative in dealing with your mood in day-to-day stressful life. It allows you to change your mood and help you cheer up.\n\nMusic speaks our mind when even words can not, it will heal you.\n\nMake one Step to Swing your Mind!!!',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  Container(height: 15),
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}
