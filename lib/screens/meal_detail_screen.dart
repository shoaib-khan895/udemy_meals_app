// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/cubit_main.dart';
import '../dummy_data.dart';
import '../models/meal_model.dart';

class MealDetailScreen extends StatefulWidget {
  static const routeName = '/meal-detail';
  MealDetailScreen({Key key}) : super(key: key);

  int pageCount = 0;

  @override
  State<MealDetailScreen> createState() => MealDetailScreenState();
}

class MealDetailScreenState extends State<MealDetailScreen> {
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
    List<MealModel> favMeals = context.watch<CubitMain>().favoriteMeals;
    List<MealModel> displayMeals;
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final mealId = routeArgs['id'];
    final categoryId = routeArgs['title'];
    if (categoryId != null) {
      displayMeals = context.watch<CubitMain>().availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
    } else {
      displayMeals = favMeals;
    }

    final PageController controller =
        PageController(initialPage: int.parse(mealId));
    if (displayMeals.isEmpty == true) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'You don\'t have any meals',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.pinkAccent,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/');
                    },
                    icon: Icon(Icons.arrow_back),
                  )),
            ],
          ),
        ),
      );
    } else {
      return PageView.builder(
        onPageChanged: (count) {
          setState(() {
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
                            context
                                .read<CubitMain>()
                                .toggleFavorite(displayMeals[index].id);
                          });

                        },
                        icon: Icon(
                          Icons.favorite,
                          color: (displayMeals[index].isFav)
                              ? Colors.red
                              : Colors.white,
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
