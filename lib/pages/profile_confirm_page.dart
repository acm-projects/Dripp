import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:new_app/pages/explore_confirm_page.dart';
import 'package:new_app/pages/home_confirm_page.dart';
import 'package:new_app/pages/personal_info.dart';
import 'package:new_app/services/storage_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:new_app/models/user_model.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import 'auth.dart';

//import 'package:new_app/services/auth_service.dart';

class ProfileConfirmPage extends StatefulWidget {
  @override
  _ProfileConfirmPageState createState() => _ProfileConfirmPageState();
}

class _ProfileConfirmPageState extends State<ProfileConfirmPage> {
  UserModel? _userModel;
  //List<UserModel> users = [];
  //late final User user;

  @override
  void initState() {
    getRecords();
    super.initState();
  }

  Future<void> getRecords() async {
    final user = FirebaseAuth.instance.currentUser;
    final uid = user!.uid;

    final userReference =
        FirebaseFirestore.instance.collection('users').doc(uid);

    final documentSnapshot = await userReference.get();
    final userData = documentSnapshot.data();
    print(userData);

    if (userData != null) {
      setState(() {
        _userModel = UserModel.fromJson(userData);
      });
    }

    /*
    var userData =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    mapRecords(userData);
  */
  }

  int _selectedIndex = 2;
  final User user = FirebaseAuth.instance.currentUser!;
  get storage => null;
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  bool _isImageLoaded = false;
  String? _imageUrl;

  @override
  void initStatePfp() {
    super.initState();
    // Load image only once in the initState method
    storage
        .ref('${user.uid}/main.png')
        .getDownloadURL()
        .then((value) => setState(() {
              _imageUrl = value;
              _isImageLoaded = true;
            }))
        .catchError((error) => print(error));
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    void _openDrawer() {
      _scaffoldKey.currentState!.openDrawer();
    }

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.only(left: 20),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(
              onTap: _openDrawer,
              child: Icon(
                Icons.more_horiz_rounded,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 25.0,
                    backgroundImage: AssetImage('lib/images/maheera.png'),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Maheera Memon',
                    style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'maheeramemon@yahoo.com',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text('Personal Information'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PersonalInfoPage()),
                );
              },
            ),

            ListTile(
              title: Text('Calendar'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Settings'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Notifications'),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CupertinoAlertDialog(
                      title: Text("Allow Notifications?"),
                      content: Text(
                          "Would you like to turn on notifications for this app?"),
                      actions: <Widget>[
                        CupertinoDialogAction(
                          child: Text("Don't Allow"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        CupertinoDialogAction(
                          child: Text("Allow"),
                          onPressed: () {
                            // Handle allowing notifications
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            ListTile(
              title: Text('Privacy Policy'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Sign Out'),
              onTap: () {
                // Update the state of the app
                signUserOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => AuthPage()),
                );
              },
            ),
            // Add more list tiles as needed
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () async {
                final results = await FilePicker.platform.pickFiles(
                  allowMultiple: false,
                  type: FileType.custom,
                  allowedExtensions: ['png', 'jpg'],
                );

                if (results == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('No file Selected'),
                    ),
                  );
                  return null;
                }

                final path = results.files.single.path!;
                final fileName = results.files.single.name;

                storage
                    .uploadFile(path, fileName)
                    .then((value) => print('Done'));
              },
              child: CircleAvatar(
                radius: 75.0,
                backgroundImage: AssetImage('lib/images/maheera.png'),
              ),
            ),
            Text(
              user.displayName ?? '',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Maheera Memon',
              style: const TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const Text(
                      'Posts',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      '1',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Followers',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      '6',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text(
                      'Following',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      '6',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
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
            } else if (index == 1) {
              // change to index 1 for Explore button
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
            }
          });
        },
      ),
    );
  }
}
