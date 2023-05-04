import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:new_app/pages/login_or_register_page.dart';
import 'package:new_app/pages/onboarding_first_page.dart';
import 'package:new_app/pages/onboarding_second_page.dart';
import 'package:new_app/pages/splash_page.dart';
import 'package:new_app/pages/thank_page.dart';
import 'package:file_picker/file_picker.dart';

class BluePage extends StatefulWidget {
  @override
  State<BluePage> createState() => _BluePageState();
}

class _BluePageState extends State<BluePage> {
  get storage => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              padding: const EdgeInsets.fromLTRB(20, 60, 0, 0),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OnBoardScreenTwo(),
                        ),
                      );
                    },
                  ),
                  Text(
                    'Pick a Profile Photo',
                    style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.arrow_forward_ios, color: Colors.white),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ThankPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                        } else if (results != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ThankPage(),
                            ),
                          );
                        }

                        final path = results.files.single.path!;
                        final fileName = results.files.single.name;

                        storage
                            .uploadFile(path, fileName)
                            .then((value) => print('Done'));
                      },
                      child: CircleAvatar(
                        radius: 150.0,
                        backgroundImage: AssetImage('lib/images/def.png'),
                      ),
                    ),
                    SizedBox(height: 50),
                    Text(
                      'Tap the circle to pick a profile photo',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
