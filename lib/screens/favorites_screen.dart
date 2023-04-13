import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_meals_app/cubits/cubit_main.dart';

import '../models/meal_model.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatefulWidget {
  @override
  State<FavoritesScreen> createState() => FavoritesScreenState();
}

class FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    List<MealModel> favoriteMeals = context.watch<CubitMain>().favoriteMeals;
    if (favoriteMeals.isEmpty) {
      return const Center(
        child: Text('You have no favorites yet - start adding some!'),
      );
    } else {
      return Scaffold(
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
                id: favoriteMeals[index].id,
                title: favoriteMeals[index].title,
                imageUrl: favoriteMeals[index].imageUrl,
                duration: favoriteMeals[index].duration,
                affordability: favoriteMeals[index].affordability,
                complexity: favoriteMeals[index].complexity,
                isFav: favoriteMeals[index].isFav,
                reset: removeItem);
          },
          itemCount: favoriteMeals.length,
        ),
      );
    }
  }

  removeItem() {
    setState(() {});
  }
}
