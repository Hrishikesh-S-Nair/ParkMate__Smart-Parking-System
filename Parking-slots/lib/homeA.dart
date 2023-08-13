import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class homeA extends StatefulWidget {
  const homeA({super.key});

  @override
  State<homeA> createState() => _homeAState();
}

class _homeAState extends State<homeA> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        SizedBox(width: 50.0),
        Text(
          'Parking Slot A',
          style: TextStyle(
            fontSize: 36.0,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        ),
        IconButton(
          onPressed: _launchInBrowser,
          icon: Icon(Icons.location_on),
          color: Colors.brown,
          splashColor: Colors.blue,
          iconSize: 36.0,
        )
      ],
    );
  }
}

Future<void> _launchInBrowser() async {
  Uri url = Uri.parse(
      'https://www.google.com/maps/dir//pvp+mall+vijayawada/data=!4m6!4m5!1m1!4e2!1m2!1m1!1s0x3a35faaff2c857b3:0xf4c62e93c4842a9b?sa=X&ved=2ahUKEwjXyMW2r93-AhWjUGwGHdi_BowQ9Rd6BAh6EAU');
  if (!await launchUrl(
    url,
    mode: LaunchMode.externalApplication,
  )) {
    throw Exception('Could not launch $url');
  }
}
