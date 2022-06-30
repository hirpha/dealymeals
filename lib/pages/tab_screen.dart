import 'package:dailymeals/models/meal.dart';
import 'package:dailymeals/pages/category_meals_screen.dart';
import 'package:dailymeals/widgets/drawer_widget.dart';
import 'package:dailymeals/pages/favorite_sreen.dart';

import '../pages/category_screen.dart';
import 'package:flutter/material.dart';

class TapScreen extends StatefulWidget {
  final List<Meal> favoriteMeal;
  TapScreen({
    required this.favoriteMeal,
  });

  @override
  State<TapScreen> createState() => _TapScreenState();
}

class _TapScreenState extends State<TapScreen> {
  List<Map<String, Object>> _pages = [];
  int _selectedIndex = 0;

  @override
  void initState() {
    _pages = [
      {
        'page': CategoryScreen(),
        "title": "Categories",
      },
      {
        "page": FavoriteScreen(
          favoriteMeal: widget.favoriteMeal,
        ),
        "title": 'Your Favorite '
      }
    ];
    super.initState();
  }

  void _selectedPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(_pages[_selectedIndex]['title'].toString()),
      ),
      drawer: DrawerScreen(),
      body: _pages[_selectedIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        backgroundColor: Theme.of(context).primaryColor,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Category"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "Favorite"),
        ],
        currentIndex: _selectedIndex,
        onTap: _selectedPage,
      ),
    );
  }
}
