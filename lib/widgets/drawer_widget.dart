import 'package:dailymeals/pages/filter_screen.dart';
import 'package:flutter/material.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  Widget buildListTile(
      String title, Icon icon, BuildContext context, String route) {
    return ListTile(
        leading: icon,
        title: Text(title),
        onTap: () => navigator(context, route));
  }

  void navigator(BuildContext context, String route) {
    Navigator.pushReplacementNamed(context, route);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        Container(
          height: 150,
          decoration: BoxDecoration(color: Colors.yellowAccent),
          child: Center(
            child: Text(
              "Cooking App",
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
        ),
        buildListTile("Meal", Icon(Icons.restaurant), context, '/'),
        buildListTile(
            "Filter", Icon(Icons.settings), context, FilterScreen.filterRoute),
      ],
    ));
  }
}
