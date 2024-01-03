import 'package:enforcenow_admin/screens/auth/cashier_login_screen.dart';
import 'package:flutter/material.dart';

import '../../widgets/text_widget.dart';

class CashierHomeScreen extends StatefulWidget {
  const CashierHomeScreen({super.key});

  @override
  State<CashierHomeScreen> createState() => _CashierHomeScreenState();
}

class _CashierHomeScreenState extends State<CashierHomeScreen> {
  final searchController = TextEditingController();
  String nameSearched = '';
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Image.asset('assets/images/logo.png'),
          ),
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
                    SingleChildScrollView(
                      child: DataTable(
                        columns: [
                          DataColumn(
                              label: TextBold(
                                  text: 'ID',
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
                                  text: 'Is Paid',
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
                          DataColumn(
                              label: TextBold(
                                  text: '', fontSize: 18, color: Colors.black)),
                        ],
                        rows: [
                          for (int i = 0; i < 50; i++)
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
                                  text: 'John Doe',
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                              DataCell(
                                TextRegular(
                                  text: '123456qwerty',
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                              DataCell(
                                TextRegular(
                                  text: 'TRUE',
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                              DataCell(
                                TextRegular(
                                  text: 'January 01, 2024 - 4:00pm',
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                              DataCell(IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.check_box,
                                  color: Colors.blue,
                                ),
                              )),
                              DataCell(IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              )),
                            ]),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      child: DataTable(
                        columns: [
                          DataColumn(
                              label: TextBold(
                                  text: 'ID',
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
                                  text: 'Is Paid',
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
                          DataColumn(
                              label: TextBold(
                                  text: '', fontSize: 18, color: Colors.black)),
                        ],
                        rows: [
                          for (int i = 0; i < 50; i++)
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
                                  text: 'John Doe',
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                              DataCell(
                                TextRegular(
                                  text: '123456qwerty',
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                              DataCell(
                                TextRegular(
                                  text: 'FALSE',
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                              DataCell(
                                TextRegular(
                                  text: 'January 01, 2024 - 4:00pm',
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                              DataCell(IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.check_box_outline_blank,
                                  color: Colors.blue,
                                ),
                              )),
                              DataCell(IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              )),
                            ]),
                        ],
                      ),
                    ),
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
