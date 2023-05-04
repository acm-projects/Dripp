import 'package:camera/camera.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:new_app/pages/camera_page.dart';
import 'package:new_app/pages/globals.dart';
import 'package:new_app/pages/profile_confirm_page.dart';
import 'package:new_app/pages/profile_page.dart';
import 'explore_confirm_page.dart';
import 'followers_page.dart';
import 'home_confirm_page.dart';
import 'home_page.dart';

class SuggestionsConfirmPage extends StatefulWidget {
  SuggestionsConfirmPage({Key? key}) : super(key: key);

  @override
  _SuggestionsConfirmPageState createState() => _SuggestionsConfirmPageState();
}

class _SuggestionsConfirmPageState extends State<SuggestionsConfirmPage> {
  int _selectedIndex = 0;
  final user = FirebaseAuth.instance.currentUser!;
  late List<CameraDescription> cameras;
  String? selectedColor = Globals.selectedColor;
  String? selectedColor2 = Globals.selectedColor2;

  final List<Map<String, dynamic>> _items = [];

  @override
  void initState() {
    super.initState();
    _getCameras();
    _populateItems();
  }

  void _populateItems() {
    if (Globals.selectedColor == 'White' && Globals.selectedColor2 == 'Indie') {
      //done
      _items.addAll([
        {
          'title': 'Marco Preston',
          'description': 'lost in the light',
        },
        {
          'title': 'Jessica Fleming',
          'description': 'Blank canvas, boundless dreams.',
        },
        {
          'title': 'Nannie Larsen',
          'description': 'in my element',
        },
        {
          'title': 'Zachariah Hicks',
          'description': 'how do I look?',
        },
        {
          'title': 'Shigeto Suzuki',
          'description': 'peace out',
        },
      ]);
    } else if (Globals.selectedColor == 'White' && //done
        Globals.selectedColor2 == 'Grunge') {
      _items.addAll([
        {
          'title': 'Emily Stevens',
          'description': 'lost in the light',
        },
        {
          'title': 'Onphin Bamrung',
          'description': 'sounds like distortion',
        },
        {
          'title': 'Margo Scotts',
          'description': 'in my element',
        },
        {
          'title': 'Daniel Zurita',
          'description': 'how do I look?',
        },
        {
          'title': 'Jack Franzen',
          'description': 'peace in the shadows',
        },
      ]);
    } else if (Globals.selectedColor == 'White' && //done
        Globals.selectedColor2 == 'Soft') {
      _items.addAll([
        {
          'title': 'Emily Stevens',
          'description': 'lost in the light',
        },
        {
          'title': 'Lydia Holder',
          'description': 'Choose love, spread kindness.',
        },
        {
          'title': 'Margo Scotts',
          'description': 'A touch of sweetness in a bitter world.',
        },
        {
          'title': 'Surirat Sophon',
          'description': 'chaos in softness',
        },
        {
          'title': 'Jackie Weatherman',
          'description': 'Gentle heart, fierce soul.',
        },
      ]);
    } else if (Globals.selectedColor == 'White' && //done
        Globals.selectedColor2 == 'Y2K') {
      _items.addAll([
        {
          'title': 'Nguyen Choy',
          'description': 'admire me',
        },
        {
          'title': 'Lydia Stevens',
          'description': 'Bringing fashion back.',
        },
        {
          'title': 'Russel Bullock',
          'description': 'modern twists',
        },
        {
          'title': 'Faya Borodin',
          'description': 'I\'m never out of style.',
        },
        {
          'title': 'Jackie Burns',
          'description': 'Walking in my own way',
        },
      ]);
    } else if (Globals.selectedColor == 'White' && //done
        Globals.selectedColor2 == 'Academia') {
      _items.addAll([
        {
          'title': 'Emerson Werner',
          'description': 'admire me',
        },
        {
          'title': 'Lydia Stevens',
          'description': 'Bringing fashion back.',
        },
        {
          'title': 'Phayom Khankaeo',
          'description': 'modern twists',
        },
        {
          'title': 'Faya Borodin',
          'description': 'I\'m never out of style.',
        },
        {
          'title': 'Jack White',
          'description': 'walking in my own way.',
        },
      ]);
    } else if (Globals.selectedColor == 'White' &&
        Globals.selectedColor2 == 'Kawaii') {
      _items.addAll([
        {
          'title': 'Glenna Long',
          'description': 'dreams and magical themes',
        },
        {
          'title': 'Zarina Shabanova',
          'description': 'Sparkling with kawaii charm.',
        },
        {
          'title': 'Faye Stout',
          'description': 'spreading happiness',
        },
        {
          'title': 'Hanae Toshima',
          'description': 'im the adorable side of life',
        },
        {
          'title': 'Angel Torres',
          'description': 'Every day is kawaii day.',
        },
      ]);
    } else if (Globals.selectedColor == 'White' &&
        Globals.selectedColor2 == 'Vintage') {
      _items.addAll([
        {
          'title': 'Zachariah Hicks',
          'description': 'how do I look?',
        },
        {
          'title': 'Somchati Sithong',
          'description': 'Bringing style back.',
        },
        {
          'title': 'Devin Mahoney',
          'description': 'modern twists',
        },
        {
          'title': 'Wilburn Sharp',
          'description': 'out and about.',
        },
        {
          'title': 'Nannie Larsen',
          'description': 'in my element',
        },
      ]);
    } else if (Globals.selectedColor == 'White' &&
        Globals.selectedColor2 == 'Boho') {
      _items.addAll([
        {
          'title': 'Eloise Mccann',
          'description': 'admire me',
        },
        {
          'title': 'Lenny Terry',
          'description': 'Bringing fashion back.',
        },
        {
          'title': 'Iris Spence',
          'description': 'spread love',
        },
        {
          'title': 'Sheree Murillo',
          'description': 'how do I look?',
        },
        {
          'title': 'Jack White',
          'description': 'existing in my own way',
        },
      ]);
    } else if (Globals.selectedColor == 'Pink' &&
        Globals.selectedColor2 == 'Indie') {
      _items.addAll([
        {
          'title': 'Margie Cerys',
          'description': 'still waiting for you',
        },
        {
          'title': 'Ria Hazel',
          'description': 'smiling!',
        },
        {
          'title': 'Alexia Sandra',
          'description': 'Classy',
        },
        {
          'title': 'Tessa Bell',
          'description': 'just another dreamer',
        },
        {
          'title': 'Michelle Sha',
          'description': 'Flower Girl',
        },
      ]);
    } else if (Globals.selectedColor == 'Pink' &&
        Globals.selectedColor2 == 'Grunge') {
      _items.addAll([
        {
          'title': 'Emily Stevens',
          'description': 'lost in the light',
        },
        {
          'title': 'Whitney Beck',
          'description': 'sounds like distortion',
        },
        {
          'title': 'Margo Scotts',
          'description': 'in my element',
        },
        {
          'title': 'Natalie Small',
          'description': 'Etched into my soul.',
        },
        {
          'title': 'Jack Gants',
          'description': 'Out with my style',
        },
      ]);
    } else if (Globals.selectedColor == 'Pink' &&
        Globals.selectedColor2 == 'Soft') {
      _items.addAll([
        {
          'title': 'Emily Stevens',
          'description': 'lost in the light',
        },
        {
          'title': 'Lydia Holder',
          'description': 'Choose love, spread kindness.',
        },
        {
          'title': 'Jack Gants',
          'description': 'beauty in the beholder',
        },
        {
          'title': 'Jackie Smalls',
          'description': 'chaos in softness',
        },
        {
          'title': 'Lao Rueankham',
          'description': 'gentle heart',
        },
      ]);
    } else if (Globals.selectedColor == 'Pink' &&
        Globals.selectedColor2 == 'Y2K') {
      _items.addAll([
        {
          'title': 'Nguyen Choy',
          'description': 'admire me',
        },
        {
          'title': 'Troy Stevens',
          'description': 'Bringing pink back.',
        },
        {
          'title': 'Lydia Holder',
          'description': 'look my way once',
        },
        {
          'title': 'Owen Lopez',
          'description': 'fresh look',
        },
        {
          'title': 'Jackie Burns',
          'description': 'Walking in my own way',
        },
      ]);
    } else if (Globals.selectedColor == 'Pink' &&
        Globals.selectedColor2 == 'Academia') {
      _items.addAll([
        {
          'title': 'Anastasia Hill',
          'description': 'Class and Style',
        },
        {
          'title': 'Lydia Stevens',
          'description': 'Bringing fashion back.',
        },
        {
          'title': 'Cecelia Callahan',
          'description': 'My favorite coat!',
        },
        {
          'title': 'Faya Borodin',
          'description': 'never out of style!',
        },
        {
          'title': 'Jackie White',
          'description': 'tennis season',
        },
      ]);
    } else if (Globals.selectedColor == 'Pink' &&
        Globals.selectedColor2 == 'Kawaii') {
      _items.addAll([
        {
          'title': 'Glenna Long',
          'description': 'dreams and magical themes',
        },
        {
          'title': 'Zarina Shabanova',
          'description': 'Sparkling with kawaii charm.',
        },
        {
          'title': 'Caitlin Bartlett',
          'description': 'bunny love',
        },
        {
          'title': 'Faya Borodin',
          'description': 'never out of style!',
        },
        {
          'title': 'Nguyen Choy',
          'description': 'how do I look?',
        },
      ]);
    } else if (Globals.selectedColor ==
            'Pink' && //start here start here start here start here start here start here start here start here start here start here start here start here start here start here start here
        Globals.selectedColor2 == 'Vintage') {
      _items.addAll([
        {
          'title': 'Margie Cerys',
          'description': 'still waiting for you',
        },
        {
          'title': 'Lydia Stevens',
          'description': 'Bringing fashion back.',
        },
        {
          'title': 'Faya Borodin',
          'description': 'I\'m never out of style.',
        },
        {
          'title': 'Noreen Mercer',
          'description': 'bright day today',
        },
        {
          'title': 'Angeline Huffman',
          'description': 'admire me',
        },
      ]);
    } else if (Globals.selectedColor == 'Pink' &&
        Globals.selectedColor2 == 'Boho') {
      _items.addAll([
        {
          'title': 'Margie Cerys',
          'description': 'still waiting for you',
        },
        {
          'title': 'Lydia Stevens',
          'description': 'Bringing fashion back.',
        },
        {
          'title': 'Angeline Huffman',
          'description': 'Out and about!',
        },
        {
          'title': 'Faya Borodin',
          'description': 'I\'m never out of style.',
        },
        {
          'title': 'Debra Luna',
          'description': 'nature is my home',
        },
      ]);
    } else if (Globals.selectedColor == 'Red' && //new color
        Globals.selectedColor2 == 'Indie') {
      _items.addAll([
        {
          'title': 'Lydia Stevens',
          'description': 'admire me',
        },
        {
          'title': 'Alexia Hazel',
          'description': 'dreaming of strawberries',
        },
        {
          'title': 'Bryce Guerrero',
          'description': 'lover boy',
        },
        {
          'title': 'Lottie Becker',
          'description': 'My new cute fit!',
        },
        {
          'title': 'Jackie White',
          'description': 'stylish in my own way.',
        },
      ]);
    } else if (Globals.selectedColor == 'Red' &&
        Globals.selectedColor2 == 'Grunge') {
      _items.addAll([
        {
          'title': 'Daniel Zurita',
          'description': 'Looks can haunt.',
        },
        {
          'title': 'Jack Stevens',
          'description': 'flaming hot',
        },
        {
          'title': 'Rebecca Mccarty',
          'description': 'in my element',
        },
        {
          'title': 'Jeannette Cox',
          'description': 'how do I look?',
        },
        {
          'title': 'Jackie Fran',
          'description': 'lost in the light, peace in the shadows',
        },
      ]);
    } else if (Globals.selectedColor == 'Red' &&
        Globals.selectedColor2 == 'Soft') {
      _items.addAll([
        {
          'title': 'Jack Franzen',
          'description': 'lost in the light',
        },
        {
          'title': 'Lydia Holder',
          'description': 'choose love, spread kindness.',
        },
        {
          'title': 'Jarod Holden',
          'description': 'A touch of red.',
        },
        {
          'title': 'Stephanie Hans',
          'description': 'soft to the touch',
        },
        {
          'title': 'Faya Borodin',
          'description': 'I\'m never out of style.',
        },
      ]);
    } else if (Globals.selectedColor == 'Red' &&
        Globals.selectedColor2 == 'Y2K') {
      _items.addAll([
        {
          'title': 'Russel Bullock',
          'description': 'modern twists',
        },
        {
          'title': 'Lydia Stevens',
          'description': 'Bringing fashion back.',
        },
        {
          'title': 'Brent Kennedy',
          'description': 'modern twists',
        },
        {
          'title': 'Faya Borodin',
          'description': 'always in style',
        },
        {
          'title': 'Tammy Beasley',
          'description': 'Focus on me',
        },
      ]);
    } else if (Globals.selectedColor == 'Red' &&
        Globals.selectedColor2 == 'Academia') {
      _items.addAll([
        {
          'title': 'Mindy Barron',
          'description': 'Walking in my own way',
        },
        {
          'title': 'Lydia Stevens',
          'description': 'Bringing fashion back.',
        },
        {
          'title': 'Phayom Khankaeo',
          'description': 'modern twists',
        },
        {
          'title': 'Faya Borodin',
          'description': 'I\'m never out of style.',
        },
        {
          'title': 'Panida Singthong',
          'description': 'stylish in my own way.',
        },
      ]);
    } else if (Globals.selectedColor == 'Red' &&
        Globals.selectedColor2 == 'Kawaii') {
      _items.addAll([
        {
          'title': 'Emily Werner',
          'description': 'admire me',
        },
        {
          'title': 'Lydia Stevens',
          'description': 'Bringing fashion back.',
        },
        {
          'title': 'Phayom Khankaeo',
          'description': 'modern twists',
        },
        {
          'title': 'Faya Borodin',
          'description': 'I\'m never out of style.',
        },
        {
          'title': 'Jackie Whitney',
          'description': 'dressed to my aesthetic',
        },
      ]);
    } else if (Globals.selectedColor == 'Red' &&
        Globals.selectedColor2 == 'Vintage') {
      _items.addAll([
        {
          'title': 'Lydia Stevens',
          'description': 'admire me',
        },
        {
          'title': 'Alexia Hazel',
          'description': 'dreaming of strawberries',
        },
        {
          'title': 'Bryce Guerrero',
          'description': 'lover boy',
        },
        {
          'title': 'Lottie Becker',
          'description': 'My new cute fit!',
        },
        {
          'title': 'Jackie White',
          'description': 'stylish in my own way.',
        },
      ]);
    } else if (Globals.selectedColor == 'Red' &&
        Globals.selectedColor2 == 'Boho') {
      _items.addAll([
        {
          'title': 'Sheree Murillo',
          'description': 'how do I look?',
        },
        {
          'title': 'Lottie Becker',
          'description': 'My new cute fit!',
        },
        {
          'title': 'Faya Borodin',
          'description': 'I\'m never out of style.',
        },
        {
          'title': 'Jennifer Borodin',
          'description': 'feeling free and in love',
        },
        {
          'title': 'Jackie White',
          'description': 'walking in my own shoes.',
        },
      ]);
    } else if (Globals.selectedColor == 'Orange' && //new color
        Globals.selectedColor2 == 'Indie') {
      _items.addAll([
        {
          'title': 'Margie Cerys',
          'description': 'smiling!',
        },
        {
          'title': 'Ria Hazel',
          'description': 'Tangerine Dream!',
        },
        {
          'title': 'Alexia Sandra',
          'description': 'Styling my favorite look',
        },
        {
          'title': 'Winston Mclean',
          'description': 'how do I look?',
        },
        {
          'title': 'Michelle Sha',
          'description': 'Flower Girl',
        },
      ]);
    } else if (Globals.selectedColor == 'Orange' &&
        Globals.selectedColor2 == 'Grunge') {
      _items.addAll([
        {
          'title': 'Emily Stevens',
          'description': 'lost in the dark',
        },
        {
          'title': 'Annika Greens',
          'description': 'Sounds like distortion',
        },
        {
          'title': 'Margo Scotts',
          'description': 'in my element',
        },
        {
          'title': 'Dani Grace',
          'description': 'how do I look?',
        },
        {
          'title': 'Jackie Weathers',
          'description': 'Peace in the shadows',
        },
      ]);
    } else if (Globals.selectedColor == 'Orange' &&
        Globals.selectedColor2 == 'Soft') {
      _items.addAll([
        {
          'title': 'Winston Mclean',
          'description': 'how do I look?',
        },
        {
          'title': 'Lydia Holder',
          'description': 'Choose love, spread kindness.',
        },
        {
          'title': 'Margo Scotts',
          'description': 'A touch of sweetness in a bitter world.',
        },
        {
          'title': 'Surirat Sophon',
          'description': 'chaos in softness',
        },
        {
          'title': 'Jackie Weatherman',
          'description': 'Gentle heart, fierce soul.',
        },
      ]);
    } else if (Globals.selectedColor == 'Orange' &&
        Globals.selectedColor2 == 'Y2K') {
      _items.addAll([
        {
          'title': 'Tammy Beasley',
          'description': 'focus on me',
        },
        {
          'title': 'Lydia Stevens',
          'description': 'Bringing fashion back.',
        },
        {
          'title': 'Raine Bullock',
          'description': 'modern twists',
        },
        {
          'title': 'Faya Borodin',
          'description': 'I\'m never out of style.',
        },
        {
          'title': 'Jackie Burns',
          'description': 'Living in my own way',
        },
      ]);
    } else if (Globals.selectedColor == 'Orange' &&
        Globals.selectedColor2 == 'Academia') {
      _items.addAll([
        {
          'title': 'Emerson Werner',
          'description': 'admire me',
        },
        {
          'title': 'Lydia Stevens',
          'description': 'Bringing fashion back.',
        },
        {
          'title': 'Jessica Lions',
          'description': 'modern twists',
        },
        {
          'title': 'Faya Borodin',
          'description': 'I\'m never out of style.',
        },
        {
          'title': 'Jackie White',
          'description': 'walking in my own way.',
        },
      ]);
    } else if (Globals.selectedColor == 'Orange' &&
        Globals.selectedColor2 == 'Kawaii') {
      _items.addAll([
        {
          'title': 'Phayom Khankaeo',
          'description': 'citrus freshness',
        },
        {
          'title': 'Lydia Stevens',
          'description': 'Bringing fashion back.',
        },
        {
          'title': 'Faya Borodin',
          'description': 'modern twists',
        },
        {
          'title': 'Phayom Khankaeo',
          'description': 'I\'m never out of style.',
        },
        {
          'title': 'Jackie White',
          'description': 'living in my own way.',
        },
      ]);
    } else if (Globals.selectedColor == 'Orange' &&
        Globals.selectedColor2 == 'Vintage') {
      _items.addAll([
        {
          'title': 'Noreen Mercer',
          'description': 'bright day today',
        },
        {
          'title': 'Alexia Sandra',
          'description': 'Styling my favorite look',
        },
        {
          'title': 'Winston Mclean',
          'description': 'how do I look?',
        },
        {
          'title': 'Faya Borodin',
          'description': 'I\'m never out of style.',
        },
        {
          'title': 'Jackie White',
          'description': 'living in my own way.',
        },
      ]);
    } else if (Globals.selectedColor == 'Orange' &&
        Globals.selectedColor2 == 'Boho') {
      _items.addAll([
        {
          'title': 'Ria Hazel',
          'description': 'Tangerine Dream!',
        },
        {
          'title': 'Alexia Sandra',
          'description': 'Styling my favorite look',
        },
        {
          'title': 'Lydia Stevens',
          'description': 'soaking in the sunlight',
        },
        {
          'title': 'Jackie West',
          'description': 'walking in my own way.',
        },
        {
          'title': 'Beth Paxton',
          'description': 'Discover the unknown',
        },
      ]);
    } else if (Globals.selectedColor == 'Yellow' && //new color
        Globals.selectedColor2 == 'Indie') {
      _items.addAll([
        {
          'title': 'Margie Cerys',
          'description': 'smiling!',
        },
        {
          'title': 'Ria Hazel',
          'description': 'Explore the sunshine',
        },
        {
          'title': 'Alexia Sandra',
          'description': 'sunshine time',
        },
        {
          'title': 'Tessa Bell',
          'description': 'just another dreamer',
        },
        {
          'title': 'Jack Hones',
          'description': 'Sunlight follows me',
        },
      ]);
    } else if (Globals.selectedColor == 'Yellow' &&
        Globals.selectedColor2 == 'Grunge') {
      _items.addAll([
        {
          'title': 'Emily Stevens',
          'description': 'lost in the light',
        },
        {
          'title': 'Zach Levington',
          'description': 'Sounds like distortion',
        },
        {
          'title': 'Margo Scotts',
          'description': 'in my element',
        },
        {
          'title': 'Daniel Zurita',
          'description': 'how do I look?',
        },
        {
          'title': 'Jackie Franzen',
          'description': 'Peace in the shadows',
        },
      ]);
    } else if (Globals.selectedColor == 'Yellow' &&
        Globals.selectedColor2 == 'Soft') {
      _items.addAll([
        {
          'title': 'Jack Franzen',
          'description': 'lost in the light',
        },
        {
          'title': 'Lydia Holder',
          'description': 'Choose love, spread kindness.',
        },
        {
          'title': 'Margo Scotts',
          'description': 'A touch of sweetness in a bitter world.',
        },
        {
          'title': 'Ruby Herald',
          'description': 'smiling in softness',
        },
        {
          'title': 'Jackie Weatherman',
          'description': 'Gentle Soul.',
        },
      ]);
    } else if (Globals.selectedColor == 'Yellow' &&
        Globals.selectedColor2 == 'Y2K') {
      _items.addAll([
        {
          'title': 'Tessa Bell',
          'description': 'just another dreamer',
        },
        {
          'title': 'Lydia Stevens',
          'description': 'Bringing fashion back.',
        },
        {
          'title': 'Alex Bullock',
          'description': 'modern twists',
        },
        {
          'title': 'Faya Borodin',
          'description': 'I\'m never out of style.',
        },
        {
          'title': 'Jackie Burns',
          'description': 'Walking in my own way',
        },
      ]);
    } else if (Globals.selectedColor == 'Yellow' &&
        Globals.selectedColor2 == 'Academia') {
      _items.addAll([
        {
          'title': 'Lydia Stevens',
          'description': 'Bringing fashion back.',
        },
        {
          'title': 'Emily Wenner',
          'description': 'coffee shop love',
        },
        {
          'title': 'Jarvis Carey',
          'description': 'modern twists',
        },
        {
          'title': 'Amber White',
          'description': 'I\'m never out of style.',
        },
        {
          'title': 'Faya Borodin',
          'description': 'walking in my own way.',
        },
      ]);
    } else if (Globals.selectedColor == 'Yellow' &&
        Globals.selectedColor2 == 'Kawaii') {
      _items.addAll([
        {
          'title': 'Emily Scotts',
          'description': 'Cuteness in a package',
        },
        {
          'title': 'Lydia Stevens',
          'description': 'Bringing fashion back.',
        },
        {
          'title': 'Phayom Khankaeo',
          'description': 'modern twists',
        },
        {
          'title': 'Faya Borodin',
          'description': 'I\'m never out of style.',
        },
        {
          'title': 'Panida Singthong',
          'description': 'living in my own way',
        },
      ]);
    } else if (Globals.selectedColor == 'Yellow' &&
        Globals.selectedColor2 == 'Vintage') {
      _items.addAll([
        {
          'title': 'Ria Hazel',
          'description': 'explore the sunshine',
        },
        {
          'title': 'Alexia Sandra',
          'description': 'sunshine time',
        },
        {
          'title': 'Ophelia Farrell',
          'description': 'sunshine wherever I go!',
        },
        {
          'title': 'Kurt Thomas',
          'description': 'I\'m never out of style.',
        },
        {
          'title': 'Jack White',
          'description': 'walking in my own way.',
        },
      ]);
    } else if (Globals.selectedColor == 'Yellow' &&
        Globals.selectedColor2 == 'Boho') {
      _items.addAll([
        {
          'title': 'Sheree Murillo',
          'description': 'how do I look?',
        },
        {
          'title': 'Faya Borodin',
          'description': 'I\'m never out of style.',
        },
        {
          'title': 'Annika Grant',
          'description': 'soaking in the light',
        },
        {
          'title': 'Ophelia Farrell',
          'description': 'sunshine wherever I go!',
        },
        {
          'title': 'Jackie Wilson',
          'description': 'living in my own world.',
        },
      ]);
    } else if (Globals.selectedColor == 'Green' && //new color
        Globals.selectedColor2 == 'Indie') {
      _items.addAll([
        {
          'title': 'Hershel Murphy',
          'description': 'Finding my way',
        },
        {
          'title': 'Aurora Dudley',
          'description': 'smiling!',
        },
        {
          'title': 'Jackie West',
          'description': 'Walking in my own way.',
        },
        {
          'title': 'Emily Stevens',
          'description': 'lost in the reflection',
        },
        {
          'title': 'Michelle Sha',
          'description': 'Nature Girl',
        },
      ]);
    } else if (Globals.selectedColor == 'Green' &&
        Globals.selectedColor2 == 'Grunge') {
      _items.addAll([
        {
          'title': 'Lydie Stevens',
          'description': 'In my element.',
        },
        {
          'title': 'Rufus Livingston',
          'description': 'sounds like distortion',
        },
        {
          'title': 'Margo Scotts',
          'description': 'in my element',
        },
        {
          'title': 'Billie Eilish',
          'description': 'I\'m the Bad Guy',
        },
        {
          'title': 'Jackie Franz',
          'description': 'how do I look?',
        },
      ]);
    } else if (Globals.selectedColor == 'Green' &&
        Globals.selectedColor2 == 'Soft') {
      _items.addAll([
        {
          'title': 'Emily Stevens',
          'description': 'lost in the reflection',
        },
        {
          'title': 'Jacob Holder',
          'description': 'Peace in solace',
        },
        {
          'title': 'Margo Scotts',
          'description': 'A touch of sweetness in a bitter world.',
        },
        {
          'title': 'Jackie Weatherman',
          'description': 'chaos in softness',
        },
        {
          'title': 'Surirat Sophon',
          'description': 'Gentle heart, fierce soul.',
        },
      ]);
    } else if (Globals.selectedColor == 'Green' &&
        Globals.selectedColor2 == 'Y2K') {
      _items.addAll([
        {
          'title': 'Nguyen Choy',
          'description': 'admire me',
        },
        {
          'title': 'Lydia Stevens',
          'description': 'Bringing fashion back.',
        },
        {
          'title': 'Juliette Cooley',
          'description': 'modern twists',
        },
        {
          'title': 'Faya Borodin',
          'description': 'I\'m never out of style.',
        },
        {
          'title': 'Jackie Burns',
          'description': 'Walking in my own way',
        },
      ]);
    } else if (Globals.selectedColor == 'Green' &&
        Globals.selectedColor2 == 'Academia') {
      _items.addAll([
        {
          'title': 'Essie Bright',
          'description': 'leaving the coffee shop',
        },
        {
          'title': 'Dwight Rollins',
          'description': 'Bringing fashion back.',
        },
        {
          'title': 'Rudy Wu',
          'description': 'clear mind',
        },
        {
          'title': 'Faya Borodin',
          'description': 'coffee lover',
        },
        {
          'title': 'Traci Lam',
          'description': 'walking in my own way.',
        },
      ]);
    } else if (Globals.selectedColor == 'Green' &&
        Globals.selectedColor2 == 'Kawaii') {
      _items.addAll([
        {
          'title': 'Juliette Cooley',
          'description': 'admire me',
        },
        {
          'title': 'Lydia Stevens',
          'description': 'Bringing fashion back.',
        },
        {
          'title': 'Phayom Khankaeo',
          'description': 'modern twists',
        },
        {
          'title': 'Faya Borodin',
          'description': 'I\'m never out of style.',
        },
        {
          'title': 'Winnie White',
          'description': 'walking in my own way.',
        },
      ]);
    } else if (Globals.selectedColor == 'Green' &&
        Globals.selectedColor2 == 'Vintage') {
      _items.addAll([
        {
          'title': 'Lydia Stevens',
          'description': 'admire me',
        },
        {
          'title': 'Kaeo Song',
          'description': 'Bringing fashion back.',
        },
        {
          'title': 'Jack White',
          'description': 'dreaming of flowers',
        },
        {
          'title': 'Molly Wells',
          'description': 'never out of style.',
        },
        {
          'title': 'Angelita Carrillo',
          'description': 'peace in home',
        },
      ]);
    } else if (Globals.selectedColor == 'Green' &&
        Globals.selectedColor2 == 'Boho') {
      _items.addAll([
        {
          'title': 'Lenny Terry',
          'description': 'Bringing fashion back.',
        },
        {
          'title': 'Sheree Murillo',
          'description': 'how do I look?',
        },
        {
          'title': 'Sharron Henry',
          'description': 'in my element',
        },
        {
          'title': 'Faya Borodin',
          'description': 'I\'m never out of style.',
        },
        {
          'title': 'Jackie West',
          'description': 'walking in my own way.',
        },
      ]);
    } else if (Globals.selectedColor == 'Blue' && //new color
        Globals.selectedColor2 == 'Indie') {
      _items.addAll([
        {
          'title': 'Jessica Fleming',
          'description': 'Blank canvas, boundless dreams.',
        },
        {
          'title': 'Toney Mcmahon',
          'description': 'Clouds in the sky.',
        },
        {
          'title': 'Ben Rowe',
          'description': 'lost in the view',
        },
        {
          'title': 'Scott Marsh',
          'description': 'Drift out',
        },
        {
          'title': 'Michelle Sha',
          'description': 'snow girl',
        },
      ]);
    } else if (Globals.selectedColor == 'Blue' &&
        Globals.selectedColor2 == 'Grunge') {
      _items.addAll([
        {
          'title': 'Emily Stevens',
          'description': 'lost in the light',
        },
        {
          'title': 'Michelle Daniels',
          'description': 'Sounds like distortion',
        },
        {
          'title': 'Onphin Bamrung',
          'description': 'in my element',
        },
        {
          'title': 'Margo Scotts',
          'description': 'how do I look?',
        },
        {
          'title': 'Jackie Franzen',
          'description': 'Peace in the shadows',
        },
      ]);
    } else if (Globals.selectedColor == 'Blue' &&
        Globals.selectedColor2 == 'Soft') {
      _items.addAll([
        {
          'title': 'Margo Scotts',
          'description': 'A touch of sweetness in a bitter world.',
        },
        {
          'title': 'Lydia Holder',
          'description': 'Choose love, spread kindness.',
        },
        {
          'title': 'Margo Scotts',
          'description': 'A touch of sweetness in a bitter world.',
        },
        {
          'title': 'Surirat Sophon',
          'description': 'chaos in softness',
        },
        {
          'title': 'Jack Weatherman',
          'description': 'Gentle heart, fierce soul.',
        },
      ]);
    } else if (Globals.selectedColor == 'Blue' &&
        Globals.selectedColor2 == 'Y2K') {
      _items.addAll([
        {
          'title': 'Emily Stevens',
          'description': 'Lost in the light',
        },
        {
          'title': 'Tammy Beasley',
          'description': 'focus on me',
        },
        {
          'title': 'Megan Bullock',
          'description': 'modern twists',
        },
        {
          'title': 'Jackson Burns',
          'description': 'I\'m never out of style.',
        },
        {
          'title': 'Faya Borodin',
          'description': 'Walking through the stars',
        },
      ]);
    } else if (Globals.selectedColor == 'Blue' &&
        Globals.selectedColor2 == 'Academia') {
      _items.addAll([
        {
          'title': 'Linden Werner',
          'description': 'library day',
        },
        {
          'title': 'Penelope Stevens',
          'description': 'Bringing fashion back.',
        },
        {
          'title': 'Emily Wells',
          'description': 'modern twists',
        },
        {
          'title': 'Faya Borodin',
          'description': 'I\'m never out of style.',
        },
        {
          'title': 'Jack White',
          'description': 'walking in my own way.',
        },
      ]);
    } else if (Globals.selectedColor == 'Blue' &&
        Globals.selectedColor2 == 'Kawaii') {
      _items.addAll([
        {
          'title': 'Angel Torres',
          'description': 'Every day is kawaii day.',
        },
        {
          'title': 'Phayom Khankaeo',
          'description': 'modern twists',
        },
        {
          'title': 'Lydia Stevens',
          'description': 'Bringing fashion back.',
        },
        {
          'title': 'Faya Borodin',
          'description': 'I\'m never out of style.',
        },
        {
          'title': 'Katy Serrano',
          'description': 'walking in my own way.',
        },
      ]);
    } else if (Globals.selectedColor == 'Blue' &&
        Globals.selectedColor2 == 'Vintage') {
      _items.addAll([
        {
          'title': 'Lydia Stevens',
          'description': 'admire me',
        },
        {
          'title': 'Toney Mcmahon',
          'description': 'Clouds in the sky.',
        },
        {
          'title': 'Scott Marsh',
          'description': 'Drift out',
        },
        {
          'title': 'Michelle Sha',
          'description': 'snow girl',
        },
        {
          'title': 'Hilda Gram',
          'description': 'Choose love, spread kindness.',
        },
      ]);
    } else if (Globals.selectedColor == 'Blue' &&
        Globals.selectedColor2 == 'Boho') {
      _items.addAll([
        {
          'title': 'Iris Spence',
          'description': 'spread love',
        },
        {
          'title': 'Sheree Murillo',
          'description': 'how do I look?',
        },
        {
          'title': 'Phayom Khankaeo',
          'description': 'modern twists',
        },
        {
          'title': 'Faya Borodin',
          'description': 'I\'m never out of style.',
        },
        {
          'title': 'Jackie Whitney',
          'description': 'dancing in my own way.',
        },
      ]);
    } else if (Globals.selectedColor == 'Purple' && //new color
        Globals.selectedColor2 == 'Indie') {
      _items.addAll([
        {
          'title': 'Margie Cerys',
          'description': 'still waiting for you',
        },
        {
          'title': 'Morris Fry',
          'description': 'styling in violets',
        },
        {
          'title': 'Alexia Sandra',
          'description': 'Classy',
        },
        {
          'title': 'Tessa Bell',
          'description': 'just another dreamer',
        },
        {
          'title': 'Michelle Sha',
          'description': 'Flower Girl',
        },
      ]);
    } else if (Globals.selectedColor == 'Purple' &&
        Globals.selectedColor2 == 'Grunge') {
      _items.addAll([
        {
          'title': 'Iris Stevens',
          'description': 'lost in the darkness',
        },
        {
          'title': 'Margo Scotts',
          'description': 'Dreaming of a way out',
        },
        {
          'title': 'Surirat Sophon',
          'description': 'in my element',
        },
        {
          'title': 'Dani Bullock',
          'description': 'How do I look?',
        },
        {
          'title': 'Jackie Franzen',
          'description': 'peace in the shadows',
        },
      ]);
    } else if (Globals.selectedColor == 'Purple' &&
        Globals.selectedColor2 == 'Soft') {
      _items.addAll([
        {
          'title': 'Emily Stevens',
          'description': 'lost in the light',
        },
        {
          'title': 'Raul Hogan',
          'description': 'chaos and comfort',
        },
        {
          'title': 'Margo Scotts',
          'description': 'A touch of sweetness in a bitter world.',
        },
        {
          'title': 'Sammy Garder',
          'description': 'chaos in softness',
        },
        {
          'title': 'Jackie Weatherman',
          'description': 'Gentle heart.',
        },
      ]);
    } else if (Globals.selectedColor == 'Purple' &&
        Globals.selectedColor2 == 'Y2K') {
      _items.addAll([
        {
          'title': 'Nguyen Choy',
          'description': 'admire me',
        },
        {
          'title': 'Lydia Stevens',
          'description': 'Bringing fashion back.',
        },
        {
          'title': 'Faya Borodin',
          'description': 'modern twists',
        },
        {
          'title': 'Surirat Sophon',
          'description': 'I\'m never out of style.',
        },
        {
          'title': 'Jackie Burns',
          'description': 'Walking in my own way',
        },
      ]);
    } else if (Globals.selectedColor == 'Purple' &&
        Globals.selectedColor2 == 'Academia') {
      _items.addAll([
        {
          'title': 'Jackie Werner',
          'description': 'admire me',
        },
        {
          'title': 'Lydia Stevens',
          'description': 'Bringing fashion back.',
        },
        {
          'title': 'Jenny Longstein',
          'description': 'modern twists',
        },
        {
          'title': 'Faya Borodin',
          'description': 'I\'m never out of style.',
        },
        {
          'title': 'Jackie White',
          'description': 'walking in my own way.',
        },
      ]);
    } else if (Globals.selectedColor == 'Purple' &&
        Globals.selectedColor2 == 'Kawaii') {
      _items.addAll([
        {
          'title': 'Faya Borodin',
          'description': 'I\'m never out of style.',
        },
        {
          'title': 'Lydia Stevens',
          'description': 'Bringing fashion back.',
        },
        {
          'title': 'Jamie Grant',
          'description': 'modern twists',
        },
        {
          'title': 'Faya Borodin',
          'description': 'I\'m never out of style.',
        },
        {
          'title': 'Jackie White',
          'description': 'walking in my own way.',
        },
      ]);
    } else if (Globals.selectedColor == 'Purple' &&
        Globals.selectedColor2 == 'Vintage') {
      _items.addAll([
        {
          'title': 'Dianna Barron',
          'description': 'look only at me',
        },
        {
          'title': 'Morris Fry',
          'description': 'styling in violets',
        },
        {
          'title': 'Alexia Sandra',
          'description': 'Classy',
        },
        {
          'title': 'Tessa Bell',
          'description': 'just another dreamer',
        },
        {
          'title': 'Jack White',
          'description': 'living in my own way.',
        },
      ]);
    } else if (Globals.selectedColor == 'Purple' &&
        Globals.selectedColor2 == 'Boho') {
      _items.addAll([
        {
          'title': 'Dianna Barron',
          'description': 'look only at me',
        },
        {
          'title': 'Lydia Stevens',
          'description': 'Bringing fashion back.',
        },
        {
          'title': 'Jennifer Gold',
          'description': 'modern twists',
        },
        {
          'title': 'Faya Borodin',
          'description': 'I\'m never out of style.',
        },
        {
          'title': 'Jackie White',
          'description': 'walking in my own way.',
        },
      ]);
    } else if (Globals.selectedColor == 'Brown' && //new color
        Globals.selectedColor2 == 'Indie') {
      _items.addAll([
        {
          'title': 'Tom Huff',
          'description': 'chasing the dream',
        },
        {
          'title': 'Jackie West',
          'description': 'Walking in my own way.',
        },
        {
          'title': 'Alexia Sandra',
          'description': 'styling',
        },
        {
          'title': 'Cole Bell',
          'description': 'just another dreamer',
        },
        {
          'title': 'Shane Jordan',
          'description': 'Discovering myself too',
        },
      ]);
    } else if (Globals.selectedColor == 'Brown' &&
        Globals.selectedColor2 == 'Grunge') {
      _items.addAll([
        {
          'title': 'Emily Stevens',
          'description': 'lost in the light',
        },
        {
          'title': 'Jackson Thomas',
          'description': 'Sounds like distortion',
        },
        {
          'title': 'Margo Scotts',
          'description': 'in my element',
        },
        {
          'title': 'Ginny Kline',
          'description': 'how do I look?',
        },
        {
          'title': 'Tracy Franzen',
          'description': 'Peace in the shadows',
        },
      ]);
    } else if (Globals.selectedColor == 'Brown' &&
        Globals.selectedColor2 == 'Soft') {
      _items.addAll([
        {
          'title': 'Jack Franzen',
          'description': 'lost in the light',
        },
        {
          'title': 'Tom Huff',
          'description': 'chasing the dream',
        },
        {
          'title': 'Jarod Holden',
          'description': 'Blessing in disguise',
        },
        {
          'title': 'Surirat Sophon',
          'description': 'chaos in softness',
        },
        {
          'title': 'Jackie Weatherman',
          'description': 'Gentle being.',
        },
      ]);
    } else if (Globals.selectedColor == 'Brown' &&
        Globals.selectedColor2 == 'Y2K') {
      _items.addAll([
        {
          'title': 'Lydia Stevens',
          'description': 'Bringing fashion back.',
        },
        {
          'title': 'Jamie Stevens',
          'description': 'fresh look today.',
        },
        {
          'title': 'Tessa Bullock',
          'description': 'modern twists',
        },
        {
          'title': 'Faya Borodin',
          'description': 'I\'m never out of style.',
        },
        {
          'title': 'Jackie Burns',
          'description': 'Walking in my own way',
        },
      ]);
    } else if (Globals.selectedColor == 'Brown' &&
        Globals.selectedColor2 == 'Academia') {
      _items.addAll([
        {
          'title': 'Jack White',
          'description': 'walking in my own way.',
        },
        {
          'title': 'Phayom Khankaeo',
          'description': 'modern twists',
        },
        {
          'title': 'Faya Borodin',
          'description': 'I\'m never out of style.',
        },
        {
          'title': 'Jackie West',
          'description': 'walking in my own way.',
        },
        {
          'title': 'Hannah White',
          'description': 'dressed to impress',
        },
      ]);
    } else if (Globals.selectedColor == 'Brown' &&
        Globals.selectedColor2 == 'Kawaii') {
      _items.addAll([
        {
          'title': 'Emily Werner',
          'description': 'admire me',
        },
        {
          'title': 'Lydia Stevens',
          'description': 'Bringing fashion back.',
        },
        {
          'title': 'Phayom Khankaeo',
          'description': 'modern twists',
        },
        {
          'title': 'Faya Borodin',
          'description': 'I\'m never out of style.',
        },
        {
          'title': 'Jackie White',
          'description': 'walking in my own way.',
        },
      ]);
    } else if (Globals.selectedColor == 'Brown' &&
        Globals.selectedColor2 == 'Vintage') {
      _items.addAll([
        {
          'title': 'Lydia Stevens',
          'description': 'Bringing fashion back.',
        },
        {
          'title': 'Arnold Spears',
          'description': 'modern twists',
        },
        {
          'title': 'Tom Huff',
          'description': 'chasing the dream',
        },
        {
          'title': 'Jarod Holden',
          'description': 'Blessing in disguise',
        },
        {
          'title': 'Jackie West',
          'description': 'walking in my own way.',
        },
      ]);
    } else if (Globals.selectedColor == 'Brown' &&
        Globals.selectedColor2 == 'Boho') {
      _items.addAll([
        {
          'title': 'Emerson Werner',
          'description': 'admire me',
        },
        {
          'title': 'Lydia Stevens',
          'description': 'Bringing fashion back.',
        },
        {
          'title': 'Akhil George',
          'description': 'modern twists',
        },
        {
          'title': 'Faya Borodin',
          'description': 'I\'m never out of style.',
        },
        {
          'title': 'Jackie White',
          'description': 'walking in my own way.',
        },
      ]);
    } else if (Globals.selectedColor == 'Gray' && //new color
        Globals.selectedColor2 == 'Indie') {
      _items.addAll([
        {
          'title': 'Margie Cerys',
          'description': 'still waiting for you',
        },
        {
          'title': 'Ria Hazel',
          'description': 'smiling underneath',
        },
        {
          'title': 'Alexia Polluck',
          'description': 'Classy',
        },
        {
          'title': 'Tessa Bell',
          'description': 'just another dreamer',
        },
        {
          'title': 'Michelle Sha',
          'description': 'Dreaming',
        },
      ]);
    } else if (Globals.selectedColor == 'Gray' &&
        Globals.selectedColor2 == 'Grunge') {
      _items.addAll([
        {
          'title': 'Kory Booker',
          'description': 'living in the dark',
        },
        {
          'title': 'Jenny Long',
          'description': 'sounds like distortion',
        },
        {
          'title': 'Margo Scotts',
          'description': 'in my element',
        },
        {
          'title': 'Daniel Zurita',
          'description': 'how do I look?',
        },
        {
          'title': 'Jackie Franzen',
          'description': 'Peace in the shadows',
        },
      ]);
    } else if (Globals.selectedColor == 'Gray' &&
        Globals.selectedColor2 == 'Soft') {
      _items.addAll([
        {
          'title': 'Emily Stevens',
          'description': 'lost in the light',
        },
        {
          'title': 'Lydia Holder',
          'description': 'Choose love, spread kindness.',
        },
        {
          'title': 'Margo Scotts',
          'description': 'A touch of sweetness in a bitter world.',
        },
        {
          'title': 'Surirat Sophon',
          'description': 'chaos in softness',
        },
        {
          'title': 'Jackie Weatherman',
          'description': 'Gentle soul.',
        },
      ]);
    } else if (Globals.selectedColor == 'Gray' &&
        Globals.selectedColor2 == 'Y2K') {
      _items.addAll([
        {
          'title': 'Lydia Stevens',
          'description': 'admire me',
        },
        {
          'title': 'Nguyen Choy',
          'description': 'Bringing fashion back.',
        },
        {
          'title': 'Jenny Bullock',
          'description': 'modern twists',
        },
        {
          'title': 'Faya Borodin',
          'description': 'I\'m never out of style.',
        },
        {
          'title': 'Jackie Burns',
          'description': 'Walking in my own way',
        },
      ]);
    } else if (Globals.selectedColor == 'Gray' &&
        Globals.selectedColor2 == 'Academia') {
      _items.addAll([
        {
          'title': 'Mindy Barron',
          'description': 'Walking in my own way',
        },
        {
          'title': 'Lydia Stevens',
          'description': 'going to the library tonight',
        },
        {
          'title': 'Jennifer Langston',
          'description': 'modern twists',
        },
        {
          'title': 'Faya Borodin',
          'description': 'I\'m never out of style.',
        },
        {
          'title': 'Jackie White',
          'description': 'walking in my own way.',
        },
      ]);
    } else if (Globals.selectedColor == 'Gray' &&
        Globals.selectedColor2 == 'Kawaii') {
      _items.addAll([
        {
          'title': 'Emerson Werner',
          'description': 'admire me',
        },
        {
          'title': 'Phayom Khankaeo',
          'description': 'Bringing fashion back.',
        },
        {
          'title': 'Linden Starling',
          'description': 'modern twists',
        },
        {
          'title': 'Faya Borodin',
          'description': 'I\'m never out of style.',
        },
        {
          'title': 'Jackie White',
          'description': 'walking in my own way.',
        },
      ]);
    } else if (Globals.selectedColor == 'Gray' &&
        Globals.selectedColor2 == 'Vintage') {
      _items.addAll([
        {
          'title': 'Dominick Fischer',
          'description': 'star boy',
        },
        {
          'title': 'Lydia Stevens',
          'description': 'Bringing fashion back.',
        },
        {
          'title': 'Jennifer Paxton',
          'description': 'modern twists',
        },
        {
          'title': 'Jack White',
          'description': 'I\'m never out of style.',
        },
        {
          'title': 'Phayom Khankaeo',
          'description': 'walking in my own way.',
        },
      ]);
    } else if (Globals.selectedColor == 'Gray' &&
        Globals.selectedColor2 == 'Boho') {
      _items.addAll([
        {
          'title': 'Phayom Khankaeo',
          'description': 'admire me',
        },
        {
          'title': 'Lydia Stevens',
          'description': 'Bringing fashion back.',
        },
        {
          'title': 'Emily Weathers',
          'description': 'modern twists',
        },
        {
          'title': 'Faya Borodin',
          'description': 'I\'m never out of style.',
        },
        {
          'title': 'Jackie White',
          'description': 'walking in my own way.',
        },
      ]);
    } else if (Globals.selectedColor == 'Black' && //new color
        Globals.selectedColor2 == 'Indie') {
      _items.addAll([
        {
          'title': 'Margie Cerys',
          'description': 'still waiting for you',
        },
        {
          'title': 'Ria Hazel',
          'description': 'fashion forward',
        },
        {
          'title': 'Alexia Sandra',
          'description': 'Classy',
        },
        {
          'title': 'Tessa Bell',
          'description': 'just another dreamer',
        },
        {
          'title': 'Michelle Sha',
          'description': 'Diamond Girl',
        },
      ]);
    } else if (Globals.selectedColor == 'Black' &&
        Globals.selectedColor2 == 'Grunge') {
      _items.addAll([
        {
          'title': 'Brandon Lipton',
          'description': 'lost in the light',
        },
        {
          'title': 'Emily Stevens',
          'description': 'in my element',
        },
        {
          'title': 'Margo Scotts',
          'description': 'shine through the dark',
        },
        {
          'title': 'Surirat Sophon',
          'description': 'Breaking Noise',
        },
        {
          'title': 'Jackie Franzen',
          'description': 'Peace in shadows',
        },
      ]);
    } else if (Globals.selectedColor == 'Black' &&
        Globals.selectedColor2 == 'Soft') {
      _items.addAll([
        {
          'title': 'Surirat Sophon',
          'description': 'chaos in softness',
        },
        {
          'title': 'Lydia Holder',
          'description': 'Choose love, spread kindness.',
        },
        {
          'title': 'Surirat Sophon',
          'description': 'A touch of sweetness in a bitter world.',
        },
        {
          'title': 'Jacob Fritz',
          'description': 'chaos in softness',
        },
        {
          'title': 'Jackie Weatherman',
          'description': 'Gentle heart, fierce soul.',
        },
      ]);
    } else if (Globals.selectedColor == 'Black' &&
        Globals.selectedColor2 == 'Y2K') {
      _items.addAll([
        {
          'title': 'Russel Bullock',
          'description': 'modern twists',
        },
        {
          'title': 'Lydia Stevens',
          'description': 'Bringing fashion back.',
        },
        {
          'title': 'Tammy Beasley',
          'description': 'focus on me',
        },
        {
          'title': 'Faya Borodin',
          'description': 'I\'m never out of style.',
        },
        {
          'title': 'Jackie Burns',
          'description': 'Walking in my own way',
        },
      ]);
    } else if (Globals.selectedColor == 'Black' &&
        Globals.selectedColor2 == 'Academia') {
      _items.addAll([
        {
          'title': 'Linda Charoenphon',
          'description': 'admire me',
        },
        {
          'title': 'Lydia Stevens',
          'description': 'falling in love',
        },
        {
          'title': 'Jessica Fritz',
          'description': 'modern twists',
        },
        {
          'title': 'Steven Grant',
          'description': 'I\'m never out of style.',
        },
        {
          'title': 'Faya Borodin',
          'description': 'walking in my own way.',
        },
      ]);
    } else if (Globals.selectedColor == 'Black' &&
        Globals.selectedColor2 == 'Kawaii') {
      _items.addAll([
        {
          'title': 'Phayom Khankaeo',
          'description': 'admire me',
        },
        {
          'title': 'Lydia Stevens',
          'description': 'Bringing fashion back.',
        },
        {
          'title': 'Jennifer Racks',
          'description': 'modern twists',
        },
        {
          'title': 'Faya Borodin',
          'description': 'I\'m never out of style.',
        },
        {
          'title': 'Jackie White',
          'description': 'walking in my own way.',
        },
      ]);
    } else if (Globals.selectedColor == 'Black' &&
        Globals.selectedColor2 == 'Vintage') {
      _items.addAll([
        {
          'title': 'Wilburn Sharp',
          'description': 'out and about.',
        },
        {
          'title': 'Lydia Stevens',
          'description': 'Bringing fashion back.',
        },
        {
          'title': 'Naomi Ringer',
          'description': 'modern twists',
        },
        {
          'title': 'Faya Borodin',
          'description': 'I\'m never out of style.',
        },
        {
          'title': 'Penny Morgans',
          'description': 'walking in my own way.',
        },
      ]);
    } else if (Globals.selectedColor == 'Black' &&
        Globals.selectedColor2 == 'Boho') {
      _items.addAll([
        {
          'title': 'Sheree Murillo',
          'description': 'how do I look?',
        },
        {
          'title': 'Chariya Hou',
          'description': 'Bringing fashion back.',
        },
        {
          'title': 'Jennifer Langston',
          'description': 'modern twists',
        },
        {
          'title': 'Faya Borodin',
          'description': 'I\'m never out of style.',
        },
        {
          'title': 'Jackie White',
          'description': 'walking in my own way.',
        },
      ]);
    } else {
      // If none of the conditions match, add default items
      _items.addAll([
        {
          'title': 'Jessica Fleming',
          'description': 'Blank canvas, boundless dreams.',
        },
        {
          'title': 'Nannie Larsen',
          'description': 'in my element',
        },
        {
          'title': 'Zachariah Hicks',
          'description': 'how do I look?',
        },
        {
          'title': 'Shigeto Suzuki',
          'description': 'peace out',
        },
      ]);
    }
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
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  children: [
                    const TextSpan(
                      text: 'Suggestion',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const TextSpan(
                      text: ' | ',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    TextSpan(
                      text: 'Friends',
                      style: const TextStyle(
                        fontWeight: FontWeight.normal,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              transitionDuration:
                                  const Duration(milliseconds: 30),
                              pageBuilder: (_, __, ___) => HomeConfirmPage(),
                              transitionsBuilder: (_, animation, __, child) =>
                                  FadeTransition(
                                opacity: animation,
                                child: child,
                              ),
                            ),
                          );
                        },
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
                          String? selectedColor = Globals.selectedColor;
                          String? selectedColor2 = Globals.selectedColor2;
                          return Column(
                            children: [
                              const SizedBox(
                                height: kToolbarHeight + 40,
                              ),
                              Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: const Color(0xffd9d9d9),
                                      borderRadius: BorderRadius.circular(55),
                                      image: (selectedColor == 'White' &&
                                              selectedColor2 == 'Indie')
                                          ? (index == 0
                                              ? const DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: AssetImage(
                                                      'lib/images/WhiteIndie2.png'),
                                                )
                                              : index == 1
                                                  ? const DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: AssetImage(
                                                          'lib/images/WhiteIndie5.png'),
                                                    )
                                                  : index == 2
                                                      ? const DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: AssetImage(
                                                              'lib/images/WhiteIndie1.png'),
                                                        )
                                                      : index == 3
                                                          ? const DecorationImage(
                                                              fit: BoxFit.cover,
                                                              image: AssetImage(
                                                                  'lib/images/WhiteIndie4.png'),
                                                            )
                                                          : index == 4
                                                              ? const DecorationImage(
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  image: AssetImage(
                                                                      'lib/images/WhiteIndie3.png'),
                                                                )
                                                              : const DecorationImage(
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  image: AssetImage(
                                                                      'lib/images/doja.png'),
                                                                ))
                                          : (selectedColor == 'White' &&
                                                  selectedColor2 == 'Grunge')
                                              ? (index == 0
                                                  ? const DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: AssetImage(
                                                          'lib/images/WhiteGrunge1.png'),
                                                    )
                                                  : index == 1
                                                      ? const DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: AssetImage(
                                                              'lib/images/WhiteGrunge2.png'),
                                                        )
                                                      : index == 2
                                                          ? const DecorationImage(
                                                              fit: BoxFit.cover,
                                                              image: AssetImage(
                                                                  'lib/images/WhiteGrunge3.png'),
                                                            )
                                                          : index == 3
                                                              ? const DecorationImage(
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  image: AssetImage(
                                                                      'lib/images/WhiteGrunge4.png'),
                                                                )
                                                              : index == 4
                                                                  ? const DecorationImage(
                                                                      fit: BoxFit
                                                                          .cover,
                                                                      image: AssetImage(
                                                                          'lib/images/WhiteGrunge5.png'),
                                                                    )
                                                                  : const DecorationImage(
                                                                      fit: BoxFit
                                                                          .cover,
                                                                      image: AssetImage(
                                                                          'lib/images/doja.png'),
                                                                    ))
                                              : (selectedColor == 'White' &&
                                                      selectedColor2 == 'Soft')
                                                  ? (index == 0
                                                      ? const DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: AssetImage(
                                                              'lib/images/WhiteSoft1.png'),
                                                        )
                                                      : index == 1
                                                          ? const DecorationImage(
                                                              fit: BoxFit.cover,
                                                              image: AssetImage(
                                                                  'lib/images/WhiteSoft2.png'),
                                                            )
                                                          : index == 2
                                                              ? const DecorationImage(
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  image: AssetImage(
                                                                      'lib/images/WhiteSoft3.png'),
                                                                )
                                                              : index == 3
                                                                  ? const DecorationImage(
                                                                      fit: BoxFit
                                                                          .cover,
                                                                      image: AssetImage(
                                                                          'lib/images/WhiteSoft4.png'),
                                                                    )
                                                                  : index == 4
                                                                      ? const DecorationImage(
                                                                          fit: BoxFit
                                                                              .cover,
                                                                          image:
                                                                              AssetImage('lib/images/WhiteSoft5.png'),
                                                                        )
                                                                      : const DecorationImage(
                                                                          fit: BoxFit
                                                                              .cover,
                                                                          image:
                                                                              AssetImage('lib/images/doja.png'),
                                                                        ))
                                                  : (selectedColor == 'White' &&
                                                          selectedColor2 ==
                                                              'Y2K')
                                                      ? (index == 0
                                                          ? const DecorationImage(
                                                              fit: BoxFit.cover,
                                                              image: AssetImage(
                                                                  'lib/images/WhiteY2K3.png'),
                                                            )
                                                          : index == 1
                                                              ? const DecorationImage(
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  image: AssetImage(
                                                                      'lib/images/WhiteY2K2.png'),
                                                                )
                                                              : index == 2
                                                                  ? const DecorationImage(
                                                                      fit: BoxFit
                                                                          .cover,
                                                                      image: AssetImage(
                                                                          'lib/images/WhiteY2K1.png'),
                                                                    )
                                                                  : index == 3
                                                                      ? const DecorationImage(
                                                                          fit: BoxFit
                                                                              .cover,
                                                                          image:
                                                                              AssetImage('lib/images/WhiteY2K4.png'),
                                                                        )
                                                                      : index ==
                                                                              4
                                                                          ? const DecorationImage(
                                                                              fit: BoxFit.cover,
                                                                              image: AssetImage('lib/images/WhiteY2K5.png'),
                                                                            )
                                                                          : const DecorationImage(
                                                                              fit: BoxFit.cover,
                                                                              image: AssetImage('lib/images/doja.png'),
                                                                            ))
                                                      : (selectedColor ==
                                                                  'White' &&
                                                              selectedColor2 ==
                                                                  'Academia')
                                                          ? (index == 0
                                                              ? const DecorationImage(
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  image: AssetImage(
                                                                      'lib/images/WhiteDark5.png'),
                                                                )
                                                              : index == 1
                                                                  ? const DecorationImage(
                                                                      fit: BoxFit
                                                                          .cover,
                                                                      image: AssetImage(
                                                                          'lib/images/WhiteDark3.png'),
                                                                    )
                                                                  : index == 2
                                                                      ? const DecorationImage(
                                                                          fit: BoxFit
                                                                              .cover,
                                                                          image:
                                                                              AssetImage('lib/images/WhiteDark1.png'),
                                                                        )
                                                                      : index ==
                                                                              3
                                                                          ? const DecorationImage(
                                                                              fit: BoxFit.cover,
                                                                              image: AssetImage('lib/images/WhiteDark2.png'),
                                                                            )
                                                                          : index ==
                                                                                  4
                                                                              ? const DecorationImage(
                                                                                  fit: BoxFit.cover,
                                                                                  image: AssetImage('lib/images/WhiteDark4.png'),
                                                                                )
                                                                              : const DecorationImage(
                                                                                  fit: BoxFit.cover,
                                                                                  image: AssetImage('lib/images/doja.png'),
                                                                                ))
                                                          : (selectedColor ==
                                                                      'White' &&
                                                                  selectedColor2 ==
                                                                      'Kawaii')
                                                              ? (index == 0
                                                                  ? const DecorationImage(
                                                                      fit: BoxFit
                                                                          .cover,
                                                                      image: AssetImage(
                                                                          'lib/images/WhiteKawaii1.png'),
                                                                    )
                                                                  : index == 1
                                                                      ? const DecorationImage(
                                                                          fit: BoxFit
                                                                              .cover,
                                                                          image:
                                                                              AssetImage('lib/images/WhiteKawaii2.png'),
                                                                        )
                                                                      : index ==
                                                                              2
                                                                          ? const DecorationImage(
                                                                              fit: BoxFit.cover,
                                                                              image: AssetImage('lib/images/WhiteKawaii3.png'),
                                                                            )
                                                                          : index ==
                                                                                  3
                                                                              ? const DecorationImage(
                                                                                  fit: BoxFit.cover,
                                                                                  image: AssetImage('lib/images/WhiteKawaii4.png'),
                                                                                )
                                                                              : index ==
                                                                                      4
                                                                                  ? const DecorationImage(
                                                                                      fit: BoxFit.cover,
                                                                                      image: AssetImage('lib/images/WhiteKawaii5.png'),
                                                                                    )
                                                                                  : const DecorationImage(
                                                                                      fit: BoxFit.cover,
                                                                                      image: AssetImage('lib/images/doja.png'),
                                                                                    ))
                                                              : (selectedColor ==
                                                                          'White' &&
                                                                      selectedColor2 ==
                                                                          'Vintage')
                                                                  ? (index == 0
                                                                      ? const DecorationImage(
                                                                          fit: BoxFit
                                                                              .cover,
                                                                          image:
                                                                              AssetImage('lib/images/WhiteVintage1.png'),
                                                                        )
                                                                      : index ==
                                                                              1
                                                                          ? const DecorationImage(
                                                                              fit: BoxFit.cover,
                                                                              image: AssetImage('lib/images/WhiteVintage2.png'),
                                                                            )
                                                                          : index == 2
                                                                              ? const DecorationImage(
                                                                                  fit: BoxFit.cover,
                                                                                  image: AssetImage('lib/images/WhiteVintage3.png'),
                                                                                )
                                                                              : index == 3
                                                                                  ? const DecorationImage(
                                                                                      fit: BoxFit.cover,
                                                                                      image: AssetImage('lib/images/WhiteVintage4.png'),
                                                                                    )
                                                                                  : index == 4
                                                                                      ? const DecorationImage(
                                                                                          fit: BoxFit.cover,
                                                                                          image: AssetImage('lib/images/WhiteVintage5.png'),
                                                                                        )
                                                                                      : const DecorationImage(
                                                                                          fit: BoxFit.cover,
                                                                                          image: AssetImage('lib/images/doja.png'),
                                                                                        ))
                                                                  : (selectedColor == 'White' && selectedColor2 == 'Boho')
                                                                      ? (index == 0
                                                                          ? const DecorationImage(
                                                                              fit: BoxFit.cover,
                                                                              image: AssetImage('lib/images/WhiteBoho1.png'),
                                                                            )
                                                                          : index == 1
                                                                              ? const DecorationImage(
                                                                                  fit: BoxFit.cover,
                                                                                  image: AssetImage('lib/images/WhiteBoho2.png'),
                                                                                )
                                                                              : index == 2
                                                                                  ? const DecorationImage(
                                                                                      fit: BoxFit.cover,
                                                                                      image: AssetImage('lib/images/WhiteBoho3.png'),
                                                                                    )
                                                                                  : index == 3
                                                                                      ? const DecorationImage(
                                                                                          fit: BoxFit.cover,
                                                                                          image: AssetImage('lib/images/WhiteBoho4.png'),
                                                                                        )
                                                                                      : index == 4
                                                                                          ? const DecorationImage(
                                                                                              fit: BoxFit.cover,
                                                                                              image: AssetImage('lib/images/WhiteBoho5.png'),
                                                                                            )
                                                                                          : const DecorationImage(
                                                                                              fit: BoxFit.cover,
                                                                                              image: AssetImage('lib/images/doja.png'),
                                                                                            ))
                                                                      : (selectedColor == 'Pink' && selectedColor2 == 'Indie')
                                                                          ? (index == 0
                                                                              ? const DecorationImage(
                                                                                  fit: BoxFit.cover,
                                                                                  image: AssetImage('lib/images/cloth1.png'),
                                                                                )
                                                                              : index == 1
                                                                                  ? const DecorationImage(
                                                                                      fit: BoxFit.cover,
                                                                                      image: AssetImage('lib/images/cloth2.png'),
                                                                                    )
                                                                                  : index == 2
                                                                                      ? const DecorationImage(
                                                                                          fit: BoxFit.cover,
                                                                                          image: AssetImage('lib/images/cloth3.png'),
                                                                                        )
                                                                                      : index == 3
                                                                                          ? const DecorationImage(
                                                                                              fit: BoxFit.cover,
                                                                                              image: AssetImage('lib/images/cloth4.png'),
                                                                                            )
                                                                                          : index == 4
                                                                                              ? const DecorationImage(
                                                                                                  fit: BoxFit.cover,
                                                                                                  image: AssetImage('lib/images/cloth5.png'),
                                                                                                )
                                                                                              : const DecorationImage(
                                                                                                  fit: BoxFit.cover,
                                                                                                  image: AssetImage('lib/images/doja.png'),
                                                                                                ))
                                                                          : (selectedColor == 'Pink' && selectedColor2 == 'Grunge')
                                                                              ? (index == 0
                                                                                  ? const DecorationImage(
                                                                                      fit: BoxFit.cover,
                                                                                      image: AssetImage('lib/images/PinkGrunge1.png'),
                                                                                    )
                                                                                  : index == 1
                                                                                      ? const DecorationImage(
                                                                                          fit: BoxFit.cover,
                                                                                          image: AssetImage('lib/images/PinkGrunge2.png'),
                                                                                        )
                                                                                      : index == 2
                                                                                          ? const DecorationImage(
                                                                                              fit: BoxFit.cover,
                                                                                              image: AssetImage('lib/images/PinkGrunge3.png'),
                                                                                            )
                                                                                          : index == 3
                                                                                              ? const DecorationImage(
                                                                                                  fit: BoxFit.cover,
                                                                                                  image: AssetImage('lib/images/PinkGrunge4.png'),
                                                                                                )
                                                                                              : index == 4
                                                                                                  ? const DecorationImage(
                                                                                                      fit: BoxFit.cover,
                                                                                                      image: AssetImage('lib/images/PinkGrunge5.png'),
                                                                                                    )
                                                                                                  : const DecorationImage(
                                                                                                      fit: BoxFit.cover,
                                                                                                      image: AssetImage('lib/images/doja.png'),
                                                                                                    ))
                                                                              : (selectedColor == 'Pink' && selectedColor2 == 'Soft')
                                                                                  ? (index == 0
                                                                                      ? const DecorationImage(
                                                                                          fit: BoxFit.cover,
                                                                                          image: AssetImage('lib/images/PinkSoft1.png'),
                                                                                        )
                                                                                      : index == 1
                                                                                          ? const DecorationImage(
                                                                                              fit: BoxFit.cover,
                                                                                              image: AssetImage('lib/images/PinkSoft2.png'),
                                                                                            )
                                                                                          : index == 2
                                                                                              ? const DecorationImage(
                                                                                                  fit: BoxFit.cover,
                                                                                                  image: AssetImage('lib/images/PinkSoft3.png'),
                                                                                                )
                                                                                              : index == 3
                                                                                                  ? const DecorationImage(
                                                                                                      fit: BoxFit.cover,
                                                                                                      image: AssetImage('lib/images/PinkSoft4.png'),
                                                                                                    )
                                                                                                  : index == 4
                                                                                                      ? const DecorationImage(
                                                                                                          fit: BoxFit.cover,
                                                                                                          image: AssetImage('lib/images/PinkSoft5.png'),
                                                                                                        )
                                                                                                      : const DecorationImage(
                                                                                                          fit: BoxFit.cover,
                                                                                                          image: AssetImage('lib/images/doja.png'),
                                                                                                        ))
                                                                                  : (selectedColor == 'Pink' && selectedColor2 == 'Y2K')
                                                                                      ? (index == 0
                                                                                          ? const DecorationImage(
                                                                                              fit: BoxFit.cover,
                                                                                              image: AssetImage('lib/images/PinkY2K1.png'),
                                                                                            )
                                                                                          : index == 1
                                                                                              ? const DecorationImage(
                                                                                                  fit: BoxFit.cover,
                                                                                                  image: AssetImage('lib/images/PinkY2K2.png'),
                                                                                                )
                                                                                              : index == 2
                                                                                                  ? const DecorationImage(
                                                                                                      fit: BoxFit.cover,
                                                                                                      image: AssetImage('lib/images/PinkY2K3.png'),
                                                                                                    )
                                                                                                  : index == 3
                                                                                                      ? const DecorationImage(
                                                                                                          fit: BoxFit.cover,
                                                                                                          image: AssetImage('lib/images/PinkY2K4.png'),
                                                                                                        )
                                                                                                      : index == 4
                                                                                                          ? const DecorationImage(
                                                                                                              fit: BoxFit.cover,
                                                                                                              image: AssetImage('lib/images/PinkY2K5.png'),
                                                                                                            )
                                                                                                          : const DecorationImage(
                                                                                                              fit: BoxFit.cover,
                                                                                                              image: AssetImage('lib/images/doja.png'),
                                                                                                            ))
                                                                                      : (selectedColor == 'Pink' && selectedColor2 == 'Academia')
                                                                                          ? (index == 0
                                                                                              ? const DecorationImage(
                                                                                                  fit: BoxFit.cover,
                                                                                                  image: AssetImage('lib/images/PinkDark1.png'),
                                                                                                )
                                                                                              : index == 1
                                                                                                  ? const DecorationImage(
                                                                                                      fit: BoxFit.cover,
                                                                                                      image: AssetImage('lib/images/PinkDark2.png'),
                                                                                                    )
                                                                                                  : index == 2
                                                                                                      ? const DecorationImage(
                                                                                                          fit: BoxFit.cover,
                                                                                                          image: AssetImage('lib/images/PinkDark3.png'),
                                                                                                        )
                                                                                                      : index == 3
                                                                                                          ? const DecorationImage(
                                                                                                              fit: BoxFit.cover,
                                                                                                              image: AssetImage('lib/images/PinkDark4.png'),
                                                                                                            )
                                                                                                          : index == 4
                                                                                                              ? const DecorationImage(
                                                                                                                  fit: BoxFit.cover,
                                                                                                                  image: AssetImage('lib/images/PinkDark5.png'),
                                                                                                                )
                                                                                                              : const DecorationImage(
                                                                                                                  fit: BoxFit.cover,
                                                                                                                  image: AssetImage('lib/images/doja.png'),
                                                                                                                ))
                                                                                          : (selectedColor == 'Pink' && selectedColor2 == 'Kawaii')
                                                                                              ? (index == 0
                                                                                                  ? const DecorationImage(
                                                                                                      fit: BoxFit.cover,
                                                                                                      image: AssetImage('lib/images/PinkKawaii1.png'),
                                                                                                    )
                                                                                                  : index == 1
                                                                                                      ? const DecorationImage(
                                                                                                          fit: BoxFit.cover,
                                                                                                          image: AssetImage('lib/images/PinkKawaii2.png'),
                                                                                                        )
                                                                                                      : index == 2
                                                                                                          ? const DecorationImage(
                                                                                                              fit: BoxFit.cover,
                                                                                                              image: AssetImage('lib/images/PinkKawaii3.png'),
                                                                                                            )
                                                                                                          : index == 3
                                                                                                              ? const DecorationImage(
                                                                                                                  fit: BoxFit.cover,
                                                                                                                  image: AssetImage('lib/images/PinkKawaii4.png'),
                                                                                                                )
                                                                                                              : index == 4
                                                                                                                  ? const DecorationImage(
                                                                                                                      fit: BoxFit.cover,
                                                                                                                      image: AssetImage('lib/images/PinkKawaii5.png'),
                                                                                                                    )
                                                                                                                  : const DecorationImage(
                                                                                                                      fit: BoxFit.cover,
                                                                                                                      image: AssetImage('lib/images/doja.png'),
                                                                                                                    ))
                                                                                              : (selectedColor == 'Pink' && selectedColor2 == 'Vintage')
                                                                                                  ? (index == 0
                                                                                                      ? const DecorationImage(
                                                                                                          fit: BoxFit.cover,
                                                                                                          image: AssetImage('lib/images/PinkVintage1.png'),
                                                                                                        )
                                                                                                      : index == 1
                                                                                                          ? const DecorationImage(
                                                                                                              fit: BoxFit.cover,
                                                                                                              image: AssetImage('lib/images/PinkVintage2.png'),
                                                                                                            )
                                                                                                          : index == 2
                                                                                                              ? const DecorationImage(
                                                                                                                  fit: BoxFit.cover,
                                                                                                                  image: AssetImage('lib/images/PinkVintage3.png'),
                                                                                                                )
                                                                                                              : index == 3
                                                                                                                  ? const DecorationImage(
                                                                                                                      fit: BoxFit.cover,
                                                                                                                      image: AssetImage('lib/images/PinkVintage4.png'),
                                                                                                                    )
                                                                                                                  : index == 4
                                                                                                                      ? const DecorationImage(
                                                                                                                          fit: BoxFit.cover,
                                                                                                                          image: AssetImage('lib/images/PinkVintage5.png'),
                                                                                                                        )
                                                                                                                      : const DecorationImage(
                                                                                                                          fit: BoxFit.cover,
                                                                                                                          image: AssetImage('lib/images/doja.png'),
                                                                                                                        ))
                                                                                                  : (selectedColor == 'Pink' && selectedColor2 == 'Boho')
                                                                                                      ? (index == 0
                                                                                                          ? const DecorationImage(
                                                                                                              fit: BoxFit.cover,
                                                                                                              image: AssetImage('lib/images/PinkBoho1.png'),
                                                                                                            )
                                                                                                          : index == 1
                                                                                                              ? const DecorationImage(
                                                                                                                  fit: BoxFit.cover,
                                                                                                                  image: AssetImage('lib/images/PinkBoho2.png'),
                                                                                                                )
                                                                                                              : index == 2
                                                                                                                  ? const DecorationImage(
                                                                                                                      fit: BoxFit.cover,
                                                                                                                      image: AssetImage('lib/images/PinkBoho3.png'),
                                                                                                                    )
                                                                                                                  : index == 3
                                                                                                                      ? const DecorationImage(
                                                                                                                          fit: BoxFit.cover,
                                                                                                                          image: AssetImage('lib/images/PinkBoho4.png'),
                                                                                                                        )
                                                                                                                      : index == 4
                                                                                                                          ? const DecorationImage(
                                                                                                                              fit: BoxFit.cover,
                                                                                                                              image: AssetImage('lib/images/PinkBoho5.png'),
                                                                                                                            )
                                                                                                                          : const DecorationImage(
                                                                                                                              fit: BoxFit.cover,
                                                                                                                              image: AssetImage('lib/images/doja.png'),
                                                                                                                            ))
                                                                                                      : (selectedColor == 'Red' && selectedColor2 == 'Indie')
                                                                                                          ? (index == 0
                                                                                                              ? const DecorationImage(
                                                                                                                  fit: BoxFit.cover,
                                                                                                                  image: AssetImage('lib/images/RedIndie1.png'),
                                                                                                                )
                                                                                                              : index == 1
                                                                                                                  ? const DecorationImage(
                                                                                                                      fit: BoxFit.cover,
                                                                                                                      image: AssetImage('lib/images/RedIndie2.png'),
                                                                                                                    )
                                                                                                                  : index == 2
                                                                                                                      ? const DecorationImage(
                                                                                                                          fit: BoxFit.cover,
                                                                                                                          image: AssetImage('lib/images/RedIndie3.png'),
                                                                                                                        )
                                                                                                                      : index == 3
                                                                                                                          ? const DecorationImage(
                                                                                                                              fit: BoxFit.cover,
                                                                                                                              image: AssetImage('lib/images/RedIndie4.png'),
                                                                                                                            )
                                                                                                                          : index == 4
                                                                                                                              ? const DecorationImage(
                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                  image: AssetImage('lib/images/RedIndie5.png'),
                                                                                                                                )
                                                                                                                              : const DecorationImage(
                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                  image: AssetImage('lib/images/doja.png'),
                                                                                                                                ))
                                                                                                          : (selectedColor == 'Red' && selectedColor2 == 'Grunge')
                                                                                                              ? (index == 0
                                                                                                                  ? const DecorationImage(
                                                                                                                      fit: BoxFit.cover,
                                                                                                                      image: AssetImage('lib/images/RedGrunge1.png'),
                                                                                                                    )
                                                                                                                  : index == 1
                                                                                                                      ? const DecorationImage(
                                                                                                                          fit: BoxFit.cover,
                                                                                                                          image: AssetImage('lib/images/RedGrunge2.png'),
                                                                                                                        )
                                                                                                                      : index == 2
                                                                                                                          ? const DecorationImage(
                                                                                                                              fit: BoxFit.cover,
                                                                                                                              image: AssetImage('lib/images/RedGrunge3.png'),
                                                                                                                            )
                                                                                                                          : index == 3
                                                                                                                              ? const DecorationImage(
                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                  image: AssetImage('lib/images/RedGrunge4.png'),
                                                                                                                                )
                                                                                                                              : index == 4
                                                                                                                                  ? const DecorationImage(
                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                      image: AssetImage('lib/images/RedGrunge5.png'),
                                                                                                                                    )
                                                                                                                                  : const DecorationImage(
                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                      image: AssetImage('lib/images/doja.png'),
                                                                                                                                    ))
                                                                                                              : (selectedColor == 'Red' && selectedColor2 == 'Soft')
                                                                                                                  ? (index == 0
                                                                                                                      ? const DecorationImage(
                                                                                                                          fit: BoxFit.cover,
                                                                                                                          image: AssetImage('lib/images/RedSoft1.png'),
                                                                                                                        )
                                                                                                                      : index == 1
                                                                                                                          ? const DecorationImage(
                                                                                                                              fit: BoxFit.cover,
                                                                                                                              image: AssetImage('lib/images/RedSoft2.png'),
                                                                                                                            )
                                                                                                                          : index == 2
                                                                                                                              ? const DecorationImage(
                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                  image: AssetImage('lib/images/RedSoft3.png'),
                                                                                                                                )
                                                                                                                              : index == 3
                                                                                                                                  ? const DecorationImage(
                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                      image: AssetImage('lib/images/RedSoft4.png'),
                                                                                                                                    )
                                                                                                                                  : index == 4
                                                                                                                                      ? const DecorationImage(
                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                          image: AssetImage('lib/images/RedSoft5.png'),
                                                                                                                                        )
                                                                                                                                      : const DecorationImage(
                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                          image: AssetImage('lib/images/doja.png'),
                                                                                                                                        ))
                                                                                                                  : (selectedColor == 'Red' && selectedColor2 == 'Y2K')
                                                                                                                      ? (index == 0
                                                                                                                          ? const DecorationImage(
                                                                                                                              fit: BoxFit.cover,
                                                                                                                              image: AssetImage('lib/images/RedY2K1.png'),
                                                                                                                            )
                                                                                                                          : index == 1
                                                                                                                              ? const DecorationImage(
                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                  image: AssetImage('lib/images/RedY2K2.png'),
                                                                                                                                )
                                                                                                                              : index == 2
                                                                                                                                  ? const DecorationImage(
                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                      image: AssetImage('lib/images/RedY2K3.png'),
                                                                                                                                    )
                                                                                                                                  : index == 3
                                                                                                                                      ? const DecorationImage(
                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                          image: AssetImage('lib/images/RedY2K4.png'),
                                                                                                                                        )
                                                                                                                                      : index == 4
                                                                                                                                          ? const DecorationImage(
                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                              image: AssetImage('lib/images/RedY2K5.png'),
                                                                                                                                            )
                                                                                                                                          : const DecorationImage(
                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                              image: AssetImage('lib/images/doja.png'),
                                                                                                                                            ))
                                                                                                                      : (selectedColor == 'Red' && selectedColor2 == 'Academia')
                                                                                                                          ? (index == 0
                                                                                                                              ? const DecorationImage(
                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                  image: AssetImage('lib/images/RedDark1.png'),
                                                                                                                                )
                                                                                                                              : index == 1
                                                                                                                                  ? const DecorationImage(
                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                      image: AssetImage('lib/images/RedDark2.png'),
                                                                                                                                    )
                                                                                                                                  : index == 2
                                                                                                                                      ? const DecorationImage(
                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                          image: AssetImage('lib/images/RedDark3.png'),
                                                                                                                                        )
                                                                                                                                      : index == 3
                                                                                                                                          ? const DecorationImage(
                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                              image: AssetImage('lib/images/RedDark4.png'),
                                                                                                                                            )
                                                                                                                                          : index == 4
                                                                                                                                              ? const DecorationImage(
                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                  image: AssetImage('lib/images/RedDark5.png'),
                                                                                                                                                )
                                                                                                                                              : const DecorationImage(
                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                  image: AssetImage('lib/images/doja.png'),
                                                                                                                                                ))
                                                                                                                          : (selectedColor == 'Red' && selectedColor2 == 'Kawaii')
                                                                                                                              ? (index == 0
                                                                                                                                  ? const DecorationImage(
                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                      image: AssetImage('lib/images/RedKawaii1.png'),
                                                                                                                                    )
                                                                                                                                  : index == 1
                                                                                                                                      ? const DecorationImage(
                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                          image: AssetImage('lib/images/RedKawaii2.png'),
                                                                                                                                        )
                                                                                                                                      : index == 2
                                                                                                                                          ? const DecorationImage(
                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                              image: AssetImage('lib/images/RedKawaii3.png'),
                                                                                                                                            )
                                                                                                                                          : index == 3
                                                                                                                                              ? const DecorationImage(
                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                  image: AssetImage('lib/images/RedKawaii4.png'),
                                                                                                                                                )
                                                                                                                                              : index == 4
                                                                                                                                                  ? const DecorationImage(
                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                      image: AssetImage('lib/images/RedKawaii5.png'),
                                                                                                                                                    )
                                                                                                                                                  : const DecorationImage(
                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                      image: AssetImage('lib/images/doja.png'),
                                                                                                                                                    ))
                                                                                                                              : (selectedColor == 'Red' && selectedColor2 == 'Vintage')
                                                                                                                                  ? (index == 0
                                                                                                                                      ? const DecorationImage(
                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                          image: AssetImage('lib/images/RedVintage1.png'),
                                                                                                                                        )
                                                                                                                                      : index == 1
                                                                                                                                          ? const DecorationImage(
                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                              image: AssetImage('lib/images/RedVintage2.png'),
                                                                                                                                            )
                                                                                                                                          : index == 2
                                                                                                                                              ? const DecorationImage(
                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                  image: AssetImage('lib/images/RedVintage3.png'),
                                                                                                                                                )
                                                                                                                                              : index == 3
                                                                                                                                                  ? const DecorationImage(
                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                      image: AssetImage('lib/images/RedVintage4.png'),
                                                                                                                                                    )
                                                                                                                                                  : index == 4
                                                                                                                                                      ? const DecorationImage(
                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                          image: AssetImage('lib/images/RedVintage5.png'),
                                                                                                                                                        )
                                                                                                                                                      : const DecorationImage(
                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                          image: AssetImage('lib/images/doja.png'),
                                                                                                                                                        ))
                                                                                                                                  : (selectedColor == 'Red' && selectedColor2 == 'Boho')
                                                                                                                                      ? (index == 0
                                                                                                                                          ? const DecorationImage(
                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                              image: AssetImage('lib/images/RedBoho1.png'),
                                                                                                                                            )
                                                                                                                                          : index == 1
                                                                                                                                              ? const DecorationImage(
                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                  image: AssetImage('lib/images/RedBoho2.png'),
                                                                                                                                                )
                                                                                                                                              : index == 2
                                                                                                                                                  ? const DecorationImage(
                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                      image: AssetImage('lib/images/RedBoho3.png'),
                                                                                                                                                    )
                                                                                                                                                  : index == 3
                                                                                                                                                      ? const DecorationImage(
                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                          image: AssetImage('lib/images/RedBoho4.png'),
                                                                                                                                                        )
                                                                                                                                                      : index == 4
                                                                                                                                                          ? const DecorationImage(
                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                              image: AssetImage('lib/images/RedBoho5.png'),
                                                                                                                                                            )
                                                                                                                                                          : const DecorationImage(
                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                              image: AssetImage('lib/images/doja.png'),
                                                                                                                                                            ))
                                                                                                                                      : (selectedColor == 'Orange' && selectedColor2 == 'Indie')
                                                                                                                                          ? (index == 0
                                                                                                                                              ? const DecorationImage(
                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                  image: AssetImage('lib/images/OrangeIndie1.png'),
                                                                                                                                                )
                                                                                                                                              : index == 1
                                                                                                                                                  ? const DecorationImage(
                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                      image: AssetImage('lib/images/OrangeIndie2.png'),
                                                                                                                                                    )
                                                                                                                                                  : index == 2
                                                                                                                                                      ? const DecorationImage(
                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                          image: AssetImage('lib/images/OrangeIndie3.png'),
                                                                                                                                                        )
                                                                                                                                                      : index == 3
                                                                                                                                                          ? const DecorationImage(
                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                              image: AssetImage('lib/images/OrangeIndie4.png'),
                                                                                                                                                            )
                                                                                                                                                          : index == 4
                                                                                                                                                              ? const DecorationImage(
                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                  image: AssetImage('lib/images/OrangeIndie5.png'),
                                                                                                                                                                )
                                                                                                                                                              : const DecorationImage(
                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                  image: AssetImage('lib/images/doja.png'),
                                                                                                                                                                ))
                                                                                                                                          : (selectedColor == 'Orange' && selectedColor2 == 'Grunge')
                                                                                                                                              ? (index == 0
                                                                                                                                                  ? const DecorationImage(
                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                      image: AssetImage('lib/images/OrangeGrunge1.png'),
                                                                                                                                                    )
                                                                                                                                                  : index == 1
                                                                                                                                                      ? const DecorationImage(
                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                          image: AssetImage('lib/images/OrangeGrunge2.png'),
                                                                                                                                                        )
                                                                                                                                                      : index == 2
                                                                                                                                                          ? const DecorationImage(
                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                              image: AssetImage('lib/images/OrangeGrunge3.png'),
                                                                                                                                                            )
                                                                                                                                                          : index == 3
                                                                                                                                                              ? const DecorationImage(
                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                  image: AssetImage('lib/images/OrangeGrunge4.png'),
                                                                                                                                                                )
                                                                                                                                                              : index == 4
                                                                                                                                                                  ? const DecorationImage(
                                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                                      image: AssetImage('lib/images/OrangeGrunge5.png'),
                                                                                                                                                                    )
                                                                                                                                                                  : const DecorationImage(
                                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                                      image: AssetImage('lib/images/doja.png'),
                                                                                                                                                                    ))
                                                                                                                                              : (selectedColor == 'Orange' && selectedColor2 == 'Soft')
                                                                                                                                                  ? (index == 0
                                                                                                                                                      ? const DecorationImage(
                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                          image: AssetImage('lib/images/OrangeSoft1.png'),
                                                                                                                                                        )
                                                                                                                                                      : index == 1
                                                                                                                                                          ? const DecorationImage(
                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                              image: AssetImage('lib/images/OrangeSoft2.png'),
                                                                                                                                                            )
                                                                                                                                                          : index == 2
                                                                                                                                                              ? const DecorationImage(
                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                  image: AssetImage('lib/images/OrangeSoft3.png'),
                                                                                                                                                                )
                                                                                                                                                              : index == 3
                                                                                                                                                                  ? const DecorationImage(
                                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                                      image: AssetImage('lib/images/OrangeSoft4.png'),
                                                                                                                                                                    )
                                                                                                                                                                  : index == 4
                                                                                                                                                                      ? const DecorationImage(
                                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                                          image: AssetImage('lib/images/OrangeSoft5.png'),
                                                                                                                                                                        )
                                                                                                                                                                      : const DecorationImage(
                                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                                          image: AssetImage('lib/images/doja.png'),
                                                                                                                                                                        ))
                                                                                                                                                  : (selectedColor == 'Orange' && selectedColor2 == 'Y2K')
                                                                                                                                                      ? (index == 0
                                                                                                                                                          ? const DecorationImage(
                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                              image: AssetImage('lib/images/OrangeY2K1.png'),
                                                                                                                                                            )
                                                                                                                                                          : index == 1
                                                                                                                                                              ? const DecorationImage(
                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                  image: AssetImage('lib/images/OrangeY2K2.png'),
                                                                                                                                                                )
                                                                                                                                                              : index == 2
                                                                                                                                                                  ? const DecorationImage(
                                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                                      image: AssetImage('lib/images/OrangeY2K3.png'),
                                                                                                                                                                    )
                                                                                                                                                                  : index == 3
                                                                                                                                                                      ? const DecorationImage(
                                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                                          image: AssetImage('lib/images/OrangeY2K4.png'),
                                                                                                                                                                        )
                                                                                                                                                                      : index == 4
                                                                                                                                                                          ? const DecorationImage(
                                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                                              image: AssetImage('lib/images/OrangeY2K5.png'),
                                                                                                                                                                            )
                                                                                                                                                                          : const DecorationImage(
                                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                                              image: AssetImage('lib/images/doja.png'),
                                                                                                                                                                            ))
                                                                                                                                                      : (selectedColor == 'Orange' && selectedColor2 == 'Academia')
                                                                                                                                                          ? (index == 0
                                                                                                                                                              ? const DecorationImage(
                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                  image: AssetImage('lib/images/OrangeDark1.png'),
                                                                                                                                                                )
                                                                                                                                                              : index == 1
                                                                                                                                                                  ? const DecorationImage(
                                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                                      image: AssetImage('lib/images/OrangeDark2.png'),
                                                                                                                                                                    )
                                                                                                                                                                  : index == 2
                                                                                                                                                                      ? const DecorationImage(
                                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                                          image: AssetImage('lib/images/OrangeDark3.png'),
                                                                                                                                                                        )
                                                                                                                                                                      : index == 3
                                                                                                                                                                          ? const DecorationImage(
                                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                                              image: AssetImage('lib/images/OrangeDark4.png'),
                                                                                                                                                                            )
                                                                                                                                                                          : index == 4
                                                                                                                                                                              ? const DecorationImage(
                                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                                  image: AssetImage('lib/images/OrangeDark5.png'),
                                                                                                                                                                                )
                                                                                                                                                                              : const DecorationImage(
                                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                                  image: AssetImage('lib/images/doja.png'),
                                                                                                                                                                                ))
                                                                                                                                                          : (selectedColor == 'Orange' && selectedColor2 == 'Kawaii')
                                                                                                                                                              ? (index == 0
                                                                                                                                                                  ? const DecorationImage(
                                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                                      image: AssetImage('lib/images/OrangeKawaii1.png'),
                                                                                                                                                                    )
                                                                                                                                                                  : index == 1
                                                                                                                                                                      ? const DecorationImage(
                                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                                          image: AssetImage('lib/images/OrangeKawaii2.png'),
                                                                                                                                                                        )
                                                                                                                                                                      : index == 2
                                                                                                                                                                          ? const DecorationImage(
                                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                                              image: AssetImage('lib/images/OrangeKawaii3.png'),
                                                                                                                                                                            )
                                                                                                                                                                          : index == 3
                                                                                                                                                                              ? const DecorationImage(
                                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                                  image: AssetImage('lib/images/OrangeKawaii4.png'),
                                                                                                                                                                                )
                                                                                                                                                                              : index == 4
                                                                                                                                                                                  ? const DecorationImage(
                                                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                                                      image: AssetImage('lib/images/OrangeKawaii5.png'),
                                                                                                                                                                                    )
                                                                                                                                                                                  : const DecorationImage(
                                                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                                                      image: AssetImage('lib/images/doja.png'),
                                                                                                                                                                                    ))
                                                                                                                                                              : (selectedColor == 'Orange' && selectedColor2 == 'Vintage')
                                                                                                                                                                  ? (index == 0
                                                                                                                                                                      ? const DecorationImage(
                                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                                          image: AssetImage('lib/images/OrangeVintage1.png'),
                                                                                                                                                                        )
                                                                                                                                                                      : index == 1
                                                                                                                                                                          ? const DecorationImage(
                                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                                              image: AssetImage('lib/images/OrangeVintage2.png'),
                                                                                                                                                                            )
                                                                                                                                                                          : index == 2
                                                                                                                                                                              ? const DecorationImage(
                                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                                  image: AssetImage('lib/images/OrangeVintage3.png'),
                                                                                                                                                                                )
                                                                                                                                                                              : index == 3
                                                                                                                                                                                  ? const DecorationImage(
                                                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                                                      image: AssetImage('lib/images/OrangeVintage4.png'),
                                                                                                                                                                                    )
                                                                                                                                                                                  : index == 4
                                                                                                                                                                                      ? const DecorationImage(
                                                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                                                          image: AssetImage('lib/images/OrangeVintage5.png'),
                                                                                                                                                                                        )
                                                                                                                                                                                      : const DecorationImage(
                                                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                                                          image: AssetImage('lib/images/doja.png'),
                                                                                                                                                                                        ))
                                                                                                                                                                  : (selectedColor == 'Orange' && selectedColor2 == 'Boho')
                                                                                                                                                                      ? (index == 0
                                                                                                                                                                          ? const DecorationImage(
                                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                                              image: AssetImage('lib/images/OrangeBoho1.png'),
                                                                                                                                                                            )
                                                                                                                                                                          : index == 1
                                                                                                                                                                              ? const DecorationImage(
                                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                                  image: AssetImage('lib/images/OrangeBoho2.png'),
                                                                                                                                                                                )
                                                                                                                                                                              : index == 2
                                                                                                                                                                                  ? const DecorationImage(
                                                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                                                      image: AssetImage('lib/images/OrangeBoho3.png'),
                                                                                                                                                                                    )
                                                                                                                                                                                  : index == 3
                                                                                                                                                                                      ? const DecorationImage(
                                                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                                                          image: AssetImage('lib/images/OrangeBoho4.png'),
                                                                                                                                                                                        )
                                                                                                                                                                                      : index == 4
                                                                                                                                                                                          ? const DecorationImage(
                                                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                                                              image: AssetImage('lib/images/OrangeBoho5.png'),
                                                                                                                                                                                            )
                                                                                                                                                                                          : const DecorationImage(
                                                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                                                              image: AssetImage('lib/images/doja.png'),
                                                                                                                                                                                            ))
                                                                                                                                                                      : (selectedColor == 'Yellow' && selectedColor2 == 'Indie')
                                                                                                                                                                          ? (index == 0
                                                                                                                                                                              ? const DecorationImage(
                                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                                  image: AssetImage('lib/images/YellowIndie1.png'),
                                                                                                                                                                                )
                                                                                                                                                                              : index == 1
                                                                                                                                                                                  ? const DecorationImage(
                                                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                                                      image: AssetImage('lib/images/YellowIndie2.png'),
                                                                                                                                                                                    )
                                                                                                                                                                                  : index == 2
                                                                                                                                                                                      ? const DecorationImage(
                                                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                                                          image: AssetImage('lib/images/YellowIndie3.png'),
                                                                                                                                                                                        )
                                                                                                                                                                                      : index == 3
                                                                                                                                                                                          ? const DecorationImage(
                                                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                                                              image: AssetImage('lib/images/YellowIndie4.png'),
                                                                                                                                                                                            )
                                                                                                                                                                                          : index == 4
                                                                                                                                                                                              ? const DecorationImage(
                                                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                                                  image: AssetImage('lib/images/YellowIndie5.png'),
                                                                                                                                                                                                )
                                                                                                                                                                                              : const DecorationImage(
                                                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                                                  image: AssetImage('lib/images/doja.png'),
                                                                                                                                                                                                ))
                                                                                                                                                                          : (selectedColor == 'Yellow' && selectedColor2 == 'Grunge')
                                                                                                                                                                              ? (index == 0
                                                                                                                                                                                  ? const DecorationImage(
                                                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                                                      image: AssetImage('lib/images/YellowGrunge1.png'),
                                                                                                                                                                                    )
                                                                                                                                                                                  : index == 1
                                                                                                                                                                                      ? const DecorationImage(
                                                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                                                          image: AssetImage('lib/images/YellowGrunge2.png'),
                                                                                                                                                                                        )
                                                                                                                                                                                      : index == 2
                                                                                                                                                                                          ? const DecorationImage(
                                                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                                                              image: AssetImage('lib/images/YellowGrunge3.png'),
                                                                                                                                                                                            )
                                                                                                                                                                                          : index == 3
                                                                                                                                                                                              ? const DecorationImage(
                                                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                                                  image: AssetImage('lib/images/YellowGrunge4.png'),
                                                                                                                                                                                                )
                                                                                                                                                                                              : index == 4
                                                                                                                                                                                                  ? const DecorationImage(
                                                                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                                                                      image: AssetImage('lib/images/YellowGrunge5.png'),
                                                                                                                                                                                                    )
                                                                                                                                                                                                  : const DecorationImage(
                                                                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                                                                      image: AssetImage('lib/images/doja.png'),
                                                                                                                                                                                                    ))
                                                                                                                                                                              : (selectedColor == 'Yellow' && selectedColor2 == 'Soft')
                                                                                                                                                                                  ? (index == 0
                                                                                                                                                                                      ? const DecorationImage(
                                                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                                                          image: AssetImage('lib/images/YellowSoft1.png'),
                                                                                                                                                                                        )
                                                                                                                                                                                      : index == 1
                                                                                                                                                                                          ? const DecorationImage(
                                                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                                                              image: AssetImage('lib/images/YellowSoft2.png'),
                                                                                                                                                                                            )
                                                                                                                                                                                          : index == 2
                                                                                                                                                                                              ? const DecorationImage(
                                                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                                                  image: AssetImage('lib/images/YellowSoft3.png'),
                                                                                                                                                                                                )
                                                                                                                                                                                              : index == 3
                                                                                                                                                                                                  ? const DecorationImage(
                                                                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                                                                      image: AssetImage('lib/images/YellowSoft4.png'),
                                                                                                                                                                                                    )
                                                                                                                                                                                                  : index == 4
                                                                                                                                                                                                      ? const DecorationImage(
                                                                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                                                                          image: AssetImage('lib/images/YellowSoft5.png'),
                                                                                                                                                                                                        )
                                                                                                                                                                                                      : const DecorationImage(
                                                                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                                                                          image: AssetImage('lib/images/doja.png'),
                                                                                                                                                                                                        ))
                                                                                                                                                                                  : (selectedColor == 'Yellow' && selectedColor2 == 'Y2K')
                                                                                                                                                                                      ? (index == 0
                                                                                                                                                                                          ? const DecorationImage(
                                                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                                                              image: AssetImage('lib/images/YellowY2K1.png'),
                                                                                                                                                                                            )
                                                                                                                                                                                          : index == 1
                                                                                                                                                                                              ? const DecorationImage(
                                                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                                                  image: AssetImage('lib/images/YellowY2K2.png'),
                                                                                                                                                                                                )
                                                                                                                                                                                              : index == 2
                                                                                                                                                                                                  ? const DecorationImage(
                                                                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                                                                      image: AssetImage('lib/images/YellowY2K3.png'),
                                                                                                                                                                                                    )
                                                                                                                                                                                                  : index == 3
                                                                                                                                                                                                      ? const DecorationImage(
                                                                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                                                                          image: AssetImage('lib/images/YellowY2K4.png'),
                                                                                                                                                                                                        )
                                                                                                                                                                                                      : index == 4
                                                                                                                                                                                                          ? const DecorationImage(
                                                                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                                                                              image: AssetImage('lib/images/YellowY2K5.png'),
                                                                                                                                                                                                            )
                                                                                                                                                                                                          : const DecorationImage(
                                                                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                                                                              image: AssetImage('lib/images/doja.png'),
                                                                                                                                                                                                            ))
                                                                                                                                                                                      : (selectedColor == 'Yellow' && selectedColor2 == 'Academia')
                                                                                                                                                                                          ? (index == 0
                                                                                                                                                                                              ? const DecorationImage(
                                                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                                                  image: AssetImage('lib/images/YellowDark1.png'),
                                                                                                                                                                                                )
                                                                                                                                                                                              : index == 1
                                                                                                                                                                                                  ? const DecorationImage(
                                                                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                                                                      image: AssetImage('lib/images/YellowDark2.png'),
                                                                                                                                                                                                    )
                                                                                                                                                                                                  : index == 2
                                                                                                                                                                                                      ? const DecorationImage(
                                                                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                                                                          image: AssetImage('lib/images/YellowDark3.png'),
                                                                                                                                                                                                        )
                                                                                                                                                                                                      : index == 3
                                                                                                                                                                                                          ? const DecorationImage(
                                                                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                                                                              image: AssetImage('lib/images/YellowDark4.png'),
                                                                                                                                                                                                            )
                                                                                                                                                                                                          : index == 4
                                                                                                                                                                                                              ? const DecorationImage(
                                                                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                                                                  image: AssetImage('lib/images/YellowDark5.png'),
                                                                                                                                                                                                                )
                                                                                                                                                                                                              : const DecorationImage(
                                                                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                                                                  image: AssetImage('lib/images/doja.png'),
                                                                                                                                                                                                                ))
                                                                                                                                                                                          : (selectedColor == 'Yellow' && selectedColor2 == 'Kawaii')
                                                                                                                                                                                              ? (index == 0
                                                                                                                                                                                                  ? const DecorationImage(
                                                                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                                                                      image: AssetImage('lib/images/YellowKawaii1.png'),
                                                                                                                                                                                                    )
                                                                                                                                                                                                  : index == 1
                                                                                                                                                                                                      ? const DecorationImage(
                                                                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                                                                          image: AssetImage('lib/images/YellowKawaii2.png'),
                                                                                                                                                                                                        )
                                                                                                                                                                                                      : index == 2
                                                                                                                                                                                                          ? const DecorationImage(
                                                                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                                                                              image: AssetImage('lib/images/YellowKawaii3.png'),
                                                                                                                                                                                                            )
                                                                                                                                                                                                          : index == 3
                                                                                                                                                                                                              ? const DecorationImage(
                                                                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                                                                  image: AssetImage('lib/images/YellowKawaii4.png'),
                                                                                                                                                                                                                )
                                                                                                                                                                                                              : index == 4
                                                                                                                                                                                                                  ? const DecorationImage(
                                                                                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                                                                                      image: AssetImage('lib/images/YellowKawaii5.png'),
                                                                                                                                                                                                                    )
                                                                                                                                                                                                                  : const DecorationImage(
                                                                                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                                                                                      image: AssetImage('lib/images/doja.png'),
                                                                                                                                                                                                                    ))
                                                                                                                                                                                              : (selectedColor == 'Yellow' && selectedColor2 == 'Vintage')
                                                                                                                                                                                                  ? (index == 0
                                                                                                                                                                                                      ? const DecorationImage(
                                                                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                                                                          image: AssetImage('lib/images/YellowVintage1.png'),
                                                                                                                                                                                                        )
                                                                                                                                                                                                      : index == 1
                                                                                                                                                                                                          ? const DecorationImage(
                                                                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                                                                              image: AssetImage('lib/images/YellowVintage2.png'),
                                                                                                                                                                                                            )
                                                                                                                                                                                                          : index == 2
                                                                                                                                                                                                              ? const DecorationImage(
                                                                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                                                                  image: AssetImage('lib/images/YellowVintage3.png'),
                                                                                                                                                                                                                )
                                                                                                                                                                                                              : index == 3
                                                                                                                                                                                                                  ? const DecorationImage(
                                                                                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                                                                                      image: AssetImage('lib/images/YellowVintage4.png'),
                                                                                                                                                                                                                    )
                                                                                                                                                                                                                  : index == 4
                                                                                                                                                                                                                      ? const DecorationImage(
                                                                                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                                                                                          image: AssetImage('lib/images/YellowVintage5.png'),
                                                                                                                                                                                                                        )
                                                                                                                                                                                                                      : const DecorationImage(
                                                                                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                                                                                          image: AssetImage('lib/images/doja.png'),
                                                                                                                                                                                                                        ))
                                                                                                                                                                                                  : (selectedColor == 'Yellow' && selectedColor2 == 'Boho')
                                                                                                                                                                                                      ? (index == 0
                                                                                                                                                                                                          ? const DecorationImage(
                                                                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                                                                              image: AssetImage('lib/images/YellowBoho1.png'),
                                                                                                                                                                                                            )
                                                                                                                                                                                                          : index == 1
                                                                                                                                                                                                              ? const DecorationImage(
                                                                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                                                                  image: AssetImage('lib/images/YellowBoho2.png'),
                                                                                                                                                                                                                )
                                                                                                                                                                                                              : index == 2
                                                                                                                                                                                                                  ? const DecorationImage(
                                                                                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                                                                                      image: AssetImage('lib/images/YellowBoho3.png'),
                                                                                                                                                                                                                    )
                                                                                                                                                                                                                  : index == 3
                                                                                                                                                                                                                      ? const DecorationImage(
                                                                                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                                                                                          image: AssetImage('lib/images/YellowBoho4.png'),
                                                                                                                                                                                                                        )
                                                                                                                                                                                                                      : index == 4
                                                                                                                                                                                                                          ? const DecorationImage(
                                                                                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                                                                                              image: AssetImage('lib/images/YellowBoho5.png'),
                                                                                                                                                                                                                            )
                                                                                                                                                                                                                          : const DecorationImage(
                                                                                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                                                                                              image: AssetImage('lib/images/doja.png'),
                                                                                                                                                                                                                            ))
                                                                                                                                                                                                      : (selectedColor == 'Green' && selectedColor2 == 'Indie')
                                                                                                                                                                                                          ? (index == 0
                                                                                                                                                                                                              ? const DecorationImage(
                                                                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                                                                  image: AssetImage('lib/images/GreenIndie1.png'),
                                                                                                                                                                                                                )
                                                                                                                                                                                                              : index == 1
                                                                                                                                                                                                                  ? const DecorationImage(
                                                                                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                                                                                      image: AssetImage('lib/images/GreenIndie2.png'),
                                                                                                                                                                                                                    )
                                                                                                                                                                                                                  : index == 2
                                                                                                                                                                                                                      ? const DecorationImage(
                                                                                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                                                                                          image: AssetImage('lib/images/GreenIndie3.png'),
                                                                                                                                                                                                                        )
                                                                                                                                                                                                                      : index == 3
                                                                                                                                                                                                                          ? const DecorationImage(
                                                                                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                                                                                              image: AssetImage('lib/images/GreenIndie4.png'),
                                                                                                                                                                                                                            )
                                                                                                                                                                                                                          : index == 4
                                                                                                                                                                                                                              ? const DecorationImage(
                                                                                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                                                                                  image: AssetImage('lib/images/GreenIndie5.png'),
                                                                                                                                                                                                                                )
                                                                                                                                                                                                                              : const DecorationImage(
                                                                                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                                                                                  image: AssetImage('lib/images/doja.png'),
                                                                                                                                                                                                                                ))
                                                                                                                                                                                                          : (selectedColor == 'Green' && selectedColor2 == 'Grunge')
                                                                                                                                                                                                              ? (index == 0
                                                                                                                                                                                                                  ? const DecorationImage(
                                                                                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                                                                                      image: AssetImage('lib/images/GreenGrunge1.png'),
                                                                                                                                                                                                                    )
                                                                                                                                                                                                                  : index == 1
                                                                                                                                                                                                                      ? const DecorationImage(
                                                                                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                                                                                          image: AssetImage('lib/images/GreenGrunge2.png'),
                                                                                                                                                                                                                        )
                                                                                                                                                                                                                      : index == 2
                                                                                                                                                                                                                          ? const DecorationImage(
                                                                                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                                                                                              image: AssetImage('lib/images/GreenGrunge3.png'),
                                                                                                                                                                                                                            )
                                                                                                                                                                                                                          : index == 3
                                                                                                                                                                                                                              ? const DecorationImage(
                                                                                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                                                                                  image: AssetImage('lib/images/GreenGrunge4.png'),
                                                                                                                                                                                                                                )
                                                                                                                                                                                                                              : index == 4
                                                                                                                                                                                                                                  ? const DecorationImage(
                                                                                                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                                                                                                      image: AssetImage('lib/images/GreenGrunge5.png'),
                                                                                                                                                                                                                                    )
                                                                                                                                                                                                                                  : const DecorationImage(
                                                                                                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                                                                                                      image: AssetImage('lib/images/doja.png'),
                                                                                                                                                                                                                                    ))
                                                                                                                                                                                                              : (selectedColor == 'Green' && selectedColor2 == 'Soft') //start here start here start here start here start here start here start here start here start here start here
                                                                                                                                                                                                                  ? (index == 0
                                                                                                                                                                                                                      ? const DecorationImage(
                                                                                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                                                                                          image: AssetImage('lib/images/GreenSoft1.png'),
                                                                                                                                                                                                                        )
                                                                                                                                                                                                                      : index == 1
                                                                                                                                                                                                                          ? const DecorationImage(
                                                                                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                                                                                              image: AssetImage('lib/images/GreenSoft2.png'),
                                                                                                                                                                                                                            )
                                                                                                                                                                                                                          : index == 2
                                                                                                                                                                                                                              ? const DecorationImage(
                                                                                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                                                                                  image: AssetImage('lib/images/GreenSoft3.png'),
                                                                                                                                                                                                                                )
                                                                                                                                                                                                                              : index == 3
                                                                                                                                                                                                                                  ? const DecorationImage(
                                                                                                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                                                                                                      image: AssetImage('lib/images/GreenSoft4.png'),
                                                                                                                                                                                                                                    )
                                                                                                                                                                                                                                  : index == 4
                                                                                                                                                                                                                                      ? const DecorationImage(
                                                                                                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                                                                                                          image: AssetImage('lib/images/GreenSoft5.png'),
                                                                                                                                                                                                                                        )
                                                                                                                                                                                                                                      : const DecorationImage(
                                                                                                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                                                                                                          image: AssetImage('lib/images/doja.png'),
                                                                                                                                                                                                                                        ))
                                                                                                                                                                                                                  : (selectedColor == 'Green' && selectedColor2 == 'Y2K') //start here start here start here start here start here start here start here start here start here start here
                                                                                                                                                                                                                      ? (index == 0
                                                                                                                                                                                                                          ? const DecorationImage(
                                                                                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                                                                                              image: AssetImage('lib/images/GreenY2K1.png'),
                                                                                                                                                                                                                            )
                                                                                                                                                                                                                          : index == 1
                                                                                                                                                                                                                              ? const DecorationImage(
                                                                                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                                                                                  image: AssetImage('lib/images/GreenY2K2.png'),
                                                                                                                                                                                                                                )
                                                                                                                                                                                                                              : index == 2
                                                                                                                                                                                                                                  ? const DecorationImage(
                                                                                                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                                                                                                      image: AssetImage('lib/images/GreenY2K3.png'),
                                                                                                                                                                                                                                    )
                                                                                                                                                                                                                                  : index == 3
                                                                                                                                                                                                                                      ? const DecorationImage(
                                                                                                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                                                                                                          image: AssetImage('lib/images/GreenY2K4.png'),
                                                                                                                                                                                                                                        )
                                                                                                                                                                                                                                      : index == 4
                                                                                                                                                                                                                                          ? const DecorationImage(
                                                                                                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                                                                                                              image: AssetImage('lib/images/GreenY2K5.png'),
                                                                                                                                                                                                                                            )
                                                                                                                                                                                                                                          : const DecorationImage(
                                                                                                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                                                                                                              image: AssetImage('lib/images/doja.png'),
                                                                                                                                                                                                                                            ))
                                                                                                                                                                                                                      : (selectedColor == 'Green' && selectedColor2 == 'Academia')
                                                                                                                                                                                                                          ? (index == 0
                                                                                                                                                                                                                              ? const DecorationImage(
                                                                                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                                                                                  image: AssetImage('lib/images/GreenDark1.png'),
                                                                                                                                                                                                                                )
                                                                                                                                                                                                                              : index == 1
                                                                                                                                                                                                                                  ? const DecorationImage(
                                                                                                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                                                                                                      image: AssetImage('lib/images/GreenDark2.png'),
                                                                                                                                                                                                                                    )
                                                                                                                                                                                                                                  : index == 2
                                                                                                                                                                                                                                      ? const DecorationImage(
                                                                                                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                                                                                                          image: AssetImage('lib/images/GreenDark3.png'),
                                                                                                                                                                                                                                        )
                                                                                                                                                                                                                                      : index == 3
                                                                                                                                                                                                                                          ? const DecorationImage(
                                                                                                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                                                                                                              image: AssetImage('lib/images/GreenDark4.png'),
                                                                                                                                                                                                                                            )
                                                                                                                                                                                                                                          : index == 4
                                                                                                                                                                                                                                              ? const DecorationImage(
                                                                                                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                                                                                                  image: AssetImage('lib/images/GreenDark5.png'),
                                                                                                                                                                                                                                                )
                                                                                                                                                                                                                                              : const DecorationImage(
                                                                                                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                                                                                                  image: AssetImage('lib/images/doja.png'),
                                                                                                                                                                                                                                                ))
                                                                                                                                                                                                                          : (selectedColor == 'Green' && selectedColor2 == 'Kawaii') //start here start here start here start here start here start here start here start here start here start here
                                                                                                                                                                                                                              ? (index == 0
                                                                                                                                                                                                                                  ? const DecorationImage(
                                                                                                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                                                                                                      image: AssetImage('lib/images/GreenKawaii1.png'),
                                                                                                                                                                                                                                    )
                                                                                                                                                                                                                                  : index == 1
                                                                                                                                                                                                                                      ? const DecorationImage(
                                                                                                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                                                                                                          image: AssetImage('lib/images/GreenKawaii2.png'),
                                                                                                                                                                                                                                        )
                                                                                                                                                                                                                                      : index == 2
                                                                                                                                                                                                                                          ? const DecorationImage(
                                                                                                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                                                                                                              image: AssetImage('lib/images/GreenKawaii3.png'),
                                                                                                                                                                                                                                            )
                                                                                                                                                                                                                                          : index == 3
                                                                                                                                                                                                                                              ? const DecorationImage(
                                                                                                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                                                                                                  image: AssetImage('lib/images/GreenKawaii4.png'),
                                                                                                                                                                                                                                                )
                                                                                                                                                                                                                                              : index == 4
                                                                                                                                                                                                                                                  ? const DecorationImage(
                                                                                                                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                                                                                                                      image: AssetImage('lib/images/GreenKawaii5.png'),
                                                                                                                                                                                                                                                    )
                                                                                                                                                                                                                                                  : const DecorationImage(
                                                                                                                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                                                                                                                      image: AssetImage('lib/images/doja.png'),
                                                                                                                                                                                                                                                    ))
                                                                                                                                                                                                                              : (selectedColor == 'Green' && selectedColor2 == 'Vintage')
                                                                                                                                                                                                                                  ? (index == 0
                                                                                                                                                                                                                                      ? const DecorationImage(
                                                                                                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                                                                                                          image: AssetImage('lib/images/GreenVintage1.png'),
                                                                                                                                                                                                                                        )
                                                                                                                                                                                                                                      : index == 1
                                                                                                                                                                                                                                          ? const DecorationImage(
                                                                                                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                                                                                                              image: AssetImage('lib/images/GreenVintage2.png'),
                                                                                                                                                                                                                                            )
                                                                                                                                                                                                                                          : index == 2
                                                                                                                                                                                                                                              ? const DecorationImage(
                                                                                                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                                                                                                  image: AssetImage('lib/images/GreenVintage3.png'),
                                                                                                                                                                                                                                                )
                                                                                                                                                                                                                                              : index == 3
                                                                                                                                                                                                                                                  ? const DecorationImage(
                                                                                                                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                                                                                                                      image: AssetImage('lib/images/GreenVintage4.png'),
                                                                                                                                                                                                                                                    )
                                                                                                                                                                                                                                                  : index == 4
                                                                                                                                                                                                                                                      ? const DecorationImage(
                                                                                                                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                                                                                                                          image: AssetImage('lib/images/GreenVintage5.png'),
                                                                                                                                                                                                                                                        )
                                                                                                                                                                                                                                                      : const DecorationImage(
                                                                                                                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                                                                                                                          image: AssetImage('lib/images/doja.png'),
                                                                                                                                                                                                                                                        ))
                                                                                                                                                                                                                                  : (selectedColor == 'Green' && selectedColor2 == 'Boho')
                                                                                                                                                                                                                                      ? (index == 0
                                                                                                                                                                                                                                          ? const DecorationImage(
                                                                                                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                                                                                                              image: AssetImage('lib/images/GreenBoho1.png'),
                                                                                                                                                                                                                                            )
                                                                                                                                                                                                                                          : index == 1
                                                                                                                                                                                                                                              ? const DecorationImage(
                                                                                                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                                                                                                  image: AssetImage('lib/images/GreenBoho2.png'),
                                                                                                                                                                                                                                                )
                                                                                                                                                                                                                                              : index == 2
                                                                                                                                                                                                                                                  ? const DecorationImage(
                                                                                                                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                                                                                                                      image: AssetImage('lib/images/GreenBoho3.png'),
                                                                                                                                                                                                                                                    )
                                                                                                                                                                                                                                                  : index == 3
                                                                                                                                                                                                                                                      ? const DecorationImage(
                                                                                                                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                                                                                                                          image: AssetImage('lib/images/GreenBoho4.png'),
                                                                                                                                                                                                                                                        )
                                                                                                                                                                                                                                                      : index == 4
                                                                                                                                                                                                                                                          ? const DecorationImage(
                                                                                                                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                                                                                                                              image: AssetImage('lib/images/GreenBoho5.png'),
                                                                                                                                                                                                                                                            )
                                                                                                                                                                                                                                                          : const DecorationImage(
                                                                                                                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                                                                                                                              image: AssetImage('lib/images/doja.png'),
                                                                                                                                                                                                                                                            ))
                                                                                                                                                                                                                                      : (selectedColor == 'Blue' && selectedColor2 == 'Indie')
                                                                                                                                                                                                                                          ? (index == 0
                                                                                                                                                                                                                                              ? const DecorationImage(
                                                                                                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                                                                                                  image: AssetImage('lib/images/BlueIndie1.png'),
                                                                                                                                                                                                                                                )
                                                                                                                                                                                                                                              : index == 1
                                                                                                                                                                                                                                                  ? const DecorationImage(
                                                                                                                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                                                                                                                      image: AssetImage('lib/images/BlueIndie2.png'),
                                                                                                                                                                                                                                                    )
                                                                                                                                                                                                                                                  : index == 2
                                                                                                                                                                                                                                                      ? const DecorationImage(
                                                                                                                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                                                                                                                          image: AssetImage('lib/images/BlueIndie3.png'),
                                                                                                                                                                                                                                                        )
                                                                                                                                                                                                                                                      : index == 3
                                                                                                                                                                                                                                                          ? const DecorationImage(
                                                                                                                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                                                                                                                              image: AssetImage('lib/images/BlueIndie4.png'),
                                                                                                                                                                                                                                                            )
                                                                                                                                                                                                                                                          : index == 4
                                                                                                                                                                                                                                                              ? const DecorationImage(
                                                                                                                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                                                                                                                  image: AssetImage('lib/images/BlueIndie5.png'),
                                                                                                                                                                                                                                                                )
                                                                                                                                                                                                                                                              : const DecorationImage(
                                                                                                                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                                                                                                                  image: AssetImage('lib/images/doja.png'),
                                                                                                                                                                                                                                                                ))
                                                                                                                                                                                                                                          : (selectedColor == 'Blue' && selectedColor2 == 'Grunge') //start here start here start here start here start here start here start here start here start here start here
                                                                                                                                                                                                                                              ? (index == 0
                                                                                                                                                                                                                                                  ? const DecorationImage(
                                                                                                                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                                                                                                                      image: AssetImage('lib/images/BlueGrunge1.png'),
                                                                                                                                                                                                                                                    )
                                                                                                                                                                                                                                                  : index == 1
                                                                                                                                                                                                                                                      ? const DecorationImage(
                                                                                                                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                                                                                                                          image: AssetImage('lib/images/BlueGrunge2.png'),
                                                                                                                                                                                                                                                        )
                                                                                                                                                                                                                                                      : index == 2
                                                                                                                                                                                                                                                          ? const DecorationImage(
                                                                                                                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                                                                                                                              image: AssetImage('lib/images/BlueGrunge3.png'),
                                                                                                                                                                                                                                                            )
                                                                                                                                                                                                                                                          : index == 3
                                                                                                                                                                                                                                                              ? const DecorationImage(
                                                                                                                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                                                                                                                  image: AssetImage('lib/images/BlueGrunge4.png'),
                                                                                                                                                                                                                                                                )
                                                                                                                                                                                                                                                              : index == 4
                                                                                                                                                                                                                                                                  ? const DecorationImage(
                                                                                                                                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                                                                                                                                      image: AssetImage('lib/images/BlueGrunge5.png'),
                                                                                                                                                                                                                                                                    )
                                                                                                                                                                                                                                                                  : const DecorationImage(
                                                                                                                                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                                                                                                                                      image: AssetImage('lib/images/doja.png'),
                                                                                                                                                                                                                                                                    ))
                                                                                                                                                                                                                                              : (selectedColor == 'Blue' && selectedColor2 == 'Soft') //start here start here start here start here start here start here start here start here start here start here
                                                                                                                                                                                                                                                  ? (index == 0
                                                                                                                                                                                                                                                      ? const DecorationImage(
                                                                                                                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                                                                                                                          image: AssetImage('lib/images/BlueSoft1.png'),
                                                                                                                                                                                                                                                        )
                                                                                                                                                                                                                                                      : index == 1
                                                                                                                                                                                                                                                          ? const DecorationImage(
                                                                                                                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                                                                                                                              image: AssetImage('lib/images/BlueSoft2.png'),
                                                                                                                                                                                                                                                            )
                                                                                                                                                                                                                                                          : index == 2
                                                                                                                                                                                                                                                              ? const DecorationImage(
                                                                                                                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                                                                                                                  image: AssetImage('lib/images/BlueSoft3.png'),
                                                                                                                                                                                                                                                                )
                                                                                                                                                                                                                                                              : index == 3
                                                                                                                                                                                                                                                                  ? const DecorationImage(
                                                                                                                                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                                                                                                                                      image: AssetImage('lib/images/BlueSoft4.png'),
                                                                                                                                                                                                                                                                    )
                                                                                                                                                                                                                                                                  : index == 4
                                                                                                                                                                                                                                                                      ? const DecorationImage(
                                                                                                                                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                                                                                                                                          image: AssetImage('lib/images/BlueSoft5.png'),
                                                                                                                                                                                                                                                                        )
                                                                                                                                                                                                                                                                      : const DecorationImage(
                                                                                                                                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                                                                                                                                          image: AssetImage('lib/images/doja.png'),
                                                                                                                                                                                                                                                                        ))
                                                                                                                                                                                                                                                  : (selectedColor == 'Blue' && selectedColor2 == 'Y2K') //start here start here start here start here start here start here start here start here start here start here
                                                                                                                                                                                                                                                      ? (index == 0
                                                                                                                                                                                                                                                          ? const DecorationImage(
                                                                                                                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                                                                                                                              image: AssetImage('lib/images/BlueY2K1.png'),
                                                                                                                                                                                                                                                            )
                                                                                                                                                                                                                                                          : index == 1
                                                                                                                                                                                                                                                              ? const DecorationImage(
                                                                                                                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                                                                                                                  image: AssetImage('lib/images/BlueY2K2.png'),
                                                                                                                                                                                                                                                                )
                                                                                                                                                                                                                                                              : index == 2
                                                                                                                                                                                                                                                                  ? const DecorationImage(
                                                                                                                                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                                                                                                                                      image: AssetImage('lib/images/BlueY2K3.png'),
                                                                                                                                                                                                                                                                    )
                                                                                                                                                                                                                                                                  : index == 3
                                                                                                                                                                                                                                                                      ? const DecorationImage(
                                                                                                                                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                                                                                                                                          image: AssetImage('lib/images/BlueY2K4.png'),
                                                                                                                                                                                                                                                                        )
                                                                                                                                                                                                                                                                      : index == 4
                                                                                                                                                                                                                                                                          ? const DecorationImage(
                                                                                                                                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                                                                                                                                              image: AssetImage('lib/images/BlueY2K5.png'),
                                                                                                                                                                                                                                                                            )
                                                                                                                                                                                                                                                                          : const DecorationImage(
                                                                                                                                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                                                                                                                                              image: AssetImage('lib/images/doja.png'),
                                                                                                                                                                                                                                                                            ))
                                                                                                                                                                                                                                                      : (selectedColor == 'Blue' && selectedColor2 == 'Academia') //start here start here start here start here start here start here start here start here start here start here
                                                                                                                                                                                                                                                          ? (index == 0
                                                                                                                                                                                                                                                              ? const DecorationImage(
                                                                                                                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                                                                                                                  image: AssetImage('lib/images/BlueDark1.png'),
                                                                                                                                                                                                                                                                )
                                                                                                                                                                                                                                                              : index == 1
                                                                                                                                                                                                                                                                  ? const DecorationImage(
                                                                                                                                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                                                                                                                                      image: AssetImage('lib/images/BlueDark2.png'),
                                                                                                                                                                                                                                                                    )
                                                                                                                                                                                                                                                                  : index == 2
                                                                                                                                                                                                                                                                      ? const DecorationImage(
                                                                                                                                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                                                                                                                                          image: AssetImage('lib/images/BlueDark3.png'),
                                                                                                                                                                                                                                                                        )
                                                                                                                                                                                                                                                                      : index == 3
                                                                                                                                                                                                                                                                          ? const DecorationImage(
                                                                                                                                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                                                                                                                                              image: AssetImage('lib/images/BlueDark4.png'),
                                                                                                                                                                                                                                                                            )
                                                                                                                                                                                                                                                                          : index == 4
                                                                                                                                                                                                                                                                              ? const DecorationImage(
                                                                                                                                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                  image: AssetImage('lib/images/BlueDark5.png'),
                                                                                                                                                                                                                                                                                )
                                                                                                                                                                                                                                                                              : const DecorationImage(
                                                                                                                                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                  image: AssetImage('lib/images/doja.png'),
                                                                                                                                                                                                                                                                                ))
                                                                                                                                                                                                                                                          : (selectedColor == 'Blue' && selectedColor2 == 'Kawaii')
                                                                                                                                                                                                                                                              ? (index == 0
                                                                                                                                                                                                                                                                  ? const DecorationImage(
                                                                                                                                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                                                                                                                                      image: AssetImage('lib/images/BlueKawaii1.png'),
                                                                                                                                                                                                                                                                    )
                                                                                                                                                                                                                                                                  : index == 1
                                                                                                                                                                                                                                                                      ? const DecorationImage(
                                                                                                                                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                                                                                                                                          image: AssetImage('lib/images/BlueKawaii2.png'),
                                                                                                                                                                                                                                                                        )
                                                                                                                                                                                                                                                                      : index == 2
                                                                                                                                                                                                                                                                          ? const DecorationImage(
                                                                                                                                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                                                                                                                                              image: AssetImage('lib/images/BlueKawaii3.png'),
                                                                                                                                                                                                                                                                            )
                                                                                                                                                                                                                                                                          : index == 3
                                                                                                                                                                                                                                                                              ? const DecorationImage(
                                                                                                                                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                  image: AssetImage('lib/images/BlueKawaii4.png'),
                                                                                                                                                                                                                                                                                )
                                                                                                                                                                                                                                                                              : index == 4
                                                                                                                                                                                                                                                                                  ? const DecorationImage(
                                                                                                                                                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                      image: AssetImage('lib/images/BlueKawaii5.png'),
                                                                                                                                                                                                                                                                                    )
                                                                                                                                                                                                                                                                                  : const DecorationImage(
                                                                                                                                                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                      image: AssetImage('lib/images/doja.png'),
                                                                                                                                                                                                                                                                                    ))
                                                                                                                                                                                                                                                              : (selectedColor == 'Blue' && selectedColor2 == 'Vintage')
                                                                                                                                                                                                                                                                  ? (index == 0
                                                                                                                                                                                                                                                                      ? const DecorationImage(
                                                                                                                                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                                                                                                                                          image: AssetImage('lib/images/BlueVintage1.png'),
                                                                                                                                                                                                                                                                        )
                                                                                                                                                                                                                                                                      : index == 1
                                                                                                                                                                                                                                                                          ? const DecorationImage(
                                                                                                                                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                                                                                                                                              image: AssetImage('lib/images/BlueVintage2.png'),
                                                                                                                                                                                                                                                                            )
                                                                                                                                                                                                                                                                          : index == 2
                                                                                                                                                                                                                                                                              ? const DecorationImage(
                                                                                                                                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                  image: AssetImage('lib/images/BlueVintage3.png'),
                                                                                                                                                                                                                                                                                )
                                                                                                                                                                                                                                                                              : index == 3
                                                                                                                                                                                                                                                                                  ? const DecorationImage(
                                                                                                                                                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                      image: AssetImage('lib/images/BlueVintage4.png'),
                                                                                                                                                                                                                                                                                    )
                                                                                                                                                                                                                                                                                  : index == 4
                                                                                                                                                                                                                                                                                      ? const DecorationImage(
                                                                                                                                                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                          image: AssetImage('lib/images/BlueVintage5.png'),
                                                                                                                                                                                                                                                                                        )
                                                                                                                                                                                                                                                                                      : const DecorationImage(
                                                                                                                                                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                          image: AssetImage('lib/images/doja.png'),
                                                                                                                                                                                                                                                                                        ))
                                                                                                                                                                                                                                                                  : (selectedColor == 'Blue' && selectedColor2 == 'Boho') //start here start here start here start here start here start here start here start here start here start here
                                                                                                                                                                                                                                                                      ? (index == 0
                                                                                                                                                                                                                                                                          ? const DecorationImage(
                                                                                                                                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                                                                                                                                              image: AssetImage('lib/images/BlueBoho1.png'),
                                                                                                                                                                                                                                                                            )
                                                                                                                                                                                                                                                                          : index == 1
                                                                                                                                                                                                                                                                              ? const DecorationImage(
                                                                                                                                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                  image: AssetImage('lib/images/BlueBoho2.png'),
                                                                                                                                                                                                                                                                                )
                                                                                                                                                                                                                                                                              : index == 2
                                                                                                                                                                                                                                                                                  ? const DecorationImage(
                                                                                                                                                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                      image: AssetImage('lib/images/BlueBoho3.png'),
                                                                                                                                                                                                                                                                                    )
                                                                                                                                                                                                                                                                                  : index == 3
                                                                                                                                                                                                                                                                                      ? const DecorationImage(
                                                                                                                                                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                          image: AssetImage('lib/images/BlueBoho4.png'),
                                                                                                                                                                                                                                                                                        )
                                                                                                                                                                                                                                                                                      : index == 4
                                                                                                                                                                                                                                                                                          ? const DecorationImage(
                                                                                                                                                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                              image: AssetImage('lib/images/BlueBoho5.png'),
                                                                                                                                                                                                                                                                                            )
                                                                                                                                                                                                                                                                                          : const DecorationImage(
                                                                                                                                                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                              image: AssetImage('lib/images/doja.png'),
                                                                                                                                                                                                                                                                                            ))
                                                                                                                                                                                                                                                                      : (selectedColor == 'Purple' && selectedColor2 == 'Indie') //start here start here start here start here start here start here start here start here start here start here
                                                                                                                                                                                                                                                                          ? (index == 0
                                                                                                                                                                                                                                                                              ? const DecorationImage(
                                                                                                                                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                  image: AssetImage('lib/images/PurpleIndie1.png'),
                                                                                                                                                                                                                                                                                )
                                                                                                                                                                                                                                                                              : index == 1
                                                                                                                                                                                                                                                                                  ? const DecorationImage(
                                                                                                                                                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                      image: AssetImage('lib/images/PurpleIndie2.png'),
                                                                                                                                                                                                                                                                                    )
                                                                                                                                                                                                                                                                                  : index == 2
                                                                                                                                                                                                                                                                                      ? const DecorationImage(
                                                                                                                                                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                          image: AssetImage('lib/images/PurpleIndie3.png'),
                                                                                                                                                                                                                                                                                        )
                                                                                                                                                                                                                                                                                      : index == 3
                                                                                                                                                                                                                                                                                          ? const DecorationImage(
                                                                                                                                                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                              image: AssetImage('lib/images/PurpleIndie4.png'),
                                                                                                                                                                                                                                                                                            )
                                                                                                                                                                                                                                                                                          : index == 4
                                                                                                                                                                                                                                                                                              ? const DecorationImage(
                                                                                                                                                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                  image: AssetImage('lib/images/PurpleIndie5.png'),
                                                                                                                                                                                                                                                                                                )
                                                                                                                                                                                                                                                                                              : const DecorationImage(
                                                                                                                                                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                  image: AssetImage('lib/images/doja.png'),
                                                                                                                                                                                                                                                                                                ))
                                                                                                                                                                                                                                                                          : (selectedColor == 'Purple' && selectedColor2 == 'Grunge') //start here start here start here start here start here start here start here start here start here start here
                                                                                                                                                                                                                                                                              ? (index == 0
                                                                                                                                                                                                                                                                                  ? const DecorationImage(
                                                                                                                                                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                      image: AssetImage('lib/images/PurpleGrunge1.png'),
                                                                                                                                                                                                                                                                                    )
                                                                                                                                                                                                                                                                                  : index == 1
                                                                                                                                                                                                                                                                                      ? const DecorationImage(
                                                                                                                                                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                          image: AssetImage('lib/images/PurpleGrunge2.png'),
                                                                                                                                                                                                                                                                                        )
                                                                                                                                                                                                                                                                                      : index == 2
                                                                                                                                                                                                                                                                                          ? const DecorationImage(
                                                                                                                                                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                              image: AssetImage('lib/images/PurpleGrunge3.png'),
                                                                                                                                                                                                                                                                                            )
                                                                                                                                                                                                                                                                                          : index == 3
                                                                                                                                                                                                                                                                                              ? const DecorationImage(
                                                                                                                                                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                  image: AssetImage('lib/images/PurpleGrunge4.png'),
                                                                                                                                                                                                                                                                                                )
                                                                                                                                                                                                                                                                                              : index == 4
                                                                                                                                                                                                                                                                                                  ? const DecorationImage(
                                                                                                                                                                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                      image: AssetImage('lib/images/PurpleGrunge5.png'),
                                                                                                                                                                                                                                                                                                    )
                                                                                                                                                                                                                                                                                                  : const DecorationImage(
                                                                                                                                                                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                      image: AssetImage('lib/images/doja.png'),
                                                                                                                                                                                                                                                                                                    ))
                                                                                                                                                                                                                                                                              : (selectedColor == 'Purple' && selectedColor2 == 'Soft') //start here start here start here start here start here start here start here start here start here start here
                                                                                                                                                                                                                                                                                  ? (index == 0
                                                                                                                                                                                                                                                                                      ? const DecorationImage(
                                                                                                                                                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                          image: AssetImage('lib/images/PurpleSoft1.png'),
                                                                                                                                                                                                                                                                                        )
                                                                                                                                                                                                                                                                                      : index == 1
                                                                                                                                                                                                                                                                                          ? const DecorationImage(
                                                                                                                                                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                              image: AssetImage('lib/images/PurpleSoft2.png'),
                                                                                                                                                                                                                                                                                            )
                                                                                                                                                                                                                                                                                          : index == 2
                                                                                                                                                                                                                                                                                              ? const DecorationImage(
                                                                                                                                                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                  image: AssetImage('lib/images/PurpleSoft3.png'),
                                                                                                                                                                                                                                                                                                )
                                                                                                                                                                                                                                                                                              : index == 3
                                                                                                                                                                                                                                                                                                  ? const DecorationImage(
                                                                                                                                                                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                      image: AssetImage('lib/images/PurpleSoft4.png'),
                                                                                                                                                                                                                                                                                                    )
                                                                                                                                                                                                                                                                                                  : index == 4
                                                                                                                                                                                                                                                                                                      ? const DecorationImage(
                                                                                                                                                                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                          image: AssetImage('lib/images/PurpleSoft5.png'),
                                                                                                                                                                                                                                                                                                        )
                                                                                                                                                                                                                                                                                                      : const DecorationImage(
                                                                                                                                                                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                          image: AssetImage('lib/images/doja.png'),
                                                                                                                                                                                                                                                                                                        ))
                                                                                                                                                                                                                                                                                  : (selectedColor == 'Purple' && selectedColor2 == 'Y2K') //start here start here start here start here start here start here start here start here start here start here
                                                                                                                                                                                                                                                                                      ? (index == 0
                                                                                                                                                                                                                                                                                          ? const DecorationImage(
                                                                                                                                                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                              image: AssetImage('lib/images/PurpleY2K1.png'),
                                                                                                                                                                                                                                                                                            )
                                                                                                                                                                                                                                                                                          : index == 1
                                                                                                                                                                                                                                                                                              ? const DecorationImage(
                                                                                                                                                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                  image: AssetImage('lib/images/PurpleY2K2.png'),
                                                                                                                                                                                                                                                                                                )
                                                                                                                                                                                                                                                                                              : index == 2
                                                                                                                                                                                                                                                                                                  ? const DecorationImage(
                                                                                                                                                                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                      image: AssetImage('lib/images/PurpleY2K3.png'),
                                                                                                                                                                                                                                                                                                    )
                                                                                                                                                                                                                                                                                                  : index == 3
                                                                                                                                                                                                                                                                                                      ? const DecorationImage(
                                                                                                                                                                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                          image: AssetImage('lib/images/PurpleY2K4.png'),
                                                                                                                                                                                                                                                                                                        )
                                                                                                                                                                                                                                                                                                      : index == 4
                                                                                                                                                                                                                                                                                                          ? const DecorationImage(
                                                                                                                                                                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                              image: AssetImage('lib/images/PurpleY2K5.png'),
                                                                                                                                                                                                                                                                                                            )
                                                                                                                                                                                                                                                                                                          : const DecorationImage(
                                                                                                                                                                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                              image: AssetImage('lib/images/doja.png'),
                                                                                                                                                                                                                                                                                                            ))
                                                                                                                                                                                                                                                                                      : (selectedColor == 'Purple' && selectedColor2 == 'Academia') //start here start here start here start here start here start here start here start here start here start here
                                                                                                                                                                                                                                                                                          ? (index == 0
                                                                                                                                                                                                                                                                                              ? const DecorationImage(
                                                                                                                                                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                  image: AssetImage('lib/images/PurpleDark1.png'),
                                                                                                                                                                                                                                                                                                )
                                                                                                                                                                                                                                                                                              : index == 1
                                                                                                                                                                                                                                                                                                  ? const DecorationImage(
                                                                                                                                                                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                      image: AssetImage('lib/images/PurpleDark2.png'),
                                                                                                                                                                                                                                                                                                    )
                                                                                                                                                                                                                                                                                                  : index == 2
                                                                                                                                                                                                                                                                                                      ? const DecorationImage(
                                                                                                                                                                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                          image: AssetImage('lib/images/PurpleDark3.png'),
                                                                                                                                                                                                                                                                                                        )
                                                                                                                                                                                                                                                                                                      : index == 3
                                                                                                                                                                                                                                                                                                          ? const DecorationImage(
                                                                                                                                                                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                              image: AssetImage('lib/images/PurpleDark4.png'),
                                                                                                                                                                                                                                                                                                            )
                                                                                                                                                                                                                                                                                                          : index == 4
                                                                                                                                                                                                                                                                                                              ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                  image: AssetImage('lib/images/PurpleDark5.png'),
                                                                                                                                                                                                                                                                                                                )
                                                                                                                                                                                                                                                                                                              : const DecorationImage(
                                                                                                                                                                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                  image: AssetImage('lib/images/doja.png'),
                                                                                                                                                                                                                                                                                                                ))
                                                                                                                                                                                                                                                                                          : (selectedColor == 'Purple' && selectedColor2 == 'Kawaii') //start here start here start here start here start here start here start here start here start here start here
                                                                                                                                                                                                                                                                                              ? (index == 0
                                                                                                                                                                                                                                                                                                  ? const DecorationImage(
                                                                                                                                                                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                      image: AssetImage('lib/images/PurpleKawaii1.png'),
                                                                                                                                                                                                                                                                                                    )
                                                                                                                                                                                                                                                                                                  : index == 1
                                                                                                                                                                                                                                                                                                      ? const DecorationImage(
                                                                                                                                                                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                          image: AssetImage('lib/images/PurpleKawaii2.png'),
                                                                                                                                                                                                                                                                                                        )
                                                                                                                                                                                                                                                                                                      : index == 2
                                                                                                                                                                                                                                                                                                          ? const DecorationImage(
                                                                                                                                                                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                              image: AssetImage('lib/images/PurpleKawaii3.png'),
                                                                                                                                                                                                                                                                                                            )
                                                                                                                                                                                                                                                                                                          : index == 3
                                                                                                                                                                                                                                                                                                              ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                  image: AssetImage('lib/images/PurpleKawaii4.png'),
                                                                                                                                                                                                                                                                                                                )
                                                                                                                                                                                                                                                                                                              : index == 4
                                                                                                                                                                                                                                                                                                                  ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                      image: AssetImage('lib/images/PurpleKawaii5.png'),
                                                                                                                                                                                                                                                                                                                    )
                                                                                                                                                                                                                                                                                                                  : const DecorationImage(
                                                                                                                                                                                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                      image: AssetImage('lib/images/doja.png'),
                                                                                                                                                                                                                                                                                                                    ))
                                                                                                                                                                                                                                                                                              : (selectedColor == 'Purple' && selectedColor2 == 'Vintage') //start here start here start here start here start here start here start here start here start here start here
                                                                                                                                                                                                                                                                                                  ? (index == 0
                                                                                                                                                                                                                                                                                                      ? const DecorationImage(
                                                                                                                                                                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                          image: AssetImage('lib/images/PurpleVintage1.png'),
                                                                                                                                                                                                                                                                                                        )
                                                                                                                                                                                                                                                                                                      : index == 1
                                                                                                                                                                                                                                                                                                          ? const DecorationImage(
                                                                                                                                                                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                              image: AssetImage('lib/images/PurpleVintage2.png'),
                                                                                                                                                                                                                                                                                                            )
                                                                                                                                                                                                                                                                                                          : index == 2
                                                                                                                                                                                                                                                                                                              ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                  image: AssetImage('lib/images/PurpleVintage3.png'),
                                                                                                                                                                                                                                                                                                                )
                                                                                                                                                                                                                                                                                                              : index == 3
                                                                                                                                                                                                                                                                                                                  ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                      image: AssetImage('lib/images/PurpleVintage4.png'),
                                                                                                                                                                                                                                                                                                                    )
                                                                                                                                                                                                                                                                                                                  : index == 4
                                                                                                                                                                                                                                                                                                                      ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                          image: AssetImage('lib/images/PurpleVintage5.png'),
                                                                                                                                                                                                                                                                                                                        )
                                                                                                                                                                                                                                                                                                                      : const DecorationImage(
                                                                                                                                                                                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                          image: AssetImage('lib/images/doja.png'),
                                                                                                                                                                                                                                                                                                                        ))
                                                                                                                                                                                                                                                                                                  : (selectedColor == 'Purple' && selectedColor2 == 'Boho') //start here start here start here start here start here start here start here start here start here start here
                                                                                                                                                                                                                                                                                                      ? (index == 0
                                                                                                                                                                                                                                                                                                          ? const DecorationImage(
                                                                                                                                                                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                              image: AssetImage('lib/images/PurpleBoho1.png'),
                                                                                                                                                                                                                                                                                                            )
                                                                                                                                                                                                                                                                                                          : index == 1
                                                                                                                                                                                                                                                                                                              ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                  image: AssetImage('lib/images/PurpleBoho2.png'),
                                                                                                                                                                                                                                                                                                                )
                                                                                                                                                                                                                                                                                                              : index == 2
                                                                                                                                                                                                                                                                                                                  ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                      image: AssetImage('lib/images/PurpleBoho3.png'),
                                                                                                                                                                                                                                                                                                                    )
                                                                                                                                                                                                                                                                                                                  : index == 3
                                                                                                                                                                                                                                                                                                                      ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                          image: AssetImage('lib/images/PurpleBoho4.png'),
                                                                                                                                                                                                                                                                                                                        )
                                                                                                                                                                                                                                                                                                                      : index == 4
                                                                                                                                                                                                                                                                                                                          ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                              image: AssetImage('lib/images/PurpleBoho5.png'),
                                                                                                                                                                                                                                                                                                                            )
                                                                                                                                                                                                                                                                                                                          : const DecorationImage(
                                                                                                                                                                                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                              image: AssetImage('lib/images/doja.png'),
                                                                                                                                                                                                                                                                                                                            ))
                                                                                                                                                                                                                                                                                                      : (selectedColor == 'Brown' && selectedColor2 == 'Indie') //start here start here start here start here start here start here start here start here start here start here
                                                                                                                                                                                                                                                                                                          ? (index == 0
                                                                                                                                                                                                                                                                                                              ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                  image: AssetImage('lib/images/BrownIndie1.png'),
                                                                                                                                                                                                                                                                                                                )
                                                                                                                                                                                                                                                                                                              : index == 1
                                                                                                                                                                                                                                                                                                                  ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                      image: AssetImage('lib/images/BrownIndie2.png'),
                                                                                                                                                                                                                                                                                                                    )
                                                                                                                                                                                                                                                                                                                  : index == 2
                                                                                                                                                                                                                                                                                                                      ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                          image: AssetImage('lib/images/BrownIndie3.png'),
                                                                                                                                                                                                                                                                                                                        )
                                                                                                                                                                                                                                                                                                                      : index == 3
                                                                                                                                                                                                                                                                                                                          ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                              image: AssetImage('lib/images/BrownIndie4.png'),
                                                                                                                                                                                                                                                                                                                            )
                                                                                                                                                                                                                                                                                                                          : index == 4
                                                                                                                                                                                                                                                                                                                              ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                  image: AssetImage('lib/images/BrownIndie5.png'),
                                                                                                                                                                                                                                                                                                                                )
                                                                                                                                                                                                                                                                                                                              : const DecorationImage(
                                                                                                                                                                                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                  image: AssetImage('lib/images/doja.png'),
                                                                                                                                                                                                                                                                                                                                ))
                                                                                                                                                                                                                                                                                                          : (selectedColor == 'Brown' && selectedColor2 == 'Grunge') //start here start here start here start here start here start here start here start here start here start here
                                                                                                                                                                                                                                                                                                              ? (index == 0
                                                                                                                                                                                                                                                                                                                  ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                      image: AssetImage('lib/images/BrownGrunge1.png'),
                                                                                                                                                                                                                                                                                                                    )
                                                                                                                                                                                                                                                                                                                  : index == 1
                                                                                                                                                                                                                                                                                                                      ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                          image: AssetImage('lib/images/BrownGrunge2.png'),
                                                                                                                                                                                                                                                                                                                        )
                                                                                                                                                                                                                                                                                                                      : index == 2
                                                                                                                                                                                                                                                                                                                          ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                              image: AssetImage('lib/images/BrownGrunge3.png'),
                                                                                                                                                                                                                                                                                                                            )
                                                                                                                                                                                                                                                                                                                          : index == 3
                                                                                                                                                                                                                                                                                                                              ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                  image: AssetImage('lib/images/BrownGrunge4.png'),
                                                                                                                                                                                                                                                                                                                                )
                                                                                                                                                                                                                                                                                                                              : index == 4
                                                                                                                                                                                                                                                                                                                                  ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                      image: AssetImage('lib/images/BrownGrunge5.png'),
                                                                                                                                                                                                                                                                                                                                    )
                                                                                                                                                                                                                                                                                                                                  : const DecorationImage(
                                                                                                                                                                                                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                      image: AssetImage('lib/images/doja.png'),
                                                                                                                                                                                                                                                                                                                                    ))
                                                                                                                                                                                                                                                                                                              : (selectedColor == 'Brown' && selectedColor2 == 'Soft') //start here start here start here start here start here start here start here start here start here start here
                                                                                                                                                                                                                                                                                                                  ? (index == 0
                                                                                                                                                                                                                                                                                                                      ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                          image: AssetImage('lib/images/BrownSoft1.png'),
                                                                                                                                                                                                                                                                                                                        )
                                                                                                                                                                                                                                                                                                                      : index == 1
                                                                                                                                                                                                                                                                                                                          ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                              image: AssetImage('lib/images/BrownSoft2.png'),
                                                                                                                                                                                                                                                                                                                            )
                                                                                                                                                                                                                                                                                                                          : index == 2
                                                                                                                                                                                                                                                                                                                              ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                  image: AssetImage('lib/images/BrownSoft3.png'),
                                                                                                                                                                                                                                                                                                                                )
                                                                                                                                                                                                                                                                                                                              : index == 3
                                                                                                                                                                                                                                                                                                                                  ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                      image: AssetImage('lib/images/BrownSoft4.png'),
                                                                                                                                                                                                                                                                                                                                    )
                                                                                                                                                                                                                                                                                                                                  : index == 4
                                                                                                                                                                                                                                                                                                                                      ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                          image: AssetImage('lib/images/BrownSoft5.png'),
                                                                                                                                                                                                                                                                                                                                        )
                                                                                                                                                                                                                                                                                                                                      : const DecorationImage(
                                                                                                                                                                                                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                          image: AssetImage('lib/images/doja.png'),
                                                                                                                                                                                                                                                                                                                                        ))
                                                                                                                                                                                                                                                                                                                  : (selectedColor == 'Brown' && selectedColor2 == 'Y2K') //start here start here start here start here start here start here start here start here start here start here
                                                                                                                                                                                                                                                                                                                      ? (index == 0
                                                                                                                                                                                                                                                                                                                          ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                              image: AssetImage('lib/images/BrownY2K1.png'),
                                                                                                                                                                                                                                                                                                                            )
                                                                                                                                                                                                                                                                                                                          : index == 1
                                                                                                                                                                                                                                                                                                                              ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                  image: AssetImage('lib/images/BrownY2K2.png'),
                                                                                                                                                                                                                                                                                                                                )
                                                                                                                                                                                                                                                                                                                              : index == 2
                                                                                                                                                                                                                                                                                                                                  ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                      image: AssetImage('lib/images/BrownY2K3.png'),
                                                                                                                                                                                                                                                                                                                                    )
                                                                                                                                                                                                                                                                                                                                  : index == 3
                                                                                                                                                                                                                                                                                                                                      ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                          image: AssetImage('lib/images/BrownY2K4.png'),
                                                                                                                                                                                                                                                                                                                                        )
                                                                                                                                                                                                                                                                                                                                      : index == 4
                                                                                                                                                                                                                                                                                                                                          ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                              image: AssetImage('lib/images/BrownY2K5.png'),
                                                                                                                                                                                                                                                                                                                                            )
                                                                                                                                                                                                                                                                                                                                          : const DecorationImage(
                                                                                                                                                                                                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                              image: AssetImage('lib/images/doja.png'),
                                                                                                                                                                                                                                                                                                                                            ))
                                                                                                                                                                                                                                                                                                                      : (selectedColor == 'Brown' && selectedColor2 == 'Academia') //start here start here start here start here start here start here start here start here start here start here
                                                                                                                                                                                                                                                                                                                          ? (index == 0
                                                                                                                                                                                                                                                                                                                              ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                  image: AssetImage('lib/images/BrownDark1.png'),
                                                                                                                                                                                                                                                                                                                                )
                                                                                                                                                                                                                                                                                                                              : index == 1
                                                                                                                                                                                                                                                                                                                                  ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                      image: AssetImage('lib/images/BrownDark2.png'),
                                                                                                                                                                                                                                                                                                                                    )
                                                                                                                                                                                                                                                                                                                                  : index == 2
                                                                                                                                                                                                                                                                                                                                      ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                          image: AssetImage('lib/images/BrownDark3.png'),
                                                                                                                                                                                                                                                                                                                                        )
                                                                                                                                                                                                                                                                                                                                      : index == 3
                                                                                                                                                                                                                                                                                                                                          ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                              image: AssetImage('lib/images/BrownDark4.png'),
                                                                                                                                                                                                                                                                                                                                            )
                                                                                                                                                                                                                                                                                                                                          : index == 4
                                                                                                                                                                                                                                                                                                                                              ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                  image: AssetImage('lib/images/BrownDark5.png'),
                                                                                                                                                                                                                                                                                                                                                )
                                                                                                                                                                                                                                                                                                                                              : const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                  image: AssetImage('lib/images/doja.png'),
                                                                                                                                                                                                                                                                                                                                                ))
                                                                                                                                                                                                                                                                                                                          : (selectedColor == 'Brown' && selectedColor2 == 'Kawaii') //start here start here start here start here start here start here start here start here start here start here
                                                                                                                                                                                                                                                                                                                              ? (index == 0
                                                                                                                                                                                                                                                                                                                                  ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                      image: AssetImage('lib/images/BrownKawaii1.png'),
                                                                                                                                                                                                                                                                                                                                    )
                                                                                                                                                                                                                                                                                                                                  : index == 1
                                                                                                                                                                                                                                                                                                                                      ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                          image: AssetImage('lib/images/BrownKawaii2.png'),
                                                                                                                                                                                                                                                                                                                                        )
                                                                                                                                                                                                                                                                                                                                      : index == 2
                                                                                                                                                                                                                                                                                                                                          ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                              image: AssetImage('lib/images/BrownKawaii3.png'),
                                                                                                                                                                                                                                                                                                                                            )
                                                                                                                                                                                                                                                                                                                                          : index == 3
                                                                                                                                                                                                                                                                                                                                              ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                  image: AssetImage('lib/images/BrownKawaii4.png'),
                                                                                                                                                                                                                                                                                                                                                )
                                                                                                                                                                                                                                                                                                                                              : index == 4
                                                                                                                                                                                                                                                                                                                                                  ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                      image: AssetImage('lib/images/BrownKawaii5.png'),
                                                                                                                                                                                                                                                                                                                                                    )
                                                                                                                                                                                                                                                                                                                                                  : const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                      image: AssetImage('lib/images/doja.png'),
                                                                                                                                                                                                                                                                                                                                                    ))
                                                                                                                                                                                                                                                                                                                              : (selectedColor == 'Brown' && selectedColor2 == 'Vintage')
                                                                                                                                                                                                                                                                                                                                  ? (index == 0
                                                                                                                                                                                                                                                                                                                                      ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                          image: AssetImage('lib/images/BrownVintage1.png'),
                                                                                                                                                                                                                                                                                                                                        )
                                                                                                                                                                                                                                                                                                                                      : index == 1
                                                                                                                                                                                                                                                                                                                                          ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                              image: AssetImage('lib/images/BrownVintage2.png'),
                                                                                                                                                                                                                                                                                                                                            )
                                                                                                                                                                                                                                                                                                                                          : index == 2
                                                                                                                                                                                                                                                                                                                                              ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                  image: AssetImage('lib/images/BrownVintage3.png'),
                                                                                                                                                                                                                                                                                                                                                )
                                                                                                                                                                                                                                                                                                                                              : index == 3
                                                                                                                                                                                                                                                                                                                                                  ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                      image: AssetImage('lib/images/BrownVintage4.png'),
                                                                                                                                                                                                                                                                                                                                                    )
                                                                                                                                                                                                                                                                                                                                                  : index == 4
                                                                                                                                                                                                                                                                                                                                                      ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                          image: AssetImage('lib/images/BrownVintage5.png'),
                                                                                                                                                                                                                                                                                                                                                        )
                                                                                                                                                                                                                                                                                                                                                      : const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                          image: AssetImage('lib/images/doja.png'),
                                                                                                                                                                                                                                                                                                                                                        ))
                                                                                                                                                                                                                                                                                                                                  : (selectedColor == 'Brown' && selectedColor2 == 'Boho') //start here start here start here start here start here start here start here start here start here start here
                                                                                                                                                                                                                                                                                                                                      ? (index == 0
                                                                                                                                                                                                                                                                                                                                          ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                              image: AssetImage('lib/images/BrownBoho1.png'),
                                                                                                                                                                                                                                                                                                                                            )
                                                                                                                                                                                                                                                                                                                                          : index == 1
                                                                                                                                                                                                                                                                                                                                              ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                  image: AssetImage('lib/images/BrownBoho2.png'),
                                                                                                                                                                                                                                                                                                                                                )
                                                                                                                                                                                                                                                                                                                                              : index == 2
                                                                                                                                                                                                                                                                                                                                                  ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                      image: AssetImage('lib/images/BrownBoho3.png'),
                                                                                                                                                                                                                                                                                                                                                    )
                                                                                                                                                                                                                                                                                                                                                  : index == 3
                                                                                                                                                                                                                                                                                                                                                      ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                          image: AssetImage('lib/images/BrownBoho4.png'),
                                                                                                                                                                                                                                                                                                                                                        )
                                                                                                                                                                                                                                                                                                                                                      : index == 4
                                                                                                                                                                                                                                                                                                                                                          ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                              image: AssetImage('lib/images/BrownBoho5.png'),
                                                                                                                                                                                                                                                                                                                                                            )
                                                                                                                                                                                                                                                                                                                                                          : const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                              image: AssetImage('lib/images/doja.png'),
                                                                                                                                                                                                                                                                                                                                                            ))
                                                                                                                                                                                                                                                                                                                                      : (selectedColor == 'Gray' && selectedColor2 == 'Indie') //start here start here start here start here start here start here start here start here start here start here
                                                                                                                                                                                                                                                                                                                                          ? (index == 0
                                                                                                                                                                                                                                                                                                                                              ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                  image: AssetImage('lib/images/GrayIndie1.png'),
                                                                                                                                                                                                                                                                                                                                                )
                                                                                                                                                                                                                                                                                                                                              : index == 1
                                                                                                                                                                                                                                                                                                                                                  ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                      image: AssetImage('lib/images/GrayIndie2.png'),
                                                                                                                                                                                                                                                                                                                                                    )
                                                                                                                                                                                                                                                                                                                                                  : index == 2
                                                                                                                                                                                                                                                                                                                                                      ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                          image: AssetImage('lib/images/GrayIndie3.png'),
                                                                                                                                                                                                                                                                                                                                                        )
                                                                                                                                                                                                                                                                                                                                                      : index == 3
                                                                                                                                                                                                                                                                                                                                                          ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                              image: AssetImage('lib/images/GrayIndie4.png'),
                                                                                                                                                                                                                                                                                                                                                            )
                                                                                                                                                                                                                                                                                                                                                          : index == 4
                                                                                                                                                                                                                                                                                                                                                              ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                                  image: AssetImage('lib/images/GrayIndie5.png'),
                                                                                                                                                                                                                                                                                                                                                                )
                                                                                                                                                                                                                                                                                                                                                              : const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                                  image: AssetImage('lib/images/doja.png'),
                                                                                                                                                                                                                                                                                                                                                                ))
                                                                                                                                                                                                                                                                                                                                          : (selectedColor == 'Gray' && selectedColor2 == 'Grunge') //start here start here start here start here start here start here start here start here start here start here
                                                                                                                                                                                                                                                                                                                                              ? (index == 0
                                                                                                                                                                                                                                                                                                                                                  ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                      image: AssetImage('lib/images/GrayGrunge1.png'),
                                                                                                                                                                                                                                                                                                                                                    )
                                                                                                                                                                                                                                                                                                                                                  : index == 1
                                                                                                                                                                                                                                                                                                                                                      ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                          image: AssetImage('lib/images/GrayGrunge2.png'),
                                                                                                                                                                                                                                                                                                                                                        )
                                                                                                                                                                                                                                                                                                                                                      : index == 2
                                                                                                                                                                                                                                                                                                                                                          ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                              image: AssetImage('lib/images/GrayGrunge3.png'),
                                                                                                                                                                                                                                                                                                                                                            )
                                                                                                                                                                                                                                                                                                                                                          : index == 3
                                                                                                                                                                                                                                                                                                                                                              ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                                  image: AssetImage('lib/images/GrayGrunge4.png'),
                                                                                                                                                                                                                                                                                                                                                                )
                                                                                                                                                                                                                                                                                                                                                              : index == 4
                                                                                                                                                                                                                                                                                                                                                                  ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                                      image: AssetImage('lib/images/GrayGrunge5.png'),
                                                                                                                                                                                                                                                                                                                                                                    )
                                                                                                                                                                                                                                                                                                                                                                  : const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                                      image: AssetImage('lib/images/doja.png'),
                                                                                                                                                                                                                                                                                                                                                                    ))
                                                                                                                                                                                                                                                                                                                                              : (selectedColor == 'Gray' && selectedColor2 == 'Soft') //start here start here start here start here start here start here start here start here start here start here
                                                                                                                                                                                                                                                                                                                                                  ? (index == 0
                                                                                                                                                                                                                                                                                                                                                      ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                          image: AssetImage('lib/images/GraySoft1.png'),
                                                                                                                                                                                                                                                                                                                                                        )
                                                                                                                                                                                                                                                                                                                                                      : index == 1
                                                                                                                                                                                                                                                                                                                                                          ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                              image: AssetImage('lib/images/GraySoft2.png'),
                                                                                                                                                                                                                                                                                                                                                            )
                                                                                                                                                                                                                                                                                                                                                          : index == 2
                                                                                                                                                                                                                                                                                                                                                              ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                                  image: AssetImage('lib/images/GraySoft3.png'),
                                                                                                                                                                                                                                                                                                                                                                )
                                                                                                                                                                                                                                                                                                                                                              : index == 3
                                                                                                                                                                                                                                                                                                                                                                  ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                                      image: AssetImage('lib/images/GraySoft4.png'),
                                                                                                                                                                                                                                                                                                                                                                    )
                                                                                                                                                                                                                                                                                                                                                                  : index == 4
                                                                                                                                                                                                                                                                                                                                                                      ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                                          image: AssetImage('lib/images/GraySoft5.png'),
                                                                                                                                                                                                                                                                                                                                                                        )
                                                                                                                                                                                                                                                                                                                                                                      : const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                                          image: AssetImage('lib/images/doja.png'),
                                                                                                                                                                                                                                                                                                                                                                        ))
                                                                                                                                                                                                                                                                                                                                                  : (selectedColor == 'Gray' && selectedColor2 == 'Y2K') //start here start here start here start here start here start here start here start here start here start here
                                                                                                                                                                                                                                                                                                                                                      ? (index == 0
                                                                                                                                                                                                                                                                                                                                                          ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                              image: AssetImage('lib/images/GrayY2K1.png'),
                                                                                                                                                                                                                                                                                                                                                            )
                                                                                                                                                                                                                                                                                                                                                          : index == 1
                                                                                                                                                                                                                                                                                                                                                              ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                                  image: AssetImage('lib/images/GrayY2K2.png'),
                                                                                                                                                                                                                                                                                                                                                                )
                                                                                                                                                                                                                                                                                                                                                              : index == 2
                                                                                                                                                                                                                                                                                                                                                                  ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                                      image: AssetImage('lib/images/GrayY2K3.png'),
                                                                                                                                                                                                                                                                                                                                                                    )
                                                                                                                                                                                                                                                                                                                                                                  : index == 3
                                                                                                                                                                                                                                                                                                                                                                      ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                                          image: AssetImage('lib/images/GrayY2K4.png'),
                                                                                                                                                                                                                                                                                                                                                                        )
                                                                                                                                                                                                                                                                                                                                                                      : index == 4
                                                                                                                                                                                                                                                                                                                                                                          ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                                              image: AssetImage('lib/images/GrayY2K5.png'),
                                                                                                                                                                                                                                                                                                                                                                            )
                                                                                                                                                                                                                                                                                                                                                                          : const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                                              image: AssetImage('lib/images/doja.png'),
                                                                                                                                                                                                                                                                                                                                                                            ))
                                                                                                                                                                                                                                                                                                                                                      : (selectedColor == 'Gray' && selectedColor2 == 'Academia') //start here start here start here start here start here start here start here start here start here start here
                                                                                                                                                                                                                                                                                                                                                          ? (index == 0
                                                                                                                                                                                                                                                                                                                                                              ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                                  image: AssetImage('lib/images/GrayDark1.png'),
                                                                                                                                                                                                                                                                                                                                                                )
                                                                                                                                                                                                                                                                                                                                                              : index == 1
                                                                                                                                                                                                                                                                                                                                                                  ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                                      image: AssetImage('lib/images/GrayDark2.png'),
                                                                                                                                                                                                                                                                                                                                                                    )
                                                                                                                                                                                                                                                                                                                                                                  : index == 2
                                                                                                                                                                                                                                                                                                                                                                      ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                                          image: AssetImage('lib/images/GrayDark3.png'),
                                                                                                                                                                                                                                                                                                                                                                        )
                                                                                                                                                                                                                                                                                                                                                                      : index == 3
                                                                                                                                                                                                                                                                                                                                                                          ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                                              image: AssetImage('lib/images/GrayDark4.png'),
                                                                                                                                                                                                                                                                                                                                                                            )
                                                                                                                                                                                                                                                                                                                                                                          : index == 4
                                                                                                                                                                                                                                                                                                                                                                              ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                                                  image: AssetImage('lib/images/GrayDark5.png'),
                                                                                                                                                                                                                                                                                                                                                                                )
                                                                                                                                                                                                                                                                                                                                                                              : const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                                                  image: AssetImage('lib/images/doja.png'),
                                                                                                                                                                                                                                                                                                                                                                                ))
                                                                                                                                                                                                                                                                                                                                                          : (selectedColor == 'Gray' && selectedColor2 == 'Kawaii') //start here start here start here start here start here start here start here start here start here start here
                                                                                                                                                                                                                                                                                                                                                              ? (index == 0
                                                                                                                                                                                                                                                                                                                                                                  ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                                      image: AssetImage('lib/images/GrayKawaii1.png'),
                                                                                                                                                                                                                                                                                                                                                                    )
                                                                                                                                                                                                                                                                                                                                                                  : index == 1
                                                                                                                                                                                                                                                                                                                                                                      ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                                          image: AssetImage('lib/images/GrayKawaii2.png'),
                                                                                                                                                                                                                                                                                                                                                                        )
                                                                                                                                                                                                                                                                                                                                                                      : index == 2
                                                                                                                                                                                                                                                                                                                                                                          ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                                              image: AssetImage('lib/images/GrayKawaii3.png'),
                                                                                                                                                                                                                                                                                                                                                                            )
                                                                                                                                                                                                                                                                                                                                                                          : index == 3
                                                                                                                                                                                                                                                                                                                                                                              ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                                                  image: AssetImage('lib/images/GrayKawaii4.png'),
                                                                                                                                                                                                                                                                                                                                                                                )
                                                                                                                                                                                                                                                                                                                                                                              : index == 4
                                                                                                                                                                                                                                                                                                                                                                                  ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                                                      image: AssetImage('lib/images/GrayKawaii5.png'),
                                                                                                                                                                                                                                                                                                                                                                                    )
                                                                                                                                                                                                                                                                                                                                                                                  : const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                                                      image: AssetImage('lib/images/doja.png'),
                                                                                                                                                                                                                                                                                                                                                                                    ))
                                                                                                                                                                                                                                                                                                                                                              : (selectedColor == 'Gray' && selectedColor2 == 'Vintage') //start here start here start here start here start here start here start here start here start here start here
                                                                                                                                                                                                                                                                                                                                                                  ? (index == 0
                                                                                                                                                                                                                                                                                                                                                                      ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                                          image: AssetImage('lib/images/GrayVintage1.png'),
                                                                                                                                                                                                                                                                                                                                                                        )
                                                                                                                                                                                                                                                                                                                                                                      : index == 1
                                                                                                                                                                                                                                                                                                                                                                          ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                                              image: AssetImage('lib/images/GrayVintage2.png'),
                                                                                                                                                                                                                                                                                                                                                                            )
                                                                                                                                                                                                                                                                                                                                                                          : index == 2
                                                                                                                                                                                                                                                                                                                                                                              ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                                                  image: AssetImage('lib/images/GrayVintage3.png'),
                                                                                                                                                                                                                                                                                                                                                                                )
                                                                                                                                                                                                                                                                                                                                                                              : index == 3
                                                                                                                                                                                                                                                                                                                                                                                  ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                                                      image: AssetImage('lib/images/GrayVintage4.png'),
                                                                                                                                                                                                                                                                                                                                                                                    )
                                                                                                                                                                                                                                                                                                                                                                                  : index == 4
                                                                                                                                                                                                                                                                                                                                                                                      ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                                                          image: AssetImage('lib/images/GrayVintage5.png'),
                                                                                                                                                                                                                                                                                                                                                                                        )
                                                                                                                                                                                                                                                                                                                                                                                      : const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                                                          image: AssetImage('lib/images/doja.png'),
                                                                                                                                                                                                                                                                                                                                                                                        ))
                                                                                                                                                                                                                                                                                                                                                                  : (selectedColor == 'Gray' && selectedColor2 == 'Boho') //start here start here start here start here start here start here start here start here start here start here
                                                                                                                                                                                                                                                                                                                                                                      ? (index == 0
                                                                                                                                                                                                                                                                                                                                                                          ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                                              image: AssetImage('lib/images/GrayBoho1.png'),
                                                                                                                                                                                                                                                                                                                                                                            )
                                                                                                                                                                                                                                                                                                                                                                          : index == 1
                                                                                                                                                                                                                                                                                                                                                                              ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                                                  image: AssetImage('lib/images/GrayBoho2.png'),
                                                                                                                                                                                                                                                                                                                                                                                )
                                                                                                                                                                                                                                                                                                                                                                              : index == 2
                                                                                                                                                                                                                                                                                                                                                                                  ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                                                      image: AssetImage('lib/images/GrayBoho3.png'),
                                                                                                                                                                                                                                                                                                                                                                                    )
                                                                                                                                                                                                                                                                                                                                                                                  : index == 3
                                                                                                                                                                                                                                                                                                                                                                                      ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                                                          image: AssetImage('lib/images/GrayBoho4.png'),
                                                                                                                                                                                                                                                                                                                                                                                        )
                                                                                                                                                                                                                                                                                                                                                                                      : index == 4
                                                                                                                                                                                                                                                                                                                                                                                          ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                                                              image: AssetImage('lib/images/GrayBoho5.png'),
                                                                                                                                                                                                                                                                                                                                                                                            )
                                                                                                                                                                                                                                                                                                                                                                                          : const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                                                              image: AssetImage('lib/images/doja.png'),
                                                                                                                                                                                                                                                                                                                                                                                            ))
                                                                                                                                                                                                                                                                                                                                                                      : (selectedColor == 'Black' && selectedColor2 == 'Indie') //start here start here start here start here start here start here start here start here start here start here
                                                                                                                                                                                                                                                                                                                                                                          ? (index == 0
                                                                                                                                                                                                                                                                                                                                                                              ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                                                  image: AssetImage('lib/images/BlackIndie1.png'),
                                                                                                                                                                                                                                                                                                                                                                                )
                                                                                                                                                                                                                                                                                                                                                                              : index == 1
                                                                                                                                                                                                                                                                                                                                                                                  ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                                                      image: AssetImage('lib/images/BlackIndie2.png'),
                                                                                                                                                                                                                                                                                                                                                                                    )
                                                                                                                                                                                                                                                                                                                                                                                  : index == 2
                                                                                                                                                                                                                                                                                                                                                                                      ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                                                          image: AssetImage('lib/images/BlackIndie3.png'),
                                                                                                                                                                                                                                                                                                                                                                                        )
                                                                                                                                                                                                                                                                                                                                                                                      : index == 3
                                                                                                                                                                                                                                                                                                                                                                                          ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                                                              image: AssetImage('lib/images/BlackIndie4.png'),
                                                                                                                                                                                                                                                                                                                                                                                            )
                                                                                                                                                                                                                                                                                                                                                                                          : index == 4
                                                                                                                                                                                                                                                                                                                                                                                              ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                                                                  image: AssetImage('lib/images/BlackIndie5.png'),
                                                                                                                                                                                                                                                                                                                                                                                                )
                                                                                                                                                                                                                                                                                                                                                                                              : const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                                                                  image: AssetImage('lib/images/doja.png'),
                                                                                                                                                                                                                                                                                                                                                                                                ))
                                                                                                                                                                                                                                                                                                                                                                          : (selectedColor == 'Black' && selectedColor2 == 'Grunge') //start here start here start here start here start here start here start here start here start here start here
                                                                                                                                                                                                                                                                                                                                                                              ? (index == 0
                                                                                                                                                                                                                                                                                                                                                                                  ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                                                      image: AssetImage('lib/images/BlackGrunge1.png'),
                                                                                                                                                                                                                                                                                                                                                                                    )
                                                                                                                                                                                                                                                                                                                                                                                  : index == 1
                                                                                                                                                                                                                                                                                                                                                                                      ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                                                          image: AssetImage('lib/images/BlackGrunge2.png'),
                                                                                                                                                                                                                                                                                                                                                                                        )
                                                                                                                                                                                                                                                                                                                                                                                      : index == 2
                                                                                                                                                                                                                                                                                                                                                                                          ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                                                              image: AssetImage('lib/images/BlackGrunge3.png'),
                                                                                                                                                                                                                                                                                                                                                                                            )
                                                                                                                                                                                                                                                                                                                                                                                          : index == 3
                                                                                                                                                                                                                                                                                                                                                                                              ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                                                                  image: AssetImage('lib/images/BlackGrunge4.png'),
                                                                                                                                                                                                                                                                                                                                                                                                )
                                                                                                                                                                                                                                                                                                                                                                                              : index == 4
                                                                                                                                                                                                                                                                                                                                                                                                  ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                                                                      image: AssetImage('lib/images/BlackGrunge5.png'),
                                                                                                                                                                                                                                                                                                                                                                                                    )
                                                                                                                                                                                                                                                                                                                                                                                                  : const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                                                                      image: AssetImage('lib/images/doja.png'),
                                                                                                                                                                                                                                                                                                                                                                                                    ))
                                                                                                                                                                                                                                                                                                                                                                              : (selectedColor == 'Black' && selectedColor2 == 'Soft') //start here start here start here start here start here start here start here start here start here start here
                                                                                                                                                                                                                                                                                                                                                                                  ? (index == 0
                                                                                                                                                                                                                                                                                                                                                                                      ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                                                          image: AssetImage('lib/images/BlackSoft1.png'),
                                                                                                                                                                                                                                                                                                                                                                                        )
                                                                                                                                                                                                                                                                                                                                                                                      : index == 1
                                                                                                                                                                                                                                                                                                                                                                                          ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                                                              image: AssetImage('lib/images/BlackSoft2.png'),
                                                                                                                                                                                                                                                                                                                                                                                            )
                                                                                                                                                                                                                                                                                                                                                                                          : index == 2
                                                                                                                                                                                                                                                                                                                                                                                              ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                                                                  image: AssetImage('lib/images/BlackSoft3.png'),
                                                                                                                                                                                                                                                                                                                                                                                                )
                                                                                                                                                                                                                                                                                                                                                                                              : index == 3
                                                                                                                                                                                                                                                                                                                                                                                                  ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                                                                      image: AssetImage('lib/images/BlackSoft4.png'),
                                                                                                                                                                                                                                                                                                                                                                                                    )
                                                                                                                                                                                                                                                                                                                                                                                                  : index == 4
                                                                                                                                                                                                                                                                                                                                                                                                      ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                                                                          image: AssetImage('lib/images/BlackSoft5.png'),
                                                                                                                                                                                                                                                                                                                                                                                                        )
                                                                                                                                                                                                                                                                                                                                                                                                      : const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                                                                          image: AssetImage('lib/images/doja.png'),
                                                                                                                                                                                                                                                                                                                                                                                                        ))
                                                                                                                                                                                                                                                                                                                                                                                  : (selectedColor == 'Black' && selectedColor2 == 'Y2K') //start here start here start here start here start here start here start here start here start here start here
                                                                                                                                                                                                                                                                                                                                                                                      ? (index == 0
                                                                                                                                                                                                                                                                                                                                                                                          ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                                                              image: AssetImage('lib/images/BlackY2K1.png'),
                                                                                                                                                                                                                                                                                                                                                                                            )
                                                                                                                                                                                                                                                                                                                                                                                          : index == 1
                                                                                                                                                                                                                                                                                                                                                                                              ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                                                                  image: AssetImage('lib/images/BlackY2K2.png'),
                                                                                                                                                                                                                                                                                                                                                                                                )
                                                                                                                                                                                                                                                                                                                                                                                              : index == 2
                                                                                                                                                                                                                                                                                                                                                                                                  ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                                                                      image: AssetImage('lib/images/BlackY2K3.png'),
                                                                                                                                                                                                                                                                                                                                                                                                    )
                                                                                                                                                                                                                                                                                                                                                                                                  : index == 3
                                                                                                                                                                                                                                                                                                                                                                                                      ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                                                                          image: AssetImage('lib/images/BlackY2K4.png'),
                                                                                                                                                                                                                                                                                                                                                                                                        )
                                                                                                                                                                                                                                                                                                                                                                                                      : index == 4
                                                                                                                                                                                                                                                                                                                                                                                                          ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                                                                              image: AssetImage('lib/images/BlackY2K5.png'),
                                                                                                                                                                                                                                                                                                                                                                                                            )
                                                                                                                                                                                                                                                                                                                                                                                                          : const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                                                                              image: AssetImage('lib/images/doja.png'),
                                                                                                                                                                                                                                                                                                                                                                                                            ))
                                                                                                                                                                                                                                                                                                                                                                                      : (selectedColor == 'Black' && selectedColor2 == 'Academia') //start here start here start here start here start here start here start here start here start here start here
                                                                                                                                                                                                                                                                                                                                                                                          ? (index == 0
                                                                                                                                                                                                                                                                                                                                                                                              ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                                                                  image: AssetImage('lib/images/BlackDark1.png'),
                                                                                                                                                                                                                                                                                                                                                                                                )
                                                                                                                                                                                                                                                                                                                                                                                              : index == 1
                                                                                                                                                                                                                                                                                                                                                                                                  ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                                                                      image: AssetImage('lib/images/BlackDark2.png'),
                                                                                                                                                                                                                                                                                                                                                                                                    )
                                                                                                                                                                                                                                                                                                                                                                                                  : index == 2
                                                                                                                                                                                                                                                                                                                                                                                                      ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                                                                          image: AssetImage('lib/images/BlackDark3.png'),
                                                                                                                                                                                                                                                                                                                                                                                                        )
                                                                                                                                                                                                                                                                                                                                                                                                      : index == 3
                                                                                                                                                                                                                                                                                                                                                                                                          ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                                                                              image: AssetImage('lib/images/BlackDark4.png'),
                                                                                                                                                                                                                                                                                                                                                                                                            )
                                                                                                                                                                                                                                                                                                                                                                                                          : index == 4
                                                                                                                                                                                                                                                                                                                                                                                                              ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                                                                                  image: AssetImage('lib/images/BlackDark5.png'),
                                                                                                                                                                                                                                                                                                                                                                                                                )
                                                                                                                                                                                                                                                                                                                                                                                                              : const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                                                                                  image: AssetImage('lib/images/doja.png'),
                                                                                                                                                                                                                                                                                                                                                                                                                ))
                                                                                                                                                                                                                                                                                                                                                                                          : (selectedColor == 'Black' && selectedColor2 == 'Kawaii') //start here start here start here start here start here start here start here start here start here start here
                                                                                                                                                                                                                                                                                                                                                                                              ? (index == 0
                                                                                                                                                                                                                                                                                                                                                                                                  ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                                                                      image: AssetImage('lib/images/BlackKawaii1.png'),
                                                                                                                                                                                                                                                                                                                                                                                                    )
                                                                                                                                                                                                                                                                                                                                                                                                  : index == 1
                                                                                                                                                                                                                                                                                                                                                                                                      ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                                                                          image: AssetImage('lib/images/BlackKawaii2.png'),
                                                                                                                                                                                                                                                                                                                                                                                                        )
                                                                                                                                                                                                                                                                                                                                                                                                      : index == 2
                                                                                                                                                                                                                                                                                                                                                                                                          ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                                                                              image: AssetImage('lib/images/BlackKawaii3.png'),
                                                                                                                                                                                                                                                                                                                                                                                                            )
                                                                                                                                                                                                                                                                                                                                                                                                          : index == 3
                                                                                                                                                                                                                                                                                                                                                                                                              ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                                                                                  image: AssetImage('lib/images/BlackKawaii4.png'),
                                                                                                                                                                                                                                                                                                                                                                                                                )
                                                                                                                                                                                                                                                                                                                                                                                                              : index == 4
                                                                                                                                                                                                                                                                                                                                                                                                                  ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                                                                                      image: AssetImage('lib/images/BlackKawaii5.png'),
                                                                                                                                                                                                                                                                                                                                                                                                                    )
                                                                                                                                                                                                                                                                                                                                                                                                                  : const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                                                                                      image: AssetImage('lib/images/doja.png'),
                                                                                                                                                                                                                                                                                                                                                                                                                    ))
                                                                                                                                                                                                                                                                                                                                                                                              : (selectedColor == 'Black' && selectedColor2 == 'Vintage') //start here start here start here start here start here start here start here start here start here start here
                                                                                                                                                                                                                                                                                                                                                                                                  ? (index == 0
                                                                                                                                                                                                                                                                                                                                                                                                      ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                                                                          image: AssetImage('lib/images/BlackVintage1.png'),
                                                                                                                                                                                                                                                                                                                                                                                                        )
                                                                                                                                                                                                                                                                                                                                                                                                      : index == 1
                                                                                                                                                                                                                                                                                                                                                                                                          ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                                                                              image: AssetImage('lib/images/BlackVintage2.png'),
                                                                                                                                                                                                                                                                                                                                                                                                            )
                                                                                                                                                                                                                                                                                                                                                                                                          : index == 2
                                                                                                                                                                                                                                                                                                                                                                                                              ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                                                                                  image: AssetImage('lib/images/BlackVintage3.png'),
                                                                                                                                                                                                                                                                                                                                                                                                                )
                                                                                                                                                                                                                                                                                                                                                                                                              : index == 3
                                                                                                                                                                                                                                                                                                                                                                                                                  ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                                                                                      image: AssetImage('lib/images/BlackVintage4.png'),
                                                                                                                                                                                                                                                                                                                                                                                                                    )
                                                                                                                                                                                                                                                                                                                                                                                                                  : index == 4
                                                                                                                                                                                                                                                                                                                                                                                                                      ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                                                                                          image: AssetImage('lib/images/BlackVintage5.png'),
                                                                                                                                                                                                                                                                                                                                                                                                                        )
                                                                                                                                                                                                                                                                                                                                                                                                                      : const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                                                                                          image: AssetImage('lib/images/doja.png'),
                                                                                                                                                                                                                                                                                                                                                                                                                        ))
                                                                                                                                                                                                                                                                                                                                                                                                  : (selectedColor == 'Black' && selectedColor2 == 'Boho')
                                                                                                                                                                                                                                                                                                                                                                                                      ? (index == 0
                                                                                                                                                                                                                                                                                                                                                                                                          ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                                                                              image: AssetImage('lib/images/BlackBoho1.png'),
                                                                                                                                                                                                                                                                                                                                                                                                            )
                                                                                                                                                                                                                                                                                                                                                                                                          : index == 1
                                                                                                                                                                                                                                                                                                                                                                                                              ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                                                                                  image: AssetImage('lib/images/BlackBoho2.png'),
                                                                                                                                                                                                                                                                                                                                                                                                                )
                                                                                                                                                                                                                                                                                                                                                                                                              : index == 2
                                                                                                                                                                                                                                                                                                                                                                                                                  ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                                                                                      image: AssetImage('lib/images/BlackBoho3.png'),
                                                                                                                                                                                                                                                                                                                                                                                                                    )
                                                                                                                                                                                                                                                                                                                                                                                                                  : index == 3
                                                                                                                                                                                                                                                                                                                                                                                                                      ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                                                                                          image: AssetImage('lib/images/BlackBoho4.png'),
                                                                                                                                                                                                                                                                                                                                                                                                                        )
                                                                                                                                                                                                                                                                                                                                                                                                                      : index == 4
                                                                                                                                                                                                                                                                                                                                                                                                                          ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                                                                                              image: AssetImage('lib/images/BlackBoho5.png'),
                                                                                                                                                                                                                                                                                                                                                                                                                            )
                                                                                                                                                                                                                                                                                                                                                                                                                          : const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                                                                                              image: AssetImage('lib/images/doja.png'),
                                                                                                                                                                                                                                                                                                                                                                                                                            ))
                                                                                                                                                                                                                                                                                                                                                                                                      : (index == 0
                                                                                                                                                                                                                                                                                                                                                                                                          ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                                                                              image: AssetImage('lib/images/cloth1.png'),
                                                                                                                                                                                                                                                                                                                                                                                                            )
                                                                                                                                                                                                                                                                                                                                                                                                          : index == 1
                                                                                                                                                                                                                                                                                                                                                                                                              ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                                                                                  image: AssetImage('lib/images/cloth2.png'),
                                                                                                                                                                                                                                                                                                                                                                                                                )
                                                                                                                                                                                                                                                                                                                                                                                                              : index == 2
                                                                                                                                                                                                                                                                                                                                                                                                                  ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                                                                                      image: AssetImage('lib/images/cloth3.png'),
                                                                                                                                                                                                                                                                                                                                                                                                                    )
                                                                                                                                                                                                                                                                                                                                                                                                                  : index == 3
                                                                                                                                                                                                                                                                                                                                                                                                                      ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                                                                                          image: AssetImage('lib/images/cloth4.png'),
                                                                                                                                                                                                                                                                                                                                                                                                                        )
                                                                                                                                                                                                                                                                                                                                                                                                                      : index == 4
                                                                                                                                                                                                                                                                                                                                                                                                                          ? const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                                                                                              image: AssetImage('lib/images/cloth5.png'),
                                                                                                                                                                                                                                                                                                                                                                                                                            )
                                                                                                                                                                                                                                                                                                                                                                                                                          : const DecorationImage(
                                                                                                                                                                                                                                                                                                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                                                                                                                                                                                                                                                                                                              image: AssetImage('lib/images/buzz.png'),
                                                                                                                                                                                                                                                                                                                                                                                                                            )),
                                    ),
                                    height: 640,
                                    width: 360,
                                  ),
                                  Positioned(
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
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    left: 0,
                                    right: 0,
                                    child: Container(
                                      padding: const EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
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
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 16.0),
                                            child: Text(
                                              _items[index]['description'],
                                              style: const TextStyle(
                                                fontSize: 16,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )
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
