// ignore_for_file: unrelated_type_equality_checks

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:studiosdost/home.dart';
import 'package:studiosdost/localdatabase.dart';
import 'package:studiosdost/onboarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StudiosDost',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Root(),
    );
  }
}

class Root extends StatefulWidget {
  const Root({Key? key}) : super(key: key);

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  @override
  void initState() {
    super.initState();
    getSharedPrefs();
  }

  bool isLoggedIn = false;
  void getSharedPrefs() async {
    await LocalDatabase.getSharedPrefs().then((val) {
      if (val == true) {
        isLoggedIn = true;
        setState(() {});
      }
      if (val == false && val == null) {
        isLoggedIn = false;
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoggedIn == true) {
      return const Home();
    } else {
      return const OnBoardingScreen();
    }
  }
}
