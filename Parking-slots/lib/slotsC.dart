import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:parking_slots/dialogC.dart';
import 'package:parking_slots/main.dart';

class SlotsC extends StatefulWidget {
  const SlotsC({super.key});

  @override
  State<SlotsC> createState() => _SlotsState();
}

class _SlotsState extends State<SlotsC> {
  final Stream<QuerySnapshot> _usersStream_C =
      FirebaseFirestore.instance.collection('parking-C').snapshots();
  DocumentReference userDocRef = FirebaseFirestore.instance
      .collection('parking-C')
      .doc('4zGXPy97qvVIcIwfIKNT');
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream_C,
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
                                const ShowDialogC(),
                          );
                          userDocRef.update({
                            'empty': unReserveParkingSlot,
                            'filled': reserveParkingSlot,
                          });
                        }
                      },
                    ),
                    trailing: Text(
                      distC,
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
