import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'homepage.dart';
import 'map.dart';
import 'profile.dart';

class Bottom extends StatefulWidget{
  const Bottom({Key? key}) : super(key: key);

  @override
  State<Bottom> createState() => _Bottom();
}

class _Bottom extends State<Bottom>{
  int _selectIndex = 0;
  final controllers = PageController();
  final List<Widget> _pages = [
    const HomePage(key: Key('home'),),
    const BuildMap(),
    Profile(),
  ];
  _changeTab(int index) {
    setState(() {
      _selectIndex = index;
    });
    controllers.jumpToPage(index);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controllers,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.lightBlueAccent,
          currentIndex: _selectIndex,
          onTap: (index) => _changeTab(index),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.map),
              label: 'Map',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Account',
            ),
          ]
      ),
    );
  }

}