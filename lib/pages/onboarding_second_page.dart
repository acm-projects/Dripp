import 'package:flutter/material.dart';
import 'package:new_app/pages/blue_page.dart';
import 'package:new_app/pages/login_or_register_page.dart';
import 'package:new_app/pages/onboarding_first_page.dart';
import 'package:new_app/pages/splash_page.dart';
import 'package:new_app/pages/globals.dart';


class OnBoardScreenTwo extends StatefulWidget {
  const OnBoardScreenTwo({Key? key}) : super(key: key);

  State<OnBoardScreenTwo> createState() => OnboardingVariantTwo();
}

class OnboardingVariantTwo extends State<OnBoardScreenTwo> {
  String? selectedColor2 = Globals.selectedColor2;

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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OnBoardScreen(),
                        ),
                      );
                    },
                  ),
                  Text(
                    'Choose your aesthetic:',
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
                                  BluePage(),
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
                  buildColorTile('lib/images/indie.png', 'Indie'),
                  buildColorTile('lib/images/grunge.png', 'Grunge'),
                  buildColorTile('lib/images/softgirl.png', 'Soft'),
                  buildColorTile('lib/images/Y2K.png', 'Y2K'),
                  buildColorTile(
                      'lib/images/darkacademia.png', 'Academia'),
                  buildColorTile('lib/images/kawaii.png', 'Kawaii'),
                  buildColorTile('lib/images/vintage.png', 'Vintage'),
                  buildColorTile('lib/images/boho.png', 'Boho'),
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
          selectedColor2 = colorName;
          Globals.selectedColor2 = selectedColor2;
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
              color: selectedColor2 == colorName
                  ? Color.fromARGB(255, 166, 1, 255)
                  : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
