import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:parking_slots/distanceC.dart';
import 'package:parking_slots/splashScreen.dart';

import 'distance.dart';
import 'distanceB.dart';

String distA = '';
String distB = '';
String distC = '';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  distA = await distCalc();
  distB = await distCalcB();
  distC = await distCalcC();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ECS Project',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const splasScreen(),
    );
  }
}

distCalc() async {
  String dis = await calcDist();
  return dis;
}

distCalcB() async {
  String dis = await calcDistB();
  return dis;
}

distCalcC() async {
  String dis = await calcDistC();
  return dis;
}
