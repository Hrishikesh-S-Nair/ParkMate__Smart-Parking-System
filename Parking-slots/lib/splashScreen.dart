import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:parking_slots/home.dart';

class splasScreen extends StatefulWidget {
  const splasScreen({super.key});

  @override
  State<splasScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<splasScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 2),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const Home())));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SpinKitWaveSpinner(
          color: Colors.blue,
          size: 160.0,
        ),
      ),
    );
  }
}
