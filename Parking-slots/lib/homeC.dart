import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class homeC extends StatefulWidget {
  const homeC({super.key});

  @override
  State<homeC> createState() => _homeCState();
}

class _homeCState extends State<homeC> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        SizedBox(width: 50.0),
        Text(
          'Parking Slot C',
          style: TextStyle(
            fontSize: 36.0,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
        IconButton(
          onPressed: _launchInBrowser,
          icon: Icon(Icons.location_on),
          color: Colors.orange,
          splashColor: Colors.red,
          iconSize: 36.0,
        )
      ],
    );
  }
}

Future<void> _launchInBrowser() async {
  Uri url = Uri.parse(
      'https://www.google.com/maps/dir//airport+in+vijayawada/data=!4m6!4m5!1m1!4e2!1m2!1m1!1s0x3a35e2afebbdeff9:0x1bc844d2b2e24c5?sa=X&ved=2ahUKEwitgNqjsN3-AhUKzTgGHblmCNAQ9Rd6BAhzEAQ');
  if (!await launchUrl(
    url,
    mode: LaunchMode.externalApplication,
  )) {
    throw Exception('Could not launch $url');
  }
}
