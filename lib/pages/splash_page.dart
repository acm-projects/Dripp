import 'package:flutter/material.dart';
import 'home_page.dart';

class SplashPage extends StatelessWidget {
  int duration = 2;
  Widget goToPage = HomePage();

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: duration), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => goToPage,
          transitionDuration: Duration(milliseconds: 500),
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(
              opacity: Tween<double>(
                begin: 0.0,
                end: 1.0,
              ).animate(animation),
              child: child,
            );
          },
        ),
      );
    });

    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(255, 69, 0, 103),
            Color.fromARGB(255, 0, 26, 130)
          ],
        )),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
                child: Container(
                    alignment: Alignment.center,
                    height: 193.3,
                    width: 200,
                    child: Image.asset(
                      'lib/images/dripppic.png',
                    )))));
  }
}
