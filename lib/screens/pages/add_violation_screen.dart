import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:enforcenow_admin/services/add_violation.dart';
import 'package:enforcenow_admin/widgets/drawer_widget.dart';
import 'package:enforcenow_admin/widgets/text_widget.dart';
import 'package:enforcenow_admin/widgets/textfield_widget.dart';
import 'package:enforcenow_admin/widgets/toast_widget.dart';
import 'package:flutter/material.dart';

class AddViolationScreen extends StatefulWidget {
  const AddViolationScreen({super.key});

  @override
  State<AddViolationScreen> createState() => _AddViolationScreenState();
}

class _AddViolationScreenState extends State<AddViolationScreen> {
  final name = TextEditingController();
  final amount = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: TextBold(
                      text: 'Adding Violation',
                      fontSize: 18,
                      color: Colors.black),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFieldWidget(
                          textcolor: Colors.black,
                          label: 'Name of Violation',
                          controller: name),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFieldWidget(
                          textcolor: Colors.black,
                          label: 'Amount',
                          controller: amount),
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: TextBold(
                        text: 'Cancel',
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        addViolation(name.text, amount.text);
                        Navigator.pop(context);
                      },
                      child: TextBold(
                        text: 'Continue',
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ],
                );
              },
            );
          }),
      drawer: DrawerWidget(
        incashier: false,
      ),
      appBar: AppBar(
        title:
            TextBold(text: 'VIOLATION LIST', fontSize: 18, color: Colors.white),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Image.asset('assets/images/logo.png'),
          )
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream:
              FirebaseFirestore.instance.collection('Violations').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              print(snapshot.error);
              return const Center(child: Text('Error'));
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Padding(
                padding: EdgeInsets.only(top: 50),
                child: Center(
                    child: CircularProgressIndicator(
                  color: Colors.black,
                )),
              );
            }

            final data = snapshot.requireData;
            return SizedBox(
              width: 750,
              child: ListView.builder(
                itemCount: data.docs.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    child: ListTile(
                      leading: const Icon(Icons.report),
                      title: TextBold(
                          text: data.docs[index]['name'],
                          fontSize: 18,
                          color: Colors.black),
                      trailing: SizedBox(
                        width: 200,
                        child: Row(
                          children: [
                            TextBold(
                                text: data.docs[index]['amount'],
                                fontSize: 18,
                                color: Colors.amber),
                            IconButton(
                              onPressed: () async {
                                setState(() {
                                  name.text = data.docs[index]['name'];
                                  amount.text = data.docs[index]['amount'];
                                });
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: TextBold(
                                          text: 'Editing Violation',
                                          fontSize: 18,
                                          color: Colors.black),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          TextFieldWidget(
                                              textcolor: Colors.black,
                                              label: 'Name of Violation',
                                              controller: name),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          TextFieldWidget(
                                              textcolor: Colors.black,
                                              label: 'Amount',
                                              controller: amount),
                                        ],
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: TextBold(
                                            text: 'Cancel',
                                            fontSize: 14,
                                            color: Colors.black,
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () async {
                                            await FirebaseFirestore.instance
                                                .collection('Violations')
                                                .doc(data.docs[index].id)
                                                .update({
                                              'name': name.text,
                                              'amount': amount.text,
                                            });
                                            showToast(
                                                'Violation updated succesfully!');
                                            Navigator.pop(context);
                                          },
                                          child: TextBold(
                                            text: 'Continue',
                                            fontSize: 14,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              icon: const Icon(
                                Icons.edit,
                                color: Colors.blue,
                              ),
                            ),
                            IconButton(
                              onPressed: () async {
                                await FirebaseFirestore.instance
                                    .collection('Violations')
                                    .doc(data.docs[index].id)
                                    .delete();
                                showToast('Violation deleted succesfully!');
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          }),
    );
  }
}
