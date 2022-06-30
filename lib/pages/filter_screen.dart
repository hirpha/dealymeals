import 'dart:html';

import 'package:dailymeals/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  final Map<String, bool> currentFilter;
  Function saveFilter;
  FilterScreen({required this.currentFilter, required this.saveFilter});

  static const filterRoute = 'filterRoute';

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  late Map<String, dynamic> filterData = {
    "gluten": false,
    "lactose": false,
    "vegan": false,
    "vegiterian": false,
  };

  @override
  initState() {
    filterData = widget.currentFilter;

    super.initState();
  }

  Widget _buildSwitchTile(
      String title, bool currentValue, dynamic updateValue) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text("ony include $title meals."),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Filter'),
          actions: [
            IconButton(
                onPressed: () {
                  final Map<String, bool> filtedData = {
                    "gluten": filterData['gluten'],
                    "lactose": filterData['lactose'],
                    "vegan": filterData['vegan'],
                    "vegiterian": filterData['vegiterian'],
                  };
                  widget.saveFilter(filtedData);
                },
                icon: const Icon(Icons.save))
          ],
        ),
        drawer: DrawerScreen(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                "Adjust your meal Selection",
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                _buildSwitchTile("Gluten-free", filterData['gluten'], (value) {
                  setState(() {
                    filterData['gluten'] = value;
                  });
                }),
                _buildSwitchTile("Lactose-free", filterData['lactose'],
                    (value) {
                  setState(() {
                    filterData['lactose'] = value;
                  });
                }),
                _buildSwitchTile("Vegiterian", filterData['vegiterian'],
                    (value) {
                  setState(() {
                    filterData['vegiterian'] = value;
                  });
                }),
                _buildSwitchTile("Vegan", filterData['vegan'], (value) {
                  setState(() {
                    filterData['vegan'] = value;
                  });
                }),
              ],
            ))
          ],
        ));
  }
}
