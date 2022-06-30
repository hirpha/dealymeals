import 'package:dailymeals/dummy_data.dart';
import 'package:flutter/material.dart';

class CategoryMealDetail extends StatelessWidget {
  Function toggleFavorite;
  Function isFavorite;
  CategoryMealDetail({required this.toggleFavorite, required this.isFavorite});

  static const detailRoute = "/categoryMealDetail";

  Widget buildIngridentContainer(BuildContext context, List ingredients) {
    return Container(
      height: 150,
      width: MediaQuery.of(context).size.width * 0.7,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 2,
            color: Colors.yellowAccent,
          )),
      child: ListView.builder(
        itemCount: ingredients.length,
        itemBuilder: (context, index) {
          return Card(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Text('${ingredients[index]}'),
            ),
          );
        },
      ),
    );
  }

  Widget buildStepContainer(BuildContext context, List steps) {
    return Container(
      height: 150,
      width: MediaQuery.of(context).size.width * 0.7,
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 2, color: Colors.yellowAccent),
      ),
      child: ListView.builder(
          itemCount: steps.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.green,
                    radius: 15,
                    child: Text('#${(index + 1)}'),
                  ),
                  title: Text(steps[index]),
                ),
                Divider()
              ],
            );
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    final data =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final String mealId = data["mealId"] as String;
    final detailMeal = DUMMY_MEALS.singleWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text(detailMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                detailMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
                child: Text(
              "Ingridents",
              style: Theme.of(context).textTheme.headline1,
            )),
            const SizedBox(
              height: 20,
            ),
            buildIngridentContainer(context, detailMeal.ingredients),
            SizedBox(
              height: 20,
            ),
            Text(
              "Steps",
              style: Theme.of(context).textTheme.headline1,
            ),
            buildStepContainer(context, detailMeal.steps),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(isFavorite(mealId) ? Icons.star : Icons.star_border),
        tooltip: "favorite",
        onPressed: () => toggleFavorite(mealId),
      ),
    );
  }
}
