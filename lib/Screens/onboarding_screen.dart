import 'package:flutter/material.dart';
import 'package:studiosdost/Screens/login.dart';
import 'package:studiosdost/Screens/signup.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SignUp())),
              child: Container(
                height: 50,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(18.0)),
                child: const Center(
                    child: Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                )),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Login())),
              child: Container(
                height: 50,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(18.0)),
                child: const Center(
                    child: Text(
                  "Sign In",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
