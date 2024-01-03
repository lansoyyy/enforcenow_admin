import 'package:enforcenow_admin/screens/auth/cashier_login_screen.dart';
import 'package:enforcenow_admin/screens/home_screen.dart';
import 'package:enforcenow_admin/widgets/button_widget.dart';
import 'package:enforcenow_admin/widgets/text_widget.dart';
import 'package:enforcenow_admin/widgets/textfield_widget.dart';
import 'package:enforcenow_admin/widgets/toast_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[700],
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset('assets/images/admin.png'),
          SizedBox(
            width: 500,
            height: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Image.asset(
                    'assets/images/logo.png',
                    height: 250,
                    width: 250,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 100),
                  child: TextBold(
                    text: 'Admin Page',
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextBold(
                  text: 'Log in',
                  fontSize: 18,
                  color: Colors.white,
                ),
                TextRegular(
                  text: 'Please login to continue.',
                  fontSize: 14,
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFieldWidget(label: 'Email', controller: emailController),
                const SizedBox(
                  height: 10,
                ),
                TextFieldWidget(
                    isObscure: true,
                    label: 'Password',
                    controller: passwordController,
                    isPassword: true),
                const SizedBox(
                  height: 20,
                ),
                ButtonWidget(
                  radius: 100,
                  color: Colors.white,
                  width: 300,
                  label: 'Login',
                  onPressed: () {
                    login(context);
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 75,
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const CashierLoginScreen()));
                    },
                    child: TextBold(
                      text: 'Continue as Cashier',
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  login(context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomeScreen()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showToast("No user found with that email.");
      } else if (e.code == 'wrong-password') {
        showToast("Wrong password provided for that user.");
      } else if (e.code == 'invalid-email') {
        showToast("Invalid email provided.");
      } else if (e.code == 'user-disabled') {
        showToast("User account has been disabled.");
      } else {
        showToast("An error occurred: ${e.message}");
      }
    } on Exception catch (e) {
      showToast("An error occurred: $e");
    }
  }
}
