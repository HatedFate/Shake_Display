import 'package:flutter/material.dart';
import 'package:shake/shake.dart';
import 'dart:math';

final Random rngesus = Random();
final List<String> img = [
  "../assets/a1.jpg",
  "../assets/a2.jpg",
  "../assets/a3.jpg",
  "../assets/a4.jpg",
  "../assets/a5.jpg",
  "../assets/a6.jpg",
  "../assets/a7.jpg",
  "../assets/a8.jpg",
  "../assets/a9.jpg",
  "../assets/a10.jpg",
  "../assets/a11.jpg",
  "../assets/a12.jpg",
  "../assets/a13.jpg",
  "../assets/a14.jpg",
  "../assets/a15.jpg",
  "../assets/a16.jpg",
];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shake It!',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: "Shake it!"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int num = rngesus.nextInt(img.length);

  @override
  void initState() {
    super.initState();
    ShakeDetector detector = ShakeDetector.autoStart(
        onPhoneShake: () {
          setState(() {
            num = rngesus.nextInt(img.length);
          });
        },
        minimumShakeCount: 2,
        shakeThresholdGravity: 0.5);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        title: const Text("Shake It!"),
      ),
      body: Center(
        child: SizedBox(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Image(image: AssetImage(img.elementAt(num))),
          ),
        ),
      ),
    );
  }
}
