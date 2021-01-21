import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:indonesian_food_recipes/Splash.dart';
import 'package:indonesian_food_recipes/pages/AboutPage.dart';
import 'package:indonesian_food_recipes/pages/HomePage.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Recipes',
      home: Splash(),
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) =>
            MyApps(),
      },
    );
  }
}

class MyApps extends StatefulWidget {
  @override
  _MyAppsState createState() => _MyAppsState();
}

class _MyAppsState extends State<MyApps> {

  //State class
  int pageIndex = 0;

  //All the Pages
  final HomePage _homePage = HomePage();
  final AboutPage _aboutPage = new AboutPage();

  Widget _showPage = new HomePage();

  Widget _pageChooser(int page){
    switch(page){
      case 0 :
        return _homePage;
        break;
      case 1 :
        return _aboutPage;
        break;
      default:
        return new Container(
          child: new Center(
            child: Text('Page Not Found'),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Indonesian Food Recipes'),
        ),
        body: Container(
          child: Center(
            child: _showPage,
          ),
        ),
        bottomNavigationBar: CurvedNavigationBar(
          items: <Widget>[
          Icon(Icons.home_filled, size: 30, color: Colors.white),
          Icon(Icons.person_rounded, size: 30, color: Colors.white),
        ],
        animationDuration: Duration(milliseconds: 100),
        color: Colors.deepOrange[400],
        height: 60,
        backgroundColor: Colors.transparent,
          onTap: (int tap) {
            setState(() {
              _showPage = _pageChooser(tap);
            });
          },
        ),
      ),
    );
  }
}

