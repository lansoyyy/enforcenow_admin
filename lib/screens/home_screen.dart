import 'package:enforcenow_admin/services/add_user.dart';
import 'package:enforcenow_admin/widgets/button_widget.dart';
import 'package:enforcenow_admin/widgets/drawer_widget.dart';
import 'package:enforcenow_admin/widgets/text_widget.dart';
import 'package:enforcenow_admin/widgets/textfield_widget.dart';
import 'package:enforcenow_admin/widgets/toast_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 50, top: 50),
              child: TextBold(
                text: 'Welcome Admin!',
                fontSize: 32,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 50,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue[300],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset(
                      'assets/images/police.png',
                      height: 500,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 50,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            addAccount(context, 'Admin');
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
                        const SizedBox(
                          width: 50,
                        ),
                        GestureDetector(
                          onTap: () {
                            addAccount(context, 'Enforcer');
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
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            addAccount(context, 'Cashier');
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
                                  Icons.face,
                                  size: 100,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextBold(
                                  text: 'Add Cashier Account',
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 50,
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
                  ],
                ),
              ],
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

  addAccount(context, String type) {
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
                  register(context, type);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  register(context, type) async {
    try {
      final user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);

      // signup(nameController.text, numberController.text, addressController.text,
      //     emailController.text);

      addUser(type, nameController.text, numberController.text,
          addressController.text, emailController.text, user.user!.uid);

      showToast('Account added succesfully!');
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showToast('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        showToast('The account already exists for that email.');
      } else if (e.code == 'invalid-email') {
        showToast('The email address is not valid.');
      } else {
        showToast(e.toString());
      }
    } on Exception catch (e) {
      showToast("An error occurred: $e");
    }
  }
}
