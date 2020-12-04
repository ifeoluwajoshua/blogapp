import 'package:blogapp/src/helpers/colors.dart';
import 'package:blogapp/src/views/welcome.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> { int _index  = 0;
  @override
  Widget build(BuildContext context) {
    Widget child;
    switch (_index) {
      case 0:
        child = BlogHome();
        break;
      case 1:
        child = FlutterLogo();
        break;
      case 2:
        child = FlutterLogo();
        break;
      case 3:
        child = FlutterLogo();
        break;
    }
    return SafeArea(
          child: Scaffold(
        body: SizedBox.expand(child: child),
        bottomNavigationBar: _createBottomNavigationBar()
      ),
    );
  }
   Widget _createBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _index,
      onTap: (newIndex) => setState(() => _index = newIndex),
      backgroundColor: blueblack,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      unselectedItemColor: Colors.white,
      selectedItemColor: orange,
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined, size: 25.0,), label: ''),
        BottomNavigationBarItem(
            icon:  Icon(Icons.favorite_border, size: 25.0,), label: ''),
        BottomNavigationBarItem(
            icon: Icon(Icons.search, size: 25.0), label: ''),
        BottomNavigationBarItem(
            icon:  Icon(Icons.notification_important_sharp, size: 25.0,), label: ''),
      ],
    );
  }

}