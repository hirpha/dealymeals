import '../dummy_data.dart';
import '../widgets/drawer_widget.dart';
import '../widgets/category_item.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  static const categoryRoute = '/mealScreen';

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.all(20),
      crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      children: DUMMY_CATEGORIES.map((category) {
        return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, CategoryScreen.categoryRoute,
                  arguments: {
                    "categoryId": category.id,
                    "categoryTiltle": category.title,
                  });
            },
            child: CategoryItem(category: category));
      }).toList(),
    );
  }
}
