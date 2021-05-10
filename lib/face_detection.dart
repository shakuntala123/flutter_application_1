import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';

import 'Music/MusicScreen.dart';

class FaceDetection extends StatefulWidget {
  @override
  _FaceDetectionState createState() => _FaceDetectionState();
}

class _FaceDetectionState extends State<FaceDetection> {
  ui.Image image;
  var smileProb;
  bool isLoading = false;
  // ignore: deprecated_member_use
  List<Rect> rect = List<Rect>();
  // ignore: deprecated_member_use
  List<Rect> eyesRect = List<Rect>();

  Future getImage(bool isCamera) async {
    File image;
    if (isCamera) {
      // ignore: deprecated_member_use
      image = await ImagePicker.pickImage(source: ImageSource.camera);
    } else {
      // ignore: deprecated_member_use
      image = await ImagePicker.pickImage(source: ImageSource.gallery);
    }
    var visionImage = FirebaseVisionImage.fromFile(image);

    setState(() {
      // ignore: deprecated_member_use
      rect = List<Rect>();
      isLoading = true;
    });

    var faceDetection =
        FirebaseVision.instance.faceDetector(FaceDetectorOptions(
      enableClassification: true,
      enableLandmarks: true,
      enableContours: true,
    ));

    List<Face> faces = await faceDetection.processImage(visionImage);
    for (Face f in faces) {
      rect.add(f.boundingBox);
      print(f.getContour(FaceContourType.allPoints));
      smileProb = f.smilingProbability;
    }
    loadImage(image).then((img) {
      setState(() {
        this.image = img;
      });
    });
  }

  Future<ui.Image> loadImage(File image) async {
    var img = await image.readAsBytes();
    return decodeImageFromList(img);
  }

  String detectSmile() {
    if (smileProb != null) {
      if (smileProb > 0.86) {
        return 'Big smile with teeth';
      } else if (smileProb > 0.8) {
        return 'Big Smile';
      } else if (smileProb > 0.5) {
        return 'Normal';
      } else
        return 'Sad';
    } else
      return '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Container(
                  child: FittedBox(
                    child: SizedBox(
                      width: image != null ? image.width.toDouble() : 500.0,
                      height: image != null ? image.height.toDouble() : 500.0,
                      child: CustomPaint(
                        painter: Painter(rect: rect, image: image),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              child: Text(
                '${detectSmile()}',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            Container(
              child: ButtonBar(
                alignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      if (isLoading == true) {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => Music()),
                        );
                      } else
                        return null;
                    },
                    child: Text(
                      'Music',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          FloatingActionButton(
            heroTag: null,
            onPressed: () {
              getImage(true);
            },
            tooltip: 'Camera',
            child: Icon(Icons.camera_alt),
          ),
          SizedBox(
            height: 20.0,
          ),
          FloatingActionButton(
            heroTag: null,
            onPressed: () {
              getImage(false);
            },
            tooltip: 'Gallery',
            child: Icon(Icons.folder),
          ),
        ],
      ),
    );
  }
}

class Painter extends CustomPainter {
  List<Rect> rect;
  ui.Image image;

  Painter({@required this.rect, @required this.image});

  @override
  void paint(ui.Canvas canvas, ui.Size size) {
    canvas.drawImage(image, Offset.zero, Paint());

    if (rect != null) {
      for (Rect rect in this.rect) {
        canvas.drawRect(
            rect,
            Paint()
              ..color = Colors.orange
              ..strokeWidth = 80.0
              ..style = PaintingStyle.stroke);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
