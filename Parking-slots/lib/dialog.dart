import 'dart:ui';
import 'package:flutter/material.dart';

class ShowDialog extends StatefulWidget {
  const ShowDialog({Key? key}) : super(key: key);

  @override
  State<ShowDialog> createState() => _ShowDialogState();
}

class _ShowDialogState extends State<ShowDialog> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Center(
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                width: MediaQuery.of(context).size.width - 80,
                height: MediaQuery.of(context).size.height - 710,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Center(
                  child: SimpleDialog(
                    insetPadding: const EdgeInsets.all(0.0),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16.0))),
                    elevation: 0.0,
                    backgroundColor: Colors.black.withOpacity(0.3),
                    children: <Widget>[
                      const SizedBox(height: 10.0),
                      SimpleDialogOption(
                        onPressed: () {},
                        child: const Text(
                          'Your parking spot has been reserved in Parking A !!',
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
