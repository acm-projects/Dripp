import 'package:flutter/material.dart';
import 'package:new_app/pages/login_or_register_page.dart';
import 'package:new_app/pages/onboarding_second_page.dart';
import 'package:new_app/pages/globals.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({Key? key}) : super(key: key);

  State<OnBoardScreen> createState() => OnboardingVariant();
}

class OnboardingVariant extends State<OnBoardScreen> {
  String? selectedColor = Globals.selectedColor;

  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 69, 0, 103),
              Color.fromARGB(255, 0, 26, 130)
            ],
          ),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(20, 60, 20, 0),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginOrRegister(),
                        ),
                      );
                    },
                  ),
                  Text(
                    'Choose your dropp color:',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.arrow_forward_ios, color: Colors.white),
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  OnBoardScreenTwo(),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            var begin = 0.0;
                            var end = 1.0;
                            var tween = Tween(begin: begin, end: end);
                            var curvedAnimation = CurvedAnimation(
                                parent: animation, curve: Curves.easeInOut);
                            return FadeTransition(
                              opacity: tween.animate(curvedAnimation),
                              child: child,
                            );
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  buildColorTile('lib/images/white.png', 'White'),
                  buildColorTile('lib/images/pink.png', 'Pink'),
                  buildColorTile('lib/images/red.png', 'Red'),
                  buildColorTile('lib/images/orange.png', 'Orange'),
                  buildColorTile('lib/images/yellow.png', 'Yellow'),
                  buildColorTile('lib/images/green.png', 'Green'),
                  buildColorTile('lib/images/blue.png', 'Blue'),
                  buildColorTile('lib/images/purple.png', 'Purple'),
                  buildColorTile('lib/images/brown.png', 'Brown'),
                  buildColorTile('lib/images/gray.png', 'Gray'),
                  buildColorTile('lib/images/black.png', 'Black'),
                  buildColorTile('lib/images/question.png', 'Don\'t Know Yet'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildColorTile(String imagePath, String colorName) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedColor = colorName;
          Globals.selectedColor = selectedColor;
        });
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12.0, 10.0, 0, 15),
        child: ListTile(
          leading: SizedBox(
            child: Container(
              height: 33.33,
              width: 50,
              child: Image.asset(imagePath),
            ),
          ),
          title: Text(
            colorName,
            style: TextStyle(
              fontSize: 24,
              color: selectedColor == colorName
                  ? Color.fromARGB(255, 166, 1, 255)
                  : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
