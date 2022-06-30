import 'package:dailymeals/pages/meal_detail_screen.dart';

import '../dummy_data.dart';
import '../models/meal.dart';
import 'package:flutter/material.dart';

class MealItem extends StatelessWidget {
  final String mealIndex;
  MealItem({Key? key, required this.mealIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final meal = DUMMY_MEALS.singleWhere((e) {
      return e.id == mealIndex;
    });

    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, CategoryMealDetail.detailRoute,
            arguments: {"mealId": meal.id});
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 7,
          child: Container(
            margin: EdgeInsets.all(10),
            child: Column(children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    child: Container(
                      height: 300,
                      width: double.infinity,
                      child: Image.network(
                        meal.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                      left: 50,
                      right: 50,
                      bottom: 10,
                      child: Container(
                        color: Colors.black.withOpacity(0.5),
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          meal.title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ),
                      ))
                ],
              ),
              Container(
                height: 50,
                padding: EdgeInsets.all(10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.schedule),
                        Text(
                          " " + meal.duration.toString() + ' min',
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.work),
                        Text(" " +
                            meal.complexity.toString().substring(
                                meal.complexity.toString().indexOf('.') + 1)),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.attach_money),
                        Text(" " +
                            meal.affordability.toString().substring(
                                meal.affordability.toString().indexOf('.') +
                                    1)),
                      ],
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
