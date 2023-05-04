import 'package:flutter/material.dart';

class PersonalInfoPage extends StatefulWidget {
  @override
  _PersonalInfoPageState createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage> {
  String _username = 'maheeramemon';
  String _email = 'maheeramemon@yahoo.com';
  String _password = '*********'; // Use your own password here
  String _string1 = 'Cloud Color: Pink';
  String _string2 = 'Aesthetic: Indie';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: Text(
            'Personal Information',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 28.0,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 8.0),
              Text(
                'Username:',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'Maheera Memon',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 18.0,
                ),
              ),
              SizedBox(height: 24.0),
              Text(
                'Email:',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'maheeramemon@yahoo.com',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 18.0,
                ),
              ),
              SizedBox(height: 24.0),
              Text(
                'Password:',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                '*********',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 18.0,
                ),
              ),
              SizedBox(height: 32.0),
              Row(
                children: <Widget>[
                  Image.asset(
                    'lib/images/pink.png',
                    height: 24.0,
                    width: 24.0,
                  ),
                  SizedBox(width: 8.0),
                  Text(
                    'Cloud Color: Pink',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Row(
                children: <Widget>[
                  Image.asset(
                    'lib/images/indie.png',
                    height: 24.0,
                    width: 24.0,
                  ),
                  SizedBox(width: 8.0),
                  Text(
                    'Aesthetic: Indie',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
