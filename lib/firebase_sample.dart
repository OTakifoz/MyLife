import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseSample extends StatelessWidget {
  const FirebaseSample({super.key});

  void writeDataToFirebase(String data) async {
    await FirebaseFirestore.instance
        .collection('data')
        .doc('TestData')
        .set({'data': data});
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          writeDataToFirebase('test');
        },
        child: const Text('Test Firebase'));
  }
}
