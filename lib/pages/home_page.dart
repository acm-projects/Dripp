import 'package:camera/camera.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:new_app/pages/camera_page.dart';
import 'package:new_app/pages/profile_page.dart';
import 'suggestions_page.dart';
import 'package:new_app/pages/followers_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final user = FirebaseAuth.instance.currentUser!;
  late List<CameraDescription> cameras;

  @override
  void initState() {
    super.initState();
    _getCameras();
  }

  Future<void> _getCameras() async {
    cameras = await availableCameras();
  }

  bool _isBoxVisible = true;

  // sign user out method
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.only(left: 20),
        ),
        actions: [
          IconButton(
            padding: const EdgeInsets.only(right: 20),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FollowersPage()),
              );
            },
            icon: const Icon(Icons.person),
            color: Colors.white,
          )
        ],
        title: Stack(
          children: [
            Center(
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  children: [
                    TextSpan(
                      text: 'Suggestion',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              transitionDuration: Duration(milliseconds: 30),
                              pageBuilder: (_, __, ___) => SuggestionsPage(),
                              transitionsBuilder: (_, animation, __, child) =>
                                  FadeTransition(
                                opacity: animation,
                                child: child,
                              ),
                            ),
                          );
                        },
                    ),
                    TextSpan(
                      text: ' | ',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    TextSpan(
                      text: 'Friends',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            AnimatedOpacity(
              opacity: _isBoxVisible ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 500),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
              ),
            ),
          ],
        ),
      ),
      body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: PageController(initialPage: _selectedIndex),
          onPageChanged: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 69, 0, 103),
                    Color.fromARGB(255, 0, 26, 130)
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: NotificationListener<ScrollNotification>(
                      onNotification: (scrollNotification) {
                        if (scrollNotification is ScrollUpdateNotification) {
                          setState(() {
                            _isBoxVisible =
                                scrollNotification.metrics.pixels <= 0;
                          });
                        }
                        return true;
                      },
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        itemCount: 5,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              const SizedBox(
                                height: kToolbarHeight + 40,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Align(
                                  alignment: Alignment.topCenter,
                                  child: SizedBox(
                                    height: 640,
                                    width: 360,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: const Color(0xffd9d9d9),
                                        borderRadius: BorderRadius.circular(55),
                                      ),
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            top: 170,
                                            left: 0,
                                            right: 0,
                                            child: Center(
                                              child: Image.asset(
                                                'lib/images/dripp.png',
                                                height: 85.49,
                                                width: 55,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            top: 173,
                                            left: 0,
                                            right: 0,
                                            child: Center(
                                              child: Image.asset(
                                                'lib/images/no.png',
                                                height: 80,
                                                width: 80,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          const Positioned(
                                            top: 295,
                                            left: 0,
                                            right: 0,
                                            child: Center(
                                              child: Text(
                                                'Can\'t Dripp yet!',
                                                style: TextStyle(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            top: 340,
                                            left: 0,
                                            right: 0,
                                            child: Center(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  RichText(
                                                    textAlign: TextAlign.center,
                                                    text: const TextSpan(
                                                      text:
                                                          'Want to view your friends\' Dripp? Showcase yours with them!',
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(height: 16),
                                                  Container(
                                                    width: 210,
                                                    height: 60,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100),
                                                      gradient:
                                                          const LinearGradient(
                                                        colors: [
                                                          Color.fromARGB(
                                                              255, 33, 14, 117),
                                                          Color.fromARGB(
                                                              255, 0, 26, 130),
                                                        ],
                                                        begin:
                                                            Alignment.topLeft,
                                                        end: Alignment
                                                            .bottomRight,
                                                      ),
                                                    ),
                                                    child: ElevatedButton(
                                                      onPressed: () {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  CameraPage()),
                                                        );
                                                      },
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        foregroundColor:
                                                            Colors.white,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(30),
                                                        ),
                                                      ),
                                                      child: const Text(
                                                        'Dripp Out!',
                                                        style: TextStyle(
                                                            fontSize: 16),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: InkResponse(
              enableFeedback: false,
              child: Icon(Icons.explore_off_rounded),
              onTap: () {},
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xff9102d6),
        unselectedItemColor: Colors.white,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
            if (index == 2) {
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  transitionsBuilder: (BuildContext context,
                      Animation<double> animation,
                      Animation<double> secondaryAnimation,
                      Widget child) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                  pageBuilder: (BuildContext context,
                      Animation<double> animation,
                      Animation<double> secondaryAnimation) {
                    return ProfilePage();
                  },
                ),
              );
            }
          });
        },
      ),
    );
  }
}
