import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:enforcenow_admin/screens/auth/cashier_login_screen.dart';
import 'package:enforcenow_admin/widgets/textfield_widget.dart';
import 'package:enforcenow_admin/widgets/toast_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl.dart' show DateFormat, toBeginningOfSentenceCase;
import '../../widgets/text_widget.dart';

class CashierHomeScreen extends StatefulWidget {
  const CashierHomeScreen({super.key});

  @override
  State<CashierHomeScreen> createState() => _CashierHomeScreenState();
}

class _CashierHomeScreenState extends State<CashierHomeScreen> {
  final searchController = TextEditingController();

  final paymentController = TextEditingController();

  bool gcashSelected = false;
  bool paymayaSelected = true;
  String nameSearched = '';

  final refno = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        // drawer: DrawerWidget(
        //   incashier: true,
        // ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title:
              TextBold(text: 'CASHIER HOME', fontSize: 18, color: Colors.white),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: const Text(
                              'Logout Confirmation',
                              style: TextStyle(
                                  fontFamily: 'QBold',
                                  fontWeight: FontWeight.bold),
                            ),
                            content: const Text(
                              'Are you sure you want to Logout?',
                              style: TextStyle(fontFamily: 'QRegular'),
                            ),
                            actions: <Widget>[
                              MaterialButton(
                                onPressed: () =>
                                    Navigator.of(context).pop(true),
                                child: const Text(
                                  'Close',
                                  style: TextStyle(
                                      fontFamily: 'QRegular',
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const CashierLoginScreen()));
                                },
                                child: const Text(
                                  'Continue',
                                  style: TextStyle(
                                      fontFamily: 'QRegular',
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ));
                },
                icon: const Icon(Icons.logout))
          ],
        ),
        body: Padding(
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
                      hintText: "Search violator's license",
                      hintStyle: TextStyle(fontFamily: 'QRegular'),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey,
                      )),
                  controller: searchController,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const TabBar(
                  labelColor: Colors.blue,
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    Tab(
                      text: 'Paid',
                    ),
                    Tab(
                      text: 'Unpaid',
                    ),
                  ]),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                height: 500,
                child: TabBarView(
                  children: [
                    for (int i = 0; i < 2; i++)
                      StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('Records')
                              .where('isPaid', isEqualTo: i == 0 ? true : false)
                              .where('license',
                                  isGreaterThanOrEqualTo:
                                      toBeginningOfSentenceCase(nameSearched))
                              .where('license',
                                  isLessThan:
                                      '${toBeginningOfSentenceCase(nameSearched)}z')
                              .snapshots(),
                          builder: (BuildContext context,
                              AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (snapshot.hasError) {
                              print(snapshot.error);
                              return const Center(child: Text('Error'));
                            }
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Padding(
                                padding: EdgeInsets.only(top: 50),
                                child: Center(
                                    child: CircularProgressIndicator(
                                  color: Colors.black,
                                )),
                              );
                            }

                            final data = snapshot.requireData;
                            return SingleChildScrollView(
                              child: DataTable(
                                columns: [
                                  DataColumn(
                                      label: TextBold(
                                          text: 'No.',
                                          fontSize: 18,
                                          color: Colors.black)),
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
                                          text: 'Mode of Payment',
                                          fontSize: 18,
                                          color: Colors.black)),
                                  DataColumn(
                                      label: TextBold(
                                          text: 'Date and Time',
                                          fontSize: 18,
                                          color: Colors.black)),
                                  DataColumn(
                                    label: TextBold(
                                        text: 'Payment',
                                        fontSize: 18,
                                        color: Colors.black),
                                  ),
                                  DataColumn(
                                      label: TextBold(
                                          text: '',
                                          fontSize: 18,
                                          color: Colors.black)),
                                  DataColumn(
                                      label: TextBold(
                                          text: '',
                                          fontSize: 18,
                                          color: Colors.black)),
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
                                          text: data.docs[i]['paymentType'] ==
                                                  'GCash'
                                              ? '${data.docs[i]['paymentType']} (${data.docs[i]['refno']})'
                                              : '${data.docs[i]['paymentType']}',
                                          fontSize: 14,
                                          color: Colors.black,
                                        ),
                                      ),
                                      DataCell(
                                        TextRegular(
                                          text: DateFormat.yMMMd()
                                              .add_jm()
                                              .format(data.docs[i]['dateTime']
                                                  .toDate()),
                                          fontSize: 14,
                                          color: Colors.black,
                                        ),
                                      ),
                                      DataCell(
                                        Row(
                                          children: [
                                            TextRegular(
                                              text:
                                                  '₱${data.docs[i]['payment']}.00php',
                                              fontSize: 14,
                                              color: Colors.black,
                                            ),
                                            // IconButton(
                                            //   onPressed: () {
                                            //     showDialog(
                                            //       context: context,
                                            //       builder: (context) {
                                            //         return AlertDialog(
                                            //           title: TextBold(
                                            //               text:
                                            //                   'Updating Payment',
                                            //               fontSize: 18,
                                            //               color: Colors.blue),
                                            //           content: SizedBox(
                                            //             height: 100,
                                            //             child: TextFieldWidget(
                                            //                 textcolor:
                                            //                     Colors.black,
                                            //                 label: 'Payment',
                                            //                 controller:
                                            //                     paymentController),
                                            //           ),
                                            //           actions: [
                                            //             TextButton(
                                            //               onPressed: () {
                                            //                 Navigator.pop(
                                            //                     context);
                                            //               },
                                            //               child: TextBold(
                                            //                 text: 'Close',
                                            //                 fontSize: 14,
                                            //                 color: Colors.grey,
                                            //               ),
                                            //             ),
                                            //             TextButton(
                                            //               onPressed: () async {
                                            //                 await FirebaseFirestore
                                            //                     .instance
                                            //                     .collection(
                                            //                         'Records')
                                            //                     .doc(data
                                            //                         .docs[i].id)
                                            //                     .update({
                                            //                   'payment': int.parse(
                                            //                       paymentController
                                            //                           .text)
                                            //                 });
                                            //                 Navigator.pop(
                                            //                     context);
                                            //               },
                                            //               child: TextBold(
                                            //                 text: 'Save',
                                            //                 fontSize: 14,
                                            //                 color: Colors.blue,
                                            //               ),
                                            //             ),
                                            //           ],
                                            //         );
                                            //       },
                                            //     );
                                            //   },
                                            //   icon: const Icon(
                                            //     Icons.edit,
                                            //   ),
                                            // ),
                                          ],
                                        ),
                                      ),
                                      DataCell(IconButton(
                                        onPressed: () async {
                                          if (data.docs[i]['isPaid']) {
                                            await FirebaseFirestore.instance
                                                .collection('Records')
                                                .doc(data.docs[i].id)
                                                .update({
                                              'isPaid': false,
                                              'status': 'Unpaid'
                                            });
                                          } else {
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  title: TextBold(
                                                    text: 'Paid through',
                                                    fontSize: 18,
                                                    color: Colors.black,
                                                  ),
                                                  content: StatefulBuilder(
                                                      builder:
                                                          (context, setState) {
                                                    return Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        CheckboxListTile(
                                                          title: const Text(
                                                              'Cash'),
                                                          value:
                                                              paymayaSelected,
                                                          onChanged: (value) {
                                                            setState(() {
                                                              paymayaSelected =
                                                                  value!;
                                                              if (value) {
                                                                gcashSelected =
                                                                    false;
                                                              }
                                                            });
                                                          },
                                                        ),
                                                        CheckboxListTile(
                                                          title: const Text(
                                                              'GCash'),
                                                          value: gcashSelected,
                                                          onChanged: (value) {
                                                            setState(() {
                                                              gcashSelected =
                                                                  value!;

                                                              if (value) {
                                                                paymayaSelected =
                                                                    false;
                                                              }
                                                            });
                                                          },
                                                        ),
                                                        Visibility(
                                                            visible:
                                                                gcashSelected,
                                                            child:
                                                                TextFieldWidget(
                                                              textcolor:
                                                                  Colors.black,
                                                              label:
                                                                  'GCash Reference Number',
                                                              controller: refno,
                                                            )),
                                                      ],
                                                    );
                                                  }),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: TextBold(
                                                        text: 'Close',
                                                        fontSize: 12,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    TextButton(
                                                      onPressed: () async {
                                                        if (paymayaSelected ||
                                                            gcashSelected) {
                                                          if (gcashSelected) {
                                                            Navigator.pop(
                                                                context);
                                                            await FirebaseFirestore
                                                                .instance
                                                                .collection(
                                                                    'Records')
                                                                .doc(data
                                                                    .docs[i].id)
                                                                .update({
                                                              'isPaid': true,
                                                              'status': 'Paid',
                                                              'refno':
                                                                  refno.text,
                                                              'paymentType':
                                                                  gcashSelected
                                                                      ? 'GCash'
                                                                      : 'Cash'
                                                            });
                                                          } else {
                                                            Navigator.pop(
                                                                context);
                                                            await FirebaseFirestore
                                                                .instance
                                                                .collection(
                                                                    'Records')
                                                                .doc(data
                                                                    .docs[i].id)
                                                                .update({
                                                              'isPaid': true,
                                                              'status': 'Paid',
                                                              'paymentType':
                                                                  gcashSelected
                                                                      ? 'GCash'
                                                                      : 'Cash'
                                                            });
                                                          }
                                                        } else {
                                                          showToast(
                                                              'Cannot proceed! Input payment method!');
                                                        }
                                                      },
                                                      child: TextBold(
                                                        text: 'Save',
                                                        fontSize: 14,
                                                        color: Colors.blue,
                                                      ),
                                                    )
                                                  ],
                                                );
                                              },
                                            );
                                          }
                                        },
                                        icon: Icon(
                                          data.docs[i]['isPaid']
                                              ? Icons.check_box
                                              : Icons.check_box_outline_blank,
                                          color: Colors.blue,
                                        ),
                                      )),
                                      DataCell(IconButton(
                                        onPressed: () async {
                                          await FirebaseFirestore.instance
                                              .collection('Records')
                                              .doc(data.docs[i].id)
                                              .delete();
                                          showToast(
                                              'Violation deleted succesfully!');
                                        },
                                        icon: const Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                      )),
                                    ]),
                                ],
                              ),
                            );
                          }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
