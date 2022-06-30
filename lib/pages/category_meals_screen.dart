import 'package:dailymeals/models/meal.dart';
import 'package:dailymeals/widgets/drawer_widget.dart';

import '../dummy_data.dart';
import '../models/category.dart';
import '../widgets/meal_item.dart';
import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatefulWidget {
  List<Meal> availableMeals;
  CategoryMealsScreen({required this.availableMeals});

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryId = '';
  String categoryTitle = '';
  List<Meal> displayedMeal = [];
  var loadedInitData = false;

  @override
  void didChangeDependencies() {
    if (!loadedInitData) {
      final routeArgs =
          ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

      String categoryId = routeArgs['categoryId'] as String;
      categoryTitle = routeArgs["categoryTiltle"] as String;

      displayedMeal = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: displayedMeal.map((meal) {
            return MealItem(mealIndex: meal.id);
          }).toList(),
        ),
      ),
    );
  }
}
