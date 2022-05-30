import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_home_app_ui/constants/text_theme.dart';

class SpeakerDemoScreen extends StatefulWidget {
  const SpeakerDemoScreen({Key? key}) : super(key: key);

  @override
  State<SpeakerDemoScreen> createState() => _SpeakerDemoScreenState();
}

class _SpeakerDemoScreenState extends State<SpeakerDemoScreen> {
  bool valuee = false;
  double volume = 50;
  int volumeInt = 50;
  int index = 0;
  Color boxColor = Colors.white;
  Color iconColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.keyboard_arrow_left_rounded,
            color: Colors.black,
          ),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                _header(),
                _switchButton(),
                _energy(),
              ],
            ),
          ),
          _image(),
          _volume(),
          Positioned(
            bottom: 70,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buttonOne(size),
                _buttonTwo(size),
                _buttonThree(size),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buttonOne(Size size) {
    return GestureDetector(
      onTap: (() {
            setState(() {
          if (index != 1) {
            boxColor = Colors.black;
            iconColor = Colors.white;
            index = 1;
          } else {
            boxColor = Colors.white;
            iconColor = Colors.black;
          }
        });
      }),
      child: Container(
        height: size.width / 4,
        width: size.width / 4,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Icon(Icons.wifi),
        ),
      ),
    );
  }

  Widget _buttonTwo(Size size) {
    return GestureDetector(
      onTap: (() {
        setState(() {
          if (index != 2) {
            boxColor = Colors.black;
            iconColor = Colors.white;
            index = 2;
          } else {
            boxColor = Colors.white;
            iconColor = Colors.black;
            print(index);
          }
        });
      }),
      child: Container(
        height: size.width / 4,
        width: size.width / 4,
        decoration: BoxDecoration(
          color: boxColor,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Icon(
            Icons.mic_off,
            color: iconColor,
          ),
        ),
      ),
    );
  }

  Widget _buttonThree(Size size) {
    return GestureDetector(
      onTap: (() {}),
      child: Container(
        height: size.width / 4,
        width: size.width / 4,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Icon(Icons.alarm),
        ),
      ),
    );
  }

  Padding _energy() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Icon(
            Icons.flash_on,
            size: 30,
          ),
          Text(
            " 95%",
            style: textStyleEnergy,
          ),
        ],
      ),
    );
  }

  Padding _switchButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Switch(
              activeColor: Colors.black,
              value: valuee,
              onChanged: (value) {
                setState(() {
                  valuee = value;
                });
              })
        ],
      ),
    );
  }

  Row _header() {
    return Row(
      children: [
        Text(
          "Amazon Echo Dot 3",
          style: textStyle,
        ),
      ],
    );
  }

  Positioned _image() {
    return Positioned(
      top: 150,
      left: -40,
      child: valuee
          ? SizedBox(
              height: 270,
              width: 270,
              child: Image.asset(
                "assets/amazon_light.png",
              ))
          : SizedBox(
              height: 270,
              width: 270,
              child: Image.asset("assets/amazon_dark.png")),
    );
  }

  Positioned _volume() {
    return Positioned(
      top: 100,
      right: 20,
      child: Column(
        children: [
          Text(
            "$volumeInt %",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 10),
          Text(
            "Volume",
            style: GoogleFonts.nunitoSans()
                .copyWith(color: Color.fromARGB(255, 60, 60, 60)),
          ),
          SizedBox(
            height: 250,
            child: RotatedBox(
              quarterTurns: 3,
              child: Slider(
                  activeColor: Colors.black,
                  min: 0,
                  max: 100,
                  value: volume,
                  onChanged: (value) {
                    setState(() {
                      volume = value;
                      volumeInt = volume.round();
                    });
                  }),
            ),
          )
        ],
      ),
    );
  }
}
