import 'package:flutter/material.dart';

import '../../widgets/drawer_widget.dart';
import '../../widgets/text_widget.dart';

class ViolationPage extends StatelessWidget {
  const ViolationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
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
    );
  }
}
