import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatefulWidget {
  List<Meal> favoriteMeals;
  final Function toggleFavorite;
  final Function isFavorite;

  FavoritesScreen(this.favoriteMeals, this.toggleFavorite, this.isFavorite);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    if (widget.favoriteMeals.isEmpty) {
      return const Center(
        child: Text('You have no favorites yet - start adding some!'),
      );
    } else {
      return Scaffold(
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: widget.favoriteMeals[index].id,
              title: widget.favoriteMeals[index].title,
              imageUrl: widget.favoriteMeals[index].imageUrl,
              duration: widget.favoriteMeals[index].duration,
              affordability: widget.favoriteMeals[index].affordability,
              complexity: widget.favoriteMeals[index].complexity,
              toggleFavorite: widget.toggleFavorite,
              isFavorite: widget.isFavorite,
              isFav: widget.favoriteMeals[index].isFav,
              reset: removeItem
            );
          },
          itemCount: widget.favoriteMeals.length,
        ),
      );
    }
  }
  removeItem() {
    setState(() {});
  }
}
