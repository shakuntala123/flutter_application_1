import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter/material.dart';
import '../home_widget.dart';


class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => Home()),
    );
  }

  Widget _buildImage(String assetName) {
    return Align(
      child: Image.asset('assets/$assetName.png', width: 350.0),
      alignment: Alignment.bottomCenter,
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      pages: [
        PageViewModel(
          title: "Searching for the way to cheer up your mood??",
          body: "Here's our solution!!!... In Just Few Steps",
          image: _buildImage('img1'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Step 1",
          body: "Download The VisionSwing App.",
          image: _buildImage('img2'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Step 2",
          body: "Open your Camera to Help it Detect your Mood.",
          image: _buildImage('img3'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Step 3",
          body:
              "Choose the Song you want to Listen from the given Suggestions.",
          image: _buildImage('img4'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Step 4",
          body:
              "You can also choose the Chat Option, If you wanna share your Emotions",
          image: _buildImage('img5'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Now, Sit and Enjoy!!!",
          body:
              "Lighten Up your Mood and Relax.. In This Stressful Day-to-Day Life!!",
          image: _buildImage('img6'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: const Text('Skip'),
      next: const Icon(Icons.arrow_forward),
      done: const Text("Start ",
          style: TextStyle(
              fontWeight: FontWeight.w700, color: Colors.red, fontSize: 22)),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
