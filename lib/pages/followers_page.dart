import 'package:flutter/material.dart';
import 'package:new_app/pages/home_page.dart';

class FollowersPage extends StatefulWidget {
  const FollowersPage({Key? key}) : super(key: key);

  _FollowersPageState createState() => _FollowersPageState();
}

class _FollowersPageState extends State<FollowersPage> {
  late List<bool> isFavoriteList;
  Set<int> _selectedCloseIndices = {};

  bool isCloseSelected(int index) {
    return _selectedCloseIndices.contains(index);
  }

  void toggleCloseSelected(int index) {
    setState(() {
      if (_selectedCloseIndices.contains(index)) {
        _selectedCloseIndices.remove(index);
      } else {
        _selectedCloseIndices.add(index);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    isFavoriteList = List.generate(6, (_) => false, growable: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.white,
          padding: EdgeInsets.only(left: 15),
        ),
        title: Text('Followers',
            style: const TextStyle(
                fontSize: 24, color: Color.fromARGB(255, 255, 255, 255))),
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 69, 0, 103),
              Color.fromARGB(255, 0, 26, 130),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )),
        ),
      ),
      body: ListView.builder(
        itemCount: 11,
        itemBuilder: (BuildContext context, int index) {
          return _buildFollowersItem(
              'lib/images/${_getFollowersImageName(index)}.png',
              _getFollowersName(index),
              index);
        },
      ),
    );
  }

  String _getFollowersName(int index) {
    switch (index) {
      case 0:
        return 'Afsar Arif';
      case 1:
        return 'Kanye West';
      case 2:
        return 'Obama Obama';
      case 3:
        return 'Ice Spice';
      case 4:
        return 'Taylor Swift';
      case 5:
        return 'Aubrey Graham';
      case 6:
        return 'Muaaz Abed';
      case 7:
        return 'Snoop Dogg';
      case 8:
        return 'Vidhi Patel';
      case 9:
        return 'Doja Cat';
      case 10:
        return 'Abhishek Madhavan';
      default:
        return '';
    }
  }

  String _getFollowersImageName(int index) {
    switch (index) {
      case 0:
        return 'afsar';
      case 1:
        return 'kenye';
      case 2:
        return 'obama';
      case 3:
        return 'icespice';
      case 4:
        return 'taylor';
      case 5:
        return 'drake';
      case 6:
        return 'muaaz';
      case 7:
        return 'snoopdog';
      case 8:
        return 'vidhi';
      case 9:
        return 'doja';
      case 10:
        return 'abhi';
      default:
        return '';
    }
  }

  Widget _buildFollowersItem(String imagePath, String name, int index) {
    while (index >= isFavoriteList.length) {
      isFavoriteList.add(false);
    }

    bool isSelected = isFavoriteList[index];
    bool isHidden = _selectedCloseIndices.contains(index);
    bool showCloseIcon = isSelected ? false : !isHidden;

    return isHidden
        ? Container()
        : Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListTile(
              leading: SizedBox(
                child: Container(
                  alignment: Alignment.topLeft,
                  height: 50,
                  width: 50,
                  child: Image.asset(imagePath),
                ),
              ),
              title: Builder(builder: (context) {
                return Row(
                  children: [
                    Expanded(
                      child: Text(
                        name,
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 0.0),
                      child: IconButton(
                        iconSize: 40,
                        icon: isSelected
                            ? Icon(Icons.check, color: Colors.green)
                            : Icon(Icons.check),
                        onPressed: () {
                          setState(() {
                            isFavoriteList[index] = !isSelected;
                          });
                        },
                      ),
                    ),
                    Visibility(
                      visible: showCloseIcon,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 0.0),
                        child: IconButton(
                          iconSize: 40,
                          icon: Icon(
                            Icons.close,
                          ),
                          color: isHidden ? Colors.red : null,
                          onPressed: () {
                            toggleCloseSelected(index);
                          },
                        ),
                      ),
                    ),
                  ],
                );
              }),
            ),
          );
  }
}
