import 'package:favorite_app/screens/favorite_screen.dart';
import 'package:favorite_app/screens/meals_list_screen.dart';
import 'package:favorite_app/widgets/app_drawer.dart';
import 'package:flutter/material.dart';

class TabBarScreen extends StatefulWidget {
  @override
  _TabBarScreenState createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  ///
  final List<Map<String, Object>> _pages = [
    {'page': HomeScreen(), 'title': "Meals"},
    {'page': FavoriteScreen(), 'title': "Favorites"}
  ];

  int selectedPageIndex = 0;

  ///
  void _selectedPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text(_pages[selectedPageIndex]['title']),
      ),
      body: _pages[selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        onTap: _selectedPage,
        currentIndex: selectedPageIndex,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.purpleAccent,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.stars), label: 'Favorites'),
        ],
      ),
    );
  }
}
