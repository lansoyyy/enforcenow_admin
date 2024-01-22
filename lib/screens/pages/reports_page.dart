import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:enforcenow_admin/widgets/toast_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../widgets/drawer_widget.dart';
import '../../widgets/text_widget.dart';

class ReportsPage extends StatefulWidget {
  const ReportsPage({super.key});

  @override
  State<ReportsPage> createState() => _ReportsPageState();
}

class _ReportsPageState extends State<ReportsPage> {
  final dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.download),
      ),
      drawer: const DrawerWidget(),
      appBar: AppBar(
        title: TextBold(text: 'REPORTS', fontSize: 18, color: Colors.white),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Image.asset('assets/images/logo.png'),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'Select a date',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Bold',
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: '*',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Bold',
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                GestureDetector(
                  onTap: () {
                    dateFromPicker(context);
                  },
                  child: SizedBox(
                    width: 325,
                    height: 50,
                    child: TextFormField(
                      enabled: false,
                      style: const TextStyle(
                        fontFamily: 'Regular',
                        fontSize: 14,
                        color: Colors.blue,
                      ),

                      decoration: InputDecoration(
                        suffixIcon: const Icon(
                          Icons.calendar_month_outlined,
                          color: Colors.blue,
                        ),
                        hintStyle: const TextStyle(
                          fontFamily: 'Regular',
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                        hintText: dateController.text,
                        border: InputBorder.none,
                        disabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.red,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        errorStyle:
                            const TextStyle(fontFamily: 'Bold', fontSize: 12),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.red,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),

                      controller: dateController,
                      // Pass the validator to the TextFormField
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('Records')
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
                                text: 'License',
                                fontSize: 18,
                                color: Colors.black)),
                        DataColumn(
                            label: TextBold(
                                text: 'Status',
                                fontSize: 18,
                                color: Colors.black)),
                        DataColumn(
                            label: TextBold(
                                text: 'Has paid',
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
                              TextRegular(
                                text: data.docs[i]['fname'] +
                                    ' ' +
                                    data.docs[i]['lname'],
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                            DataCell(
                              TextRegular(
                                text: data.docs[i]['license'],
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                            DataCell(
                              TextRegular(
                                text: data.docs[i]['status'],
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                            DataCell(
                              TextRegular(
                                text: data.docs[i]['isPaid'].toString(),
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
          ],
        ),
      ),
    );
  }

  void dateFromPicker(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary: Colors.blue,
                onPrimary: Colors.white,
                onSurface: Colors.grey,
              ),
            ),
            child: child!,
          );
        },
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        lastDate: DateTime.now());

    if (pickedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);

      setState(() {
        dateController.text = formattedDate;
      });
    } else {
      return null;
    }
  }
}
