import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:new_app/pages/camera_page.dart';
import 'package:new_app/pages/profile_confirm_page.dart';
import 'package:new_app/pages/explore_confirm_page.dart';
import 'package:new_app/pages/suggestions_confirm_page.dart';
import 'package:new_app/services/storage_service.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'followers_page.dart';

class HomeConfirmPage extends StatefulWidget {
  HomeConfirmPage({Key? key}) : super(key: key);

  @override
  _HomeConfirmPageState createState() => _HomeConfirmPageState();
}

class _HomeConfirmPageState extends State<HomeConfirmPage> {
  final user = FirebaseAuth.instance.currentUser!;
  final FirebaseStorage storage = FirebaseStorage.instance;
  int _selectedIndex = 0;

  bool _isImageLoaded = false;
  String? _imageUrl;
  bool _isBoxVisible = true;
  bool isLiked = false;
  List<bool> isLikedList = List.generate(7, (index) => false);

  // sign user out method
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  final List<Map<String, dynamic>> _items = [
    {
      'title': 'Maheera Memon',
      'description': 'ACM is Dripp\'n',
    },
    {
      'title': 'Aubrey Graham',
      'description': 'S-such a cutie patootie! >W<',
    },
    {
      'title': 'Ice Spice',
      'description': 'You thought i was feeling you?',
    },
    {
      'title': 'Obama Obama',
      'description': 'Obama',
    },
    {
      'title': 'Taylor Swift',
      'description': 'are we out of the woods yet?',
    },
    {
      'title': 'Muaaz Abed',
      'description': 'cast me for family guy hindi',
    },
    {
      'title': 'Snoop Dogg',
      'description': 'infinity and beyond',
    },
  ];

  @override
  void initState() {
    super.initState();
    // Load image only once in the initState method
    storage
        .ref('${FirebaseAuth.instance.currentUser?.uid}.png')
        .getDownloadURL()
        .then((value) => setState(() {
              _imageUrl = value;
              _isImageLoaded = true;
            }))
        .catchError((error) => print(error));
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
                              pageBuilder: (_, __, ___) =>
                                  SuggestionsConfirmPage(),
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
                        return true;
                      },
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        itemCount: 7,
                        itemBuilder: (BuildContext context, int index) {
                          bool isLiked = false;

                          return Column(children: [
                            const SizedBox(
                              height: kToolbarHeight + 40,
                            ),
                            Stack(
                              children: [
                                index == 0 && _isImageLoaded
                                    ? Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 8.0),
                                        child: Align(
                                          alignment: Alignment.topCenter,
                                          child: SizedBox(
                                            height: 640,
                                            width: 360,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(55),
                                              child: CachedNetworkImage(
                                                imageUrl: _imageUrl!,
                                                fit: BoxFit.cover,
                                                placeholder: (context, url) =>
                                                    const Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                ),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        const Icon(Icons.error),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    : Container(
                                        decoration: BoxDecoration(
                                          color: const Color(0xffd9d9d9),
                                          borderRadius:
                                              BorderRadius.circular(55),
                                          image: index == 1
                                              ? const DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: AssetImage(
                                                      'lib/images/drake-2.png'),
                                                )
                                              : index == 2
                                                  ? const DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: AssetImage(
                                                          'lib/images/icespice2.png'),
                                                    )
                                                  : index == 3
                                                      ? const DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: AssetImage(
                                                              'lib/images/obama2.png'),
                                                        )
                                                      : index == 4
                                                          ? const DecorationImage(
                                                              fit: BoxFit.cover,
                                                              image: AssetImage(
                                                                  'lib/images/taylor2.png'),
                                                            )
                                                          : index == 5
                                                              ? const DecorationImage(
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  image: AssetImage(
                                                                      'lib/images/muaaz2p.png'),
                                                                )
                                                              : index == 6
                                                                  ? const DecorationImage(
                                                                      fit: BoxFit
                                                                          .cover,
                                                                      image: AssetImage(
                                                                          'lib/images/buzz.png'),
                                                                    )
                                                                  : const DecorationImage(
                                                                      fit: BoxFit
                                                                          .cover,
                                                                      image: AssetImage(
                                                                          'lib/images/buzz.png'),
                                                                    ),
                                        ),
                                        height: 640,
                                        width: 360,
                                      ),
                                index == 0 && _isImageLoaded
                                    ? Positioned(
                                        top: 30,
                                        left: 30,
                                        child: Text(
                                          _items[index]['title'],
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25,
                                            color: Colors.white,
                                          ),
                                        ),
                                      )
                                    : Positioned(
                                        bottom: 0,
                                        left: 0,
                                        right: 0,
                                        child: Container(
                                          padding: const EdgeInsets.all(15),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.only(
                                              bottomLeft: Radius.circular(55),
                                              bottomRight: Radius.circular(55),
                                            ),
                                            color: Colors.white,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 16.0),
                                                child: Text(
                                                  _items[index]['description'],
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  IconButton(
                                                    icon: isLikedList[index]
                                                        ? Icon(Icons.favorite)
                                                        : Icon(Icons
                                                            .favorite_border),
                                                    onPressed: () {
                                                      setState(() {
                                                        // Toggle the liked state for this item
                                                        isLikedList[index] =
                                                            !isLikedList[index];
                                                      });
                                                    },
                                                  ),
                                                  IconButton(
                                                    icon: Icon(
                                                        Icons.comment_outlined),
                                                    onPressed: () {
                                                      // Add your logic for handling comment button press here
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                index != 0 && _isImageLoaded
                                    ? Positioned(
                                        top: 30,
                                        left: 30,
                                        child: Text(
                                          _items[index]['title'],
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25,
                                            color: Colors.white,
                                          ),
                                        ),
                                      )
                                    : Positioned(
                                        bottom: 8,
                                        left: 0,
                                        right: 0,
                                        child: Container(
                                          padding: const EdgeInsets.all(15),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.only(
                                              bottomLeft: Radius.circular(55),
                                              bottomRight: Radius.circular(55),
                                            ),
                                            color: Colors.white,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 16.0),
                                                child: Text(
                                                  _items[index]['description'],
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  IconButton(
                                                    icon: isLikedList[index]
                                                        ? Icon(Icons.favorite)
                                                        : Icon(Icons
                                                            .favorite_border),
                                                    onPressed: () {
                                                      setState(() {
                                                        // Toggle the liked state for this item
                                                        isLikedList[index] =
                                                            !isLikedList[index];
                                                      });
                                                    },
                                                  ),
                                                  IconButton(
                                                    icon: Icon(
                                                        Icons.comment_outlined),
                                                    onPressed: () {
                                                      // Add your logic for handling comment button press here
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                              ],
                            )
                          ]);
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
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
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
            if (index == 1) {
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
                    return ExploreConfirmPage();
                  },
                ),
              );
            } else if (index == 2) {
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
                    return ProfileConfirmPage();
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
