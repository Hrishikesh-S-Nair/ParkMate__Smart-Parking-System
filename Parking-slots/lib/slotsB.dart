import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:parking_slots/dialogB.dart';
import 'package:parking_slots/main.dart';

class SlotsB extends StatefulWidget {
  const SlotsB({super.key});

  @override
  State<SlotsB> createState() => _SlotsState();
}

class _SlotsState extends State<SlotsB> {
  final Stream<QuerySnapshot> _usersStream_B =
      FirebaseFirestore.instance.collection('parking-B').snapshots();
  DocumentReference userDocRef = FirebaseFirestore.instance
      .collection('parking-B')
      .doc('Ufi0KOWOresWvBwOfuhK');
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream_B,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something Went Wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }

        return GestureDetector(
          onDoubleTap: () async {
            late int reserveParkingSlot;
            late int unReserveParkingSlot;
            await userDocRef.get().then((DocumentSnapshot documentSnapshot) {
              if (documentSnapshot.exists) {
                // Get the data from the document
                Map<String, dynamic> data =
                    documentSnapshot.data() as Map<String, dynamic>;
                // Do something with the data...
                reserveParkingSlot = data['filled'] - 1;
                unReserveParkingSlot = data['empty'] + 1;
              }
            });
            if (reserveParkingSlot >= 0 && unReserveParkingSlot >= 0) {
              userDocRef.update({
                'empty': unReserveParkingSlot,
                'filled': reserveParkingSlot,
              });
            }
          },
          child: Container(
            height: 80,
            child: ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                return Card(
                  color: data['empty'] == 0 ? Colors.red : Colors.green,
                  child: ListTile(
                    leading: IconButton(
                      icon: const Icon(Icons.local_parking),
                      color: Colors.black,
                      splashColor: Colors.purple,
                      onPressed: () async {
                        late int reserveParkingSlot;
                        late int unReserveParkingSlot;
                        await userDocRef
                            .get()
                            .then((DocumentSnapshot documentSnapshot) {
                          if (documentSnapshot.exists) {
                            // Get the data from the document
                            Map<String, dynamic> data =
                                documentSnapshot.data() as Map<String, dynamic>;
                            // Do something with the data...
                            reserveParkingSlot = data['filled'] + 1;
                            unReserveParkingSlot = data['empty'] - 1;
                          }
                        });
                        if (reserveParkingSlot >= 0 &&
                            unReserveParkingSlot >= 0) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                const ShowDialogB(),
                          );
                          userDocRef.update({
                            'empty': unReserveParkingSlot,
                            'filled': reserveParkingSlot,
                          });
                        }
                      },
                    ),
                    trailing: Text(
                      distB,
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    title: Text('Empty Slots : ${data['empty'].toString()}'),
                    subtitle:
                        Text('Filled Slots : ${data['filled'].toString()}'),
                  ),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
