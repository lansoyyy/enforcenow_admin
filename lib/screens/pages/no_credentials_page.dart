import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:enforcenow_admin/widgets/toast_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../widgets/drawer_widget.dart';
import '../../widgets/text_widget.dart';

class NoCredentialsPage extends StatelessWidget {
  const NoCredentialsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        title:
            TextBold(text: 'NO CREDENTIALS', fontSize: 18, color: Colors.white),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Image.asset('assets/images/logo.png'),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('Records')
                .where('type', isEqualTo: 'No credentials')
                .snapshots(),
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
              return DataTable(
                columns: [
                  DataColumn(
                      label: TextBold(
                          text: 'No.', fontSize: 18, color: Colors.black)),
                  DataColumn(
                      label: TextBold(
                          text: 'Image', fontSize: 18, color: Colors.black)),
                  DataColumn(
                      label: TextBold(
                          text: 'Comment', fontSize: 18, color: Colors.black)),
                  DataColumn(
                      label: TextBold(
                          text: 'Place of Violation',
                          fontSize: 18,
                          color: Colors.black)),
                  DataColumn(
                      label: TextBold(
                          text: 'Date and Time',
                          fontSize: 18,
                          color: Colors.black)),
                  DataColumn(
                      label: TextBold(
                          text: '', fontSize: 18, color: Colors.black)),
                ],
                rows: [
                  for (int i = 0; i < data.docs.length; i++)
                    DataRow(cells: [
                      DataCell(
                        TextRegular(
                          text: '${i + 1}',
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                      DataCell(
                        IconButton(
                          onPressed: () {
                            if (data.docs[i]['img'] != '') {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    content: Image.network(data.docs[i]['img']),
                                  );
                                },
                              );
                            } else {
                              showToast('No image available!');
                            }
                          },
                          icon: const Icon(
                            Icons.image,
                          ),
                        ),
                      ),
                      DataCell(
                        TextRegular(
                          text: data.docs[i]['desc'],
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                      DataCell(
                        TextRegular(
                          text: data.docs[i]['place'],
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                      DataCell(
                        TextRegular(
                          text: DateFormat.yMMMd()
                              .add_jm()
                              .format(data.docs[i]['dateTime'].toDate()),
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                      DataCell(IconButton(
                        onPressed: () async {
                          await FirebaseFirestore.instance
                              .collection('Records')
                              .doc(data.docs[i].id)
                              .delete();
                          showToast('Violation deleted succesfully!');
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      )),
                    ]),
                ],
              );
            }),
      ),
    );
  }
}
