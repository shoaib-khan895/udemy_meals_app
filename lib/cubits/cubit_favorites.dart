import 'package:bloc/bloc.dart';

import '../dummy_data.dart';
import '../models/meal_model.dart';

List<MealModel> favoriteMeals = [];

class CubitFavorite extends Cubit<List<MealModel>> {
  CubitFavorite() : super(favoriteMeals);

  void toggleFavorite(String mealId) {
    final existingIndex = favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      favoriteMeals.removeAt(existingIndex);
      DUMMY_MEALS[int.parse(mealId)].isFav = false;
      emit(favoriteMeals);
    } else {
      favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      DUMMY_MEALS[int.parse(mealId)].isFav = true;
      emit(favoriteMeals);
    }
  }

  bool isMealFavorite(String id) {
    return favoriteMeals.any((meal) => meal.id == id);
  }
}
