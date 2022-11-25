import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_project/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/pages/homePage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_project/pages/page_login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget? Home;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
