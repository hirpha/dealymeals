import 'package:dailymeals/dummy_data.dart';
import 'package:dailymeals/models/meal.dart';
import 'package:dailymeals/widgets/meal_item.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  List<Meal> favoriteMeal;
  FavoriteScreen({required this.favoriteMeal});

  @override
  Widget build(BuildContext context) {
    return favoriteMeal != null
        ? ListView.builder(
            itemCount: favoriteMeal.length,
            itemBuilder: (context, index) {
              return Container(
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
                                favoriteMeal[index].imageUrl,
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
                                  favoriteMeal[index].title,
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
                                  " " +
                                      favoriteMeal[index].duration.toString() +
                                      ' min',
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(Icons.work),
                                Text(" " +
                                    favoriteMeal[index]
                                        .complexity
                                        .toString()
                                        .substring(favoriteMeal[index]
                                                .complexity
                                                .toString()
                                                .indexOf('.') +
                                            1)),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(Icons.attach_money),
                                Text(" " +
                                    favoriteMeal[index]
                                        .affordability
                                        .toString()
                                        .substring(favoriteMeal[index]
                                                .affordability
                                                .toString()
                                                .indexOf('.') +
                                            1)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ]),
                  ),
                ),
              );
            })
        : Center(
            child: Text("There is no favorite meal yet"),
          );
  }
}
