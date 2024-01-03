import 'package:flutter/material.dart';

import '../../widgets/drawer_widget.dart';
import '../../widgets/text_widget.dart';

class ViolationsPage extends StatelessWidget {
  const ViolationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        title: TextBold(text: 'VIOLATIONS', fontSize: 18, color: Colors.white),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Image.asset('assets/images/logo.png'),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: DataTable(
          columns: [
            DataColumn(
                label: TextBold(text: 'ID', fontSize: 18, color: Colors.black)),
            DataColumn(
                label:
                    TextBold(text: 'Name', fontSize: 18, color: Colors.black)),
            DataColumn(
                label: TextBold(
                    text: 'License', fontSize: 18, color: Colors.black)),
            DataColumn(
                label: TextBold(
                    text: 'Status', fontSize: 18, color: Colors.black)),
            DataColumn(
                label: TextBold(
                    text: 'Date and Time', fontSize: 18, color: Colors.black)),
            DataColumn(
                label: TextBold(text: '', fontSize: 18, color: Colors.black)),
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
                    text: 'Pending',
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
                    Icons.delete,
                    color: Colors.red,
                  ),
                )),
              ]),
          ],
        ),
      ),
    );
  }
}
