import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class homeB extends StatefulWidget {
  const homeB({super.key});

  @override
  State<homeB> createState() => _homeBState();
}

class _homeBState extends State<homeB> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        SizedBox(width: 50.0),
        Text(
          'Parking Slot B',
          style: TextStyle(
            fontSize: 36.0,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        IconButton(
          onPressed: _launchInBrowser,
          icon: Icon(Icons.location_on),
          color: Colors.purple,
          splashColor: Colors.yellow,
          iconSize: 36.0,
        )
      ],
    );
  }
}

Future<void> _launchInBrowser() async {
  Uri url = Uri.parse(
      'https://www.google.com/maps/dir/16.4954927,80.510502/railway+station+vijayawada/@16.4868047,80.4954994,12z/data=!3m1!4b1!4m9!4m8!1m1!4e1!1m5!1m1!1s0x3a35efe497233325:0x9b330ffbbdad42d7!2m2!1d80.619971!2d16.5186803');
  if (!await launchUrl(
    url,
    mode: LaunchMode.externalApplication,
  )) {
    throw Exception('Could not launch $url');
  }
}
