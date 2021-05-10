import 'package:flutter/material.dart';
import 'package:flutter_application_1/Auth/auth_screen.dart';
import 'package:url_launcher/url_launcher.dart';

import '../home_widget.dart';

class DrawerContent extends StatelessWidget {
  const DrawerContent({
    Key key,
    this.context,
  }) : super(key: key);

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    const drawerHeader = UserAccountsDrawerHeader(
      decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage('https://i.gifer.com/CGjn.gif')),
      ),
      accountName: Text(
        'VisionSwing',
        style: TextStyle(
            color: Colors.white, fontSize: 22.0, fontWeight: FontWeight.w600),
      ),
      accountEmail: Text(
        'Put Some Swing in Your Step',
        style: TextStyle(color: Colors.white, fontSize: 15.0),
      ),
      currentAccountPicture: CircleAvatar(
        backgroundImage:
            NetworkImage('https://www.linkpicture.com/q/icon_13.png'),
        backgroundColor: Colors.white,
      ),
    );
    final drawerItems = ListView(
      padding: const EdgeInsets.all(0),
      children: <Widget>[
        drawerHeader,
        Padding(
          padding: const EdgeInsets.only(left: 4.0),
          child: ListTile(
            leading: Icon(
              Icons.home,
              size: 35.0,
              color: Colors.orange,
            ),
            title: const Text(
              'Home',
              style: TextStyle(fontSize: 17.0),
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => Home()),
              );
            },
          ),
        ),
        const Divider(
          thickness: 2.0,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 4.0),
          child: ListTile(
            leading: Icon(
              Icons.home_work_rounded,
              size: 35.0,
              color: Colors.orange,
            ),
            title: const Text(
              'About Us',
              style: TextStyle(fontSize: 17.0),
            ),
            onTap: _howtoURl,
          ),
        ),
        const Divider(
          thickness: 2.0,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 4.0),
          child: ListTile(
            leading: Icon(
              Icons.feedback_outlined,
              size: 35.0,
              color: Colors.orange,
            ),
            title: const Text(
              'Feedback',
              style: TextStyle(fontSize: 17.0),
            ),
            onTap: _feedbackURL,
          ),
        ),
        const Divider(
          thickness: 2.0,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 4.0),
          child: ListTile(
            leading: Icon(
              Icons.help,
              size: 35.0,
              color: Colors.orange,
            ),
            title: const Text(
              'Help',
              style: TextStyle(fontSize: 17.0),
            ),
            onTap: _helpURL,
          ),
        ),
        const Divider(
          thickness: 2.0,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 4.0),
          child: ListTile(
            leading: Icon(
              Icons.logout,
              size: 35.0,
              color: Colors.orange,
            ),
            title: const Text(
              'Log Out',
              style: TextStyle(fontSize: 17.0),
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => AuthScreen()),
              );
            },
          ),
        ),
        const Divider(
          thickness: 2.0,
        ),
      ],
    );
    return drawerItems;
  }
}

_howtoURl() async {
  const url = 'https://craxycansir.wixsite.com/mysite';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_feedbackURL() async {
  const url =
      'https://docs.google.com/forms/d/e/1FAIpQLScjhFQHOTT_2McFIrx-aOfEAWwOLGl8R_OpHJpIdkdZgUmA3g/viewform?usp=sf_link';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_helpURL() async {
  const url =
      'https://docs.google.com/forms/d/e/1FAIpQLSf7-PtuVjj1WpdCJrAOnWk3T6YiE6fkyoJ3gMsWiunjKxvacA/viewform?usp=sf_link';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
