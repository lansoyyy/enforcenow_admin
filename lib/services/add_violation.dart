import 'package:cloud_firestore/cloud_firestore.dart';

Future addViolation(name, amount) async {
  final docUser = FirebaseFirestore.instance.collection('Violations').doc();

  final json = {
    'name': name,
    'amount': amount,
    'dateTime': DateTime.now(),
    'id': docUser.id,
  };

  await docUser.set(json);
}
