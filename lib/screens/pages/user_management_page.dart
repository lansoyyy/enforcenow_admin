import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:enforcenow_admin/widgets/toast_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat, toBeginningOfSentenceCase;
import '../../widgets/drawer_widget.dart';
import '../../widgets/text_widget.dart';

class UserManagementPage extends StatefulWidget {
  const UserManagementPage({super.key});

  @override
  State<UserManagementPage> createState() => _UserManagementPageState();
}

class _UserManagementPageState extends State<UserManagementPage> {
  final searchController = TextEditingController();
  String nameSearched = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        title: TextBold(
            text: 'USER MANAGEMENT', fontSize: 18, color: Colors.white),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Image.asset('assets/images/logo.png'),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 50, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 45,
                width: 300,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(5)),
                child: TextFormField(
                  onChanged: (value) {
                    setState(() {
                      nameSearched = value;
                    });
                  },
                  decoration: const InputDecoration(
                      hintText: 'Search User',
                      hintStyle: TextStyle(fontFamily: 'QRegular'),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey,
                      )),
                  controller: searchController,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('Users')
                      .where('name',
                          isGreaterThanOrEqualTo:
                              toBeginningOfSentenceCase(nameSearched))
                      .where('name',
                          isLessThan:
                              '${toBeginningOfSentenceCase(nameSearched)}z')
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
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
                                text: 'ID', fontSize: 18, color: Colors.black)),
                        DataColumn(
                            label: TextBold(
                                text: 'Name',
                                fontSize: 18,
                                color: Colors.black)),
                        DataColumn(
                            label: TextBold(
                                text: 'Contact Number',
                                fontSize: 18,
                                color: Colors.black)),
                        DataColumn(
                            label: TextBold(
                                text: 'Address',
                                fontSize: 18,
                                color: Colors.black)),
                        DataColumn(
                            label: TextBold(
                                text: 'Email',
                                fontSize: 18,
                                color: Colors.black)),
                        DataColumn(
                            label: TextBold(
                                text: 'Type',
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
                              TextRegular(
                                text: data.docs[i]['name'],
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                            DataCell(
                              TextRegular(
                                text: data.docs[i]['number'],
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                            DataCell(
                              TextRegular(
                                text: data.docs[i]['address'],
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                            DataCell(
                              TextRegular(
                                text: data.docs[i]['email'],
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                            DataCell(
                              TextRegular(
                                text: data.docs[i]['type'],
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                            DataCell(IconButton(
                              onPressed: () async {
                                await FirebaseFirestore.instance
                                    .collection('Users')
                                    .doc(data.docs[i].id)
                                    .delete();
                                showToast('User deleted succesfully!');
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
            ],
          ),
        ),
      ),
    );
  }
}
