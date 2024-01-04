import 'package:cloud_firestore/cloud_firestore.dart';

Future addUser(type, name, number, address, email, id) async {
  final docUser = FirebaseFirestore.instance.collection('Users').doc(id);

  final json = {
    'name': name,
    'number': number,
    'address': address,
    'email': email,
    'type': type,
    'status': 'Pending',
    'dateTime': DateTime.now(),
    'userId': id,
  };

  await docUser.set(json);
}
