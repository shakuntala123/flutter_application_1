import 'package:flutter/material.dart';
import 'MusicScreen.dart';
import 'MusicUI1.dart';
import 'MusicUI2.dart';

class MyMusic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.black87,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            colors: [
              Colors.black87,
              Colors.brown[700],
              Colors.black87,
              Colors.brown[700],
            ],
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView(
          children: <Widget>[
            Container(
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'MUSIC  PLAYLIST',
                    style: TextStyle(
                        letterSpacing: 3,
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Colors.orange),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Divider(
              thickness: 2,
              color: Colors.orange,
            ),
            SizedBox(
              height: 30,
            ),
            ListTile(
              title: Text('Dynamite',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w800)),
              subtitle: Text('BTS',
                  style: TextStyle(
                      color: Colors.grey.shade400,
                      fontWeight: FontWeight.w500)),
              leading: Icon(Icons.audiotrack, color: Colors.orange, size: 30),
              trailing: IconButton(
                icon: Icon(
                  Icons.play_circle_filled_rounded,
                  color: Colors.orange,
                  size: 40,
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => Music()),
                  );
                },
              ),
            ),
            Divider(
              thickness: 1,
              color: Colors.white,
            ),
            ListTile(
              title: Text('Fix You',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w800)),
              subtitle: Text('ColdPlay',
                  style: TextStyle(
                      color: Colors.grey.shade400,
                      fontWeight: FontWeight.w500)),
              leading: Icon(Icons.audiotrack, color: Colors.orange, size: 30),
              trailing: IconButton(
                icon: Icon(
                  Icons.play_circle_filled_rounded,
                  color: Colors.orange,
                  size: 40,
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => Music1()),
                  );
                },
              ),
            ),
            Divider(
              thickness: 1,
              color: Colors.white,
            ),
            ListTile(
              title: Text('Lilac',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w800)),
              subtitle: Text('IU',
                  style: TextStyle(
                      color: Colors.grey.shade400,
                      fontWeight: FontWeight.w500)),
              leading: Icon(Icons.audiotrack, color: Colors.orange, size: 30),
              trailing: IconButton(
                icon: Icon(
                  Icons.play_circle_filled_rounded,
                  color: Colors.orange,
                  size: 40,
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => Music2()),
                  );
                },
              ),
            ),
            Divider(
              thickness: 1,
              color: Colors.white,
            ),
            ListTile(
              title: Text('Attention',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w800)),
              subtitle: Text('Charlie Puth',
                  style: TextStyle(
                      color: Colors.grey.shade400,
                      fontWeight: FontWeight.w500)),
              leading: Icon(Icons.audiotrack, color: Colors.orange, size: 30),
              trailing: IconButton(
                icon: Icon(
                  Icons.play_circle_filled_rounded,
                  color: Colors.orange,
                  size: 40,
                ),
                onPressed: () {},
              ),
            ),
            Divider(
              thickness: 1,
              color: Colors.white,
            ),
            ListTile(
              title: Text('Eight',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w800)),
              subtitle: Text('IU',
                  style: TextStyle(
                      color: Colors.grey.shade400,
                      fontWeight: FontWeight.w500)),
              leading: Icon(Icons.audiotrack, color: Colors.orange, size: 30),
              trailing: IconButton(
                icon: Icon(
                  Icons.play_circle_filled_rounded,
                  color: Colors.orange,
                  size: 40,
                ),
                onPressed: () {},
              ),
            ),
            Divider(
              thickness: 1,
              color: Colors.white,
            ),
            ListTile(
              title: Text('DNA',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w800)),
              subtitle: Text('BTS',
                  style: TextStyle(
                      color: Colors.grey.shade400,
                      fontWeight: FontWeight.w500)),
              leading: Icon(Icons.audiotrack, color: Colors.orange, size: 30),
              trailing: IconButton(
                icon: Icon(
                  Icons.play_circle_filled_rounded,
                  color: Colors.orange,
                  size: 40,
                ),
                onPressed: () {},
              ),
            ),
            Divider(
              thickness: 1,
              color: Colors.white,
            ),
            ListTile(
              title: Text('Enna Sona',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w800)),
              subtitle: Text('Arijit Singh',
                  style: TextStyle(
                      color: Colors.grey.shade400,
                      fontWeight: FontWeight.w500)),
              leading: Icon(Icons.audiotrack, color: Colors.orange, size: 30),
              trailing: IconButton(
                icon: Icon(
                  Icons.play_circle_filled_rounded,
                  color: Colors.orange,
                  size: 40,
                ),
                onPressed: () {},
              ),
            ),
            Divider(
              thickness: 1,
              color: Colors.white,
            ),
            ListTile(
              title: Text('Vaaste',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w800)),
              subtitle: Text('Dhvani Bhanushali',
                  style: TextStyle(
                      color: Colors.grey.shade400,
                      fontWeight: FontWeight.w500)),
              leading: Icon(Icons.audiotrack, color: Colors.orange, size: 30),
              trailing: IconButton(
                icon: Icon(
                  Icons.play_circle_filled_rounded,
                  color: Colors.orange,
                  size: 40,
                ),
                onPressed: () {},
              ),
            ),
            Divider(
              thickness: 1,
              color: Colors.white,
            ),
            ListTile(
              title: Text('Dancing Queen',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w800)),
              subtitle: Text('ABBA',
                  style: TextStyle(
                      color: Colors.grey.shade400,
                      fontWeight: FontWeight.w500)),
              leading: Icon(Icons.audiotrack, color: Colors.orange, size: 30),
              trailing: IconButton(
                icon: Icon(
                  Icons.play_circle_filled_rounded,
                  color: Colors.orange,
                  size: 40,
                ),
                onPressed: () {},
              ),
            ),
            Divider(
              thickness: 1,
              color: Colors.white,
            ),
            ListTile(
              title: Text('Firework',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w800)),
              subtitle: Text('Katy Perry',
                  style: TextStyle(
                      color: Colors.grey.shade400,
                      fontWeight: FontWeight.w500)),
              leading: Icon(Icons.audiotrack, color: Colors.orange, size: 30),
              trailing: IconButton(
                icon: Icon(
                  Icons.play_circle_filled_rounded,
                  color: Colors.orange,
                  size: 40,
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => Music()),
            );
          },
          child: Icon(Icons.shuffle)),
    );
  }
}
