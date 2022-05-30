import 'package:flutter/material.dart';
import 'package:smart_home_app_ui/pages/speaker_demo_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Speaker Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black,
        platform: TargetPlatform.iOS,
      ),
      home: SpeakerDemoScreen(),
    );
  }
}
