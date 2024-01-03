import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future addUser(type, name, number, address, email) async {
  final docUser = FirebaseFirestore.instance.collection('Users').doc();

  final json = {
    'name': name,
    'number': number,
    'address': address,
    'email': email,
    'type': type,
    'status': 'Pending',
    'dateTime': DateTime.now(),
    'userId': FirebaseAuth.instance.currentUser!.uid,
  };

  await docUser.set(json);
}
