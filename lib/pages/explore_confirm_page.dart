import 'package:flutter/material.dart';
import 'package:new_app/pages/home_confirm_page.dart';
import 'package:new_app/pages/profile_confirm_page.dart';
import 'package:new_app/pages/profile_new_page.dart';

class ExploreConfirmPage extends StatefulWidget {
  @override
  _ExploreConfirmPageState createState() => _ExploreConfirmPageState();
}

class _ExploreConfirmPageState extends State<ExploreConfirmPage> {
  int _selectedIndex = 1;

  final List<Map<String, dynamic>> _items = [
    {
      'image': const AssetImage('lib/images/selfie1.png'),
      'title': 'Kain Miller',
    },
    {
      'image': const AssetImage('lib/images/selfie2.png'),
      'title': 'Linden Wood',
    },
    {
      'image': const AssetImage('lib/images/selfie6.png'),
      'title': 'Asahel Walker',
    },
    {
      'image': const AssetImage('lib/images/selfie3.png'),
      'title': 'Shane Michael',
    },
    {
      'image': const AssetImage('lib/images/selfie4.png'),
      'title': 'Mia Dixon',
    },
    {
      'image': const AssetImage('lib/images/selfie5.png'),
      'title': 'Dawn Baxter',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: TextField(
          onChanged: (value) {
            setState(() {});
          },
          decoration: const InputDecoration(
            hintText: 'Search',
            border: InputBorder.none,
            icon: Icon(Icons.search),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 69, 0, 103),
              Color.fromARGB(255, 0, 26, 130),
            ],
          ),
        ),
        child: GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 9 / 16,
            mainAxisSpacing: 16,
            crossAxisSpacing: 8,
          ),
          itemCount: _items.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileNewPage(title: '',)),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, 2),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              _items[index]['image'].assetName,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            top: 8,
                            left: 8,
                            child: Row(
                              children: [
                                const SizedBox(width: 8),
                                Text(
                                  _items[index]['title'],
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
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
        unselectedItemColor:
            Colors.white, // Set the unselectedItemColor to white
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
            if (index == 0) {
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
                    return HomeConfirmPage();
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
