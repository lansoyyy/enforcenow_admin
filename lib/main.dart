import 'package:enforcenow_admin/screens/auth/login_screen.dart';
import 'package:enforcenow_admin/screens/cashier_home_screen.dart';
import 'package:enforcenow_admin/screens/home_screen.dart';
import 'package:enforcenow_admin/screens/pages/add_violation_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          authDomain: 'enforcenow-65366.firebaseapp.com',
          apiKey: "AIzaSyC5VgTLgDFKYtEeXneycIz_fyW_qm1pF6s",
          appId: "1:617661924245:web:e598b027a3e9c1d30cec9c",
          messagingSenderId: "617661924245",
          projectId: "enforcenow-65366",
          storageBucket: "enforcenow-65366.appspot.com"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginScreen(),
    );
  }
}
