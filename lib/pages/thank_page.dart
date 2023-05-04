import 'package:flutter/material.dart';
import 'package:new_app/pages/login_or_register_page.dart';
import 'package:new_app/pages/onboarding_first_page.dart';
import 'package:new_app/pages/onboarding_second_page.dart';
import 'package:new_app/pages/splash_page.dart';

class ThankPage extends StatefulWidget {
  @override
  State<ThankPage> createState() => _ThankPageState();
}

class _ThankPageState extends State<ThankPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SplashPage(),
          ),
        );
      },
      child: Scaffold(
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
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              ),
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Thanks for your help!',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign
                            .center, // Added this line to center the text horizontally
                      ),
                      SizedBox(height: 40.0),
                      Text(
                        'Now, let\'s get ready to Dripp!',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign
                            .center, // Added this line to center the text horizontally
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
