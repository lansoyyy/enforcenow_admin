import 'package:enforcenow_admin/widgets/button_widget.dart';
import 'package:enforcenow_admin/widgets/drawer_widget.dart';
import 'package:enforcenow_admin/widgets/text_widget.dart';
import 'package:enforcenow_admin/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        title: TextBold(text: 'HOME ADMIN', fontSize: 18, color: Colors.white),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Image.asset('assets/images/logo.png'),
          )
        ],
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 400,
              width: 275,
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            GestureDetector(
              onTap: () {
                addAccount(context, true);
              },
              child: Container(
                height: 175,
                width: 175,
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.account_circle,
                      size: 100,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextBold(
                      text: 'Add Admin Account',
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                addAccount(context, false);
              },
              child: Container(
                height: 175,
                width: 175,
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.person_4_sharp,
                      size: 100,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextBold(
                      text: 'Add Enforcer Account',
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 175,
              width: 175,
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.book,
                    size: 100,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextBold(
                    text: 'User Manual',
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  final nameController = TextEditingController();

  final numberController = TextEditingController();

  final addressController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  addAccount(context, bool isAdmin) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: TextBold(
              text: 'Adding an account', fontSize: 18, color: Colors.black),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFieldWidget(
                textcolor: Colors.black,
                label: 'Full Name',
                controller: nameController,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFieldWidget(
                textcolor: Colors.black,
                label: 'Contact Number',
                controller: numberController,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFieldWidget(
                textcolor: Colors.black,
                label: 'Address',
                controller: addressController,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFieldWidget(
                textcolor: Colors.black,
                label: 'Email',
                controller: emailController,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFieldWidget(
                textcolor: Colors.black,
                label: 'Password',
                controller: passwordController,
              ),
              const SizedBox(
                height: 20,
              ),
              ButtonWidget(
                color: Colors.white,
                radius: 100,
                label: 'Continue',
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
