// ignore_for_file: prefer_const_constructors

import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../models/meal.dart';

class MealDetailScreen extends StatefulWidget {
  static const routeName = '/meal-detail';

  final Function toggleFavorite;
  final Function isFavorite;

  MealDetailScreen(this.toggleFavorite, this.isFavorite, {Key key})
      : super(key: key);

  @override
  State<MealDetailScreen> createState() => _MealDetailScreenState();
}

class _MealDetailScreenState extends State<MealDetailScreen> {
  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 150,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    final PageController controller = PageController();
    return PageView.builder(
        controller: controller,
        itemBuilder: (BuildContext context, int index) {
          return Scaffold(
            appBar: AppBar(
              title: Text(selectedMeal.title),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Stack(children: [
                    SizedBox(
                      height: 300,
                      width: double.infinity,
                      child: Image.asset(
                        selectedMeal.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      right: 10,
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            widget.toggleFavorite(mealId);
                          });
                        },
                        icon: Icon(
                          Icons.favorite,
                          color:
                              (selectedMeal.isFav) ? Colors.red : Colors.white,
                          size: 50,
                        ),
                      ),
                    )
                  ]),
                  buildSectionTitle(context, 'Ingredients'),
                  buildContainer(
                    ListView.builder(
                      itemBuilder: (ctx, index) => Card(
                        color: Theme.of(context).primaryColor,
                        child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 10,
                            ),
                            child: Text(selectedMeal.ingredients[index])),
                      ),
                      itemCount: selectedMeal.ingredients.length,
                    ),
                  ),
                  buildSectionTitle(context, 'Steps'),
                  buildContainer(
                    ListView.builder(
                      itemBuilder: (ctx, index) => Column(
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                              child: Text('# ${(index + 1)}'),
                            ),
                            title: Text(
                              selectedMeal.steps[index],
                            ),
                          ),
                          Divider()
                        ],
                      ),
                      itemCount: selectedMeal.steps.length,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
