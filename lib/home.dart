import 'package:flutter/material.dart';
import 'package:studiosdost/authentication.dart';
import 'package:studiosdost/localdatabase.dart';
import 'package:studiosdost/onboarding_screen.dart';
import 'package:studiosdost/progress.dart';
import 'package:studiosdost/shedule.dart';
import 'package:studiosdost/todolist.dart';
import 'package:studiosdost/water_tracker.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String name = " ";
  @override
  void initState() {
    getName();
    super.initState();
  }

  void getName() async {
    name = (await LocalDatabase.getNameKey())!;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(name),
          actions: [
            IconButton(
              onPressed: () {
                AuthMethord().signOut();
                LocalDatabase.saveUserSharedPrefs(false);
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OnBoardingScreen()));
              },
              icon: const Icon(Icons.exit_to_app),
            )
          ],
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const TodoListPage()))),
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18.0),
                          color: Colors.blue),
                      child: const Icon(
                        Icons.checklist_outlined,
                        size: 70,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const ProgressPage()))),
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18.0),
                          color: Colors.yellow[900]),
                      child: const Icon(
                        Icons.trending_up_outlined,
                        size: 70,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ShedulePage())),
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18.0),
                          color: Colors.green),
                      child: const Icon(
                        Icons.today_outlined,
                        size: 70,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const WaterTracker())),
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18.0),
                          color: Colors.cyan),
                      child: const Icon(
                        Icons.water_drop_outlined,
                        size: 70,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
