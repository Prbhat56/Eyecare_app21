import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthcare_app/util/function_box.dart';

class HomePageFinal extends StatefulWidget {
  const HomePageFinal({Key? key}) : super(key: key);

  @override
  State<HomePageFinal> createState() => _HomePageFinalState();
}

class _HomePageFinalState extends State<HomePageFinal> {
  late String userName;
  final double horizontalPadding = 40;
  final double verticalPadding = 25;
  late List<List<dynamic>> myfunctions;

  @override
  void initState() {
    super.initState();
    getUserData();

    myfunctions = [
      [
        'ask us',
        'assets/askus.png',
        () {
          Navigator.pushNamed(context, 'screen');
        }
      ],
      [
        'adjust brightness',
        'assets/brightness.png',
        () {
          Navigator.pushNamed(context, 'bright');
        }
      ],
      [
        'scan your eye',
        'assets/know_about.png',
        () {
          Navigator.pushNamed(context, 'splash');
        }
      ],
      [
        'screen timer',
        'assets/book_doctor.png',
        () {
          Navigator.pushNamed(context, 'times');
        }
      ],
    ];
  }

  void getUserData() {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      setState(() {
        userName = user.displayName ?? '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFEFEF),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: verticalPadding,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.home,
                      size: 45,
                      color: Colors.grey[800],
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, 'drawer');
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.person,
                      size: 45,
                      color: Colors.grey[800],
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, 'profile');
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome Home',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,

                      fontFamily: 'Montserrat',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Hello $userName',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Here All For You',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat',
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: GridView.builder(
                itemCount: myfunctions.length,
                padding: const EdgeInsets.all(25),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 1,
                ),
                itemBuilder: (context, index) {
                  return FunctionBox(
                    functionName: myfunctions[index][0],
                    iconPath: myfunctions[index][1],
                    onPressed: myfunctions[index][2],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
