import 'package:enforcenow_admin/screens/auth/login_screen.dart';
import 'package:enforcenow_admin/screens/cashier_home_screen.dart';
import 'package:enforcenow_admin/screens/home_screen.dart';
import 'package:enforcenow_admin/widgets/button_widget.dart';
import 'package:enforcenow_admin/widgets/text_widget.dart';
import 'package:enforcenow_admin/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';

class CashierLoginScreen extends StatefulWidget {
  const CashierLoginScreen({super.key});

  @override
  State<CashierLoginScreen> createState() => _CashierLoginScreenState();
}

class _CashierLoginScreenState extends State<CashierLoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[700],
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          SizedBox(
            width: 500,
            height: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/logo.png',
                    height: 50,
                    width: 50,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: TextBold(
                    text: 'Cashier Page',
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
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const CashierHomeScreen()));
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
                          builder: (context) => const LoginScreen()));
                    },
                    child: TextBold(
                      text: 'Continue as Admin',
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
}