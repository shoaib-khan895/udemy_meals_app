// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/cubit_filter.dart';
import '../dummy_data.dart';
import '../models/meal_model.dart';

class MealDetailScreen extends StatefulWidget {
  static const routeName = '/meal-detail';

  final Function toggleFavorite;
  final Function isFavorite;
  List<MealModel> favMeals;
  int pageCount = 0;
  MealDetailScreen(this.toggleFavorite, this.isFavorite,
      {Key key, @required this.favMeals,})
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
  @override
  Widget build(BuildContext context) {
    List<MealModel> displayMeals;
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final mealId = routeArgs['id'];
    final categoryId = routeArgs['title'];
    print(categoryId);
    if (categoryId != null) {
      displayMeals = context.read<CubitFilter>().state.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
    } else {
      displayMeals = widget.favMeals;
    }

    final PageController controller = PageController(initialPage:int.parse(mealId) );
    if (displayMeals.isEmpty == true) {
      return Scaffold(
        appBar: AppBar(
          title: Text('No Meals to show'),
        ),
        body: Center(
          child: Text('Please add meals'),
        ),
      );
     // Navigator.pop(context);

    } else {
      return PageView.builder(
        onPageChanged: (count) {
          setState(() {
            print(count);
            widget.pageCount = count;
          });
        },
        controller: controller,
        itemBuilder: (BuildContext context, int index) {
          return Scaffold(
            appBar: AppBar(
              title: Text(displayMeals[index].title),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Stack(children: [
                    SizedBox(
                      height: 300,
                      width: double.infinity,
                      child: Image.asset(
                        displayMeals[index].imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      right: 10,
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            widget.toggleFavorite(displayMeals[widget.pageCount].id);
                          });
                        },
                        icon: Icon(
                          Icons.favorite,
                          color:
                              (displayMeals[index].isFav) ? Colors.red : Colors.white,
                          size: 50,
                        ),
                      ),
                    )
                  ]),
                  buildSectionTitle(context, 'Ingredients'),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    height: 150,
                    width: 300,
                    child: ListView(children: [
                      Card(
                        color: Theme.of(context).primaryColor,
                        child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 10,
                            ),
                            child: Text(displayMeals[index].ingredients)),
                      ),
                    ]),
                  ),
                  buildSectionTitle(context, 'Steps'),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    height: 150,
                    width: 300,
                    child: ListView(children: [
                      Column(
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                              child: Text('#'),
                            ),
                            title: Text(
                              displayMeals[index].steps,
                            ),
                          ),
                          Divider()
                        ],
                      ),
                    ]),
                  )
                ],
              ),
            ),
          );
        },
        itemCount: displayMeals.length,
      );
    }
  }
}
