import 'package:flutter/material.dart';

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
              DataTable(
                columns: [
                  DataColumn(
                      label: TextBold(
                          text: 'ID', fontSize: 18, color: Colors.black)),
                  DataColumn(
                      label: TextBold(
                          text: 'Name', fontSize: 18, color: Colors.black)),
                  DataColumn(
                      label: TextBold(
                          text: 'Contact Number',
                          fontSize: 18,
                          color: Colors.black)),
                  DataColumn(
                      label: TextBold(
                          text: 'Address', fontSize: 18, color: Colors.black)),
                  DataColumn(
                      label: TextBold(
                          text: 'Email', fontSize: 18, color: Colors.black)),
                  DataColumn(
                      label: TextBold(
                          text: 'Type', fontSize: 18, color: Colors.black)),
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
                          text: '09090104355',
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                      DataCell(
                        TextRegular(
                          text: 'Nazareth, CDO',
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                      DataCell(
                        TextRegular(
                          text: 'johndoe@gmail.com',
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                      DataCell(
                        TextRegular(
                          text: 'Enforcer',
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
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
            ],
          ),
        ),
      ),
    );
  }
}
