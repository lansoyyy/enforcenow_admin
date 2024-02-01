import 'package:enforcenow_admin/screens/cashier_home_screen.dart';
import 'package:enforcenow_admin/screens/home_screen.dart';
import 'package:enforcenow_admin/screens/pages/add_violation_screen.dart';
import 'package:enforcenow_admin/screens/pages/no_credentials_page.dart';
import 'package:enforcenow_admin/screens/pages/reports_page.dart';
import 'package:enforcenow_admin/screens/pages/user_management_page.dart';
import 'package:enforcenow_admin/screens/pages/violations_page.dart';
import 'package:enforcenow_admin/widgets/text_widget.dart';
import 'package:flutter/material.dart';

import '../screens/auth/login_screen.dart';

class DrawerWidget extends StatefulWidget {
  bool incashier;

  DrawerWidget({super.key, this.incashier = false});

  @override
  State<DrawerWidget> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      child: Drawer(
        child: ListView(
          padding: const EdgeInsets.only(top: 0),
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.grey, width: 0.5))),
              accountEmail:
                  TextRegular(text: '', fontSize: 12, color: Colors.black),
              accountName: TextRegular(
                text: widget.incashier ? 'Cashier' : 'Administrator',
                fontSize: 14,
                color: Colors.black,
              ),
              currentAccountPicture: const Padding(
                padding: EdgeInsets.all(5.0),
                child: CircleAvatar(
                  minRadius: 50,
                  maxRadius: 50,
                  backgroundImage: AssetImage('assets/images/profile.png'),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: TextBold(
                text: 'Home',
                fontSize: 12,
                color: Colors.black,
              ),
              onTap: () {
                if (widget.incashier) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const CashierHomeScreen()));
                } else {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                }
              },
            ),
            ListTile(
              leading: const Icon(Icons.add),
              title: TextBold(
                text: 'Add Violation',
                fontSize: 12,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const AddViolationScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.group),
              title: TextBold(
                text: 'User Management',
                fontSize: 12,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const UserManagementPage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.list),
              title: TextBold(
                text: 'Violations',
                fontSize: 12,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ViolationsPage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.incomplete_circle),
              title: TextBold(
                text: 'No Credentials',
                fontSize: 12,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const NoCredentialsPage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.report),
              title: TextBold(
                text: 'Reports',
                fontSize: 12,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ReportsPage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: TextBold(
                text: 'Logout',
                fontSize: 12,
                color: Colors.black,
              ),
              onTap: () {
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
                              onPressed: () => Navigator.of(context).pop(true),
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
                                            const LoginScreen()));
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
            ),
          ],
        ),
      ),
    );
  }
}
