import 'package:flutter/material.dart';
import 'home_confirm_page.dart';

class SplashPageDone extends StatefulWidget {
  int duration = 5;
  Widget goToPage = HomeConfirmPage();

  @override
  _SplashPageDoneState createState() => _SplashPageDoneState();
}

class _SplashPageDoneState extends State<SplashPageDone>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    _controller.forward();
    Future.delayed(Duration(seconds: widget.duration), () {
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, _, __) => widget.goToPage,
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(255, 69, 0, 103),
            Color.fromARGB(255, 0, 26, 130)
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: FadeTransition(
            opacity: _animation,
            child: Container(
              alignment: Alignment.center,
              height: 193.3,
              width: 200,
              child: Image.asset(
                'lib/images/dripppic.png',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
