import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../home_widget.dart';
import 'MusicPlaylist.dart';
import 'MusicUI.dart';
import 'MusicUI2.dart';

typedef void OnError(Exception exception);

class Music1 extends StatefulWidget {
  @override
  _Music1State createState() => new _Music1State();
}

class _Music1State extends State<Music1> {
  bool isHeartPressed = false;
  bool isPlayPressed = false;
  Duration _duration = new Duration();
  Duration _position = new Duration();
  AudioPlayer advancedPlayer;
  AudioCache audioCache;

  @override
  void initState() {
    super.initState();
    initPlayer();
  }

  void initPlayer() {
    advancedPlayer = new AudioPlayer();
    audioCache = new AudioCache(fixedPlayer: advancedPlayer);

    // ignore: deprecated_member_use
    advancedPlayer.durationHandler = (d) => setState(() {
          _duration = d;
        });

    // ignore: deprecated_member_use
    advancedPlayer.positionHandler = (p) => setState(() {
          _position = p;
        });
  }

  double setChanged() {
    Duration newDuration = Duration(seconds: 0);
    advancedPlayer.seek(newDuration);
    return 0.0;
  }

  String localFilePath;

  Widget slider() {
    return Slider(
        value: _position.inSeconds.toDouble(),
        min: 0.0,
        max: _duration.inSeconds.toDouble(),
        onChanged: (double value) {
          setState(() {
            seekToSecond(value.toInt());
            value = value;
          });
        });
  }

  void seekToSecond(int second) {
    Duration newDuration = Duration(seconds: second);

    advancedPlayer.seek(newDuration);
  }

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          left: 10,
          right: 10,
          top: 70,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Colors.pink[300],
              Colors.deepOrange[800],
              Colors.blueGrey[900],
            ],
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                   IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 30,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => Home()),
                        );
                      },
                    ),
                  Column(
                    children: <Widget>[
                      Text(
                        "VisionSwing",
                        style: TextStyle(
                          letterSpacing: 2,
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        "MUSIC",
                        style: TextStyle(
                          letterSpacing: 0.5,
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.more_vert,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => MyMusic()),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 60,
              ),
              Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset("assets/Coldplay.jpg"),
                ),
                width: 325,
              ),
              SizedBox(
                height: 100,
              ),
              Container(
                padding: EdgeInsets.only(left: 25, right: 25),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Fix You",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            wordSpacing: 0.2,
                          ),
                        ),
                        Text(
                          "Coldplay",
                          style: TextStyle(
                            color: Colors.grey.shade400,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            letterSpacing: 0.1,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      icon: (isHeartPressed == true)
                          ? Icon(
                              Icons.favorite,
                              color: Colors.white,
                              size: 30,
                            )
                          : Icon(
                              Icons.favorite,
                              color: Colors.redAccent[400],
                              size: 30,
                            ),
                      onPressed: () {
                        setState(() {
                          isHeartPressed =
                              (isHeartPressed == false) ? true : false;
                        });
                      },
                    ),
                  ],
                ),
              ),
              Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 5, right: 5),
                    width: double.infinity,
                    child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Colors.grey.shade600,
                        activeTickMarkColor: Colors.white,
                        thumbColor: Colors.white,
                        trackHeight: 3,
                        thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 5,
                        ),
                      ),
                      child: Slider(
                        value: (_position.inSeconds.toDouble() !=
                                _duration.inSeconds.toDouble())
                            ? _position.inSeconds.toDouble()
                            : setChanged(),
                        min: 0,
                        max: _duration.inSeconds.toDouble(),
                        onChanged: (double value) {
                          setState(() {
                            seekToSecond(value.toInt());
                            value = value;
                          });
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "${_position.inMinutes.toInt()}:${(_position.inSeconds % 60).toString().padLeft(2, "0")}",
                          style: TextStyle(
                            color: Colors.grey.shade400,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "${_duration.inMinutes.toInt()}:${(_duration.inSeconds % 60).toString().padLeft(2, "0")}",
                          style: TextStyle(
                            color: Colors.grey.shade400,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(left: 22, right: 22),
                width: double.infinity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(
                      Icons.shuffle,
                      color: Colors.grey.shade400,
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.skip_previous,
                        color: Colors.white,
                        size: 40,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => Music()),
                        );
                      },
                    ),
                    Container(
                      height: 90,
                      width: 90,
                      child: Center(
                        child: IconButton(
                          iconSize: 70,
                          alignment: Alignment.center,
                          icon: (isPlayPressed == true)
                              ? Icon(
                                  Icons.pause_circle_filled,
                                  color: Colors.white,
                                )
                              : Icon(
                                  Icons.play_circle_filled,
                                  color: Colors.white,
                                ),
                          onPressed: () {
                            setState(() {
                              isPlayPressed =
                                  isPlayPressed == false ? true : false;
                              if (isPlayPressed == true) {
                                audioCache.play('Coldplay.mp3');
                              } else {
                                advancedPlayer.pause();
                              }
                            });
                          },
                        ),
                      ),
                    ),
                    IconButton(
                        icon: Icon(
                          Icons.skip_next,
                          color: Colors.white,
                          size: 40,
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => Music2()),
                          );
                        }),
                    Icon(
                      Icons.repeat,
                      color: Colors.grey.shade400,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
