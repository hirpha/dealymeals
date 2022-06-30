import 'package:dailymeals/dummy_data.dart';
import 'package:dailymeals/models/meal.dart';
import 'package:dailymeals/pages/filter_screen.dart';
import 'package:dailymeals/pages/meal_detail_screen.dart';
import 'package:dailymeals/pages/tab_screen.dart';
import 'package:flutter/material.dart';

import './pages/category_screen.dart';
import './pages/category_meals_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  Map<String, bool> _filters = {
    "gluten": false,
    "lactose": false,
    "vegan": false,
    "vegiterian": false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeal = [];

  void _saveFilters(Map<String, bool> filter) {
    setState(() {
      _filters = filter;

      // Map<String, bool> filterData = _filters as Map<String, bool>;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters["gluten"] == true && !meal.isGlutenFree) {
          return false;
        }
        if (_filters["lactose"] == true && !meal.isLactoseFree) {
          return false;
        }
        if (_filters["vegan"] == true && !meal.isVegan) {
          return false;
        }
        if (_filters["vegiterian"] == true && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existingIndex = _favoriteMeal.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      _favoriteMeal.removeAt(existingIndex);
    } else {
      _favoriteMeal.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
    }
  }

  bool isFavorite(String mealId) {
    return _favoriteMeal.any((meal) => meal.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          headline1: TextStyle(
            color: Colors.green,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      routes: {
        '/': (context) => TapScreen(
              favoriteMeal: _favoriteMeal,
            ),
        CategoryScreen.categoryRoute: (context) =>
            CategoryMealsScreen(availableMeals: _availableMeals),
        CategoryMealDetail.detailRoute: (context) => CategoryMealDetail(
              toggleFavorite: _toggleFavorite,
              isFavorite: isFavorite,
            ),
        FilterScreen.filterRoute: (context) =>
            FilterScreen(currentFilter: _filters, saveFilter: _saveFilters)
      },
    );
  }
}
