import 'package:flutter/material.dart';
import 'package:parking_slots/homeA.dart';
import 'package:parking_slots/homeB.dart';
import 'package:parking_slots/homeC.dart';
import 'package:parking_slots/slots.dart';
import 'package:parking_slots/slotsB.dart';
import 'package:parking_slots/slotsC.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Parking Slots'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            opacity: 0.8,
            image: AssetImage('assets/back.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Image(image: AssetImage('assets/parking.png')),
                SizedBox(height: 5.0),
                homeA(),
                SizedBox(height: 5.0),
                Slots(),
                SizedBox(height: 5.0),
                homeB(),
                SizedBox(height: 5.0),
                SlotsB(),
                SizedBox(height: 5.0),
                homeC(),
                SizedBox(height: 5.0),
                SlotsC(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
