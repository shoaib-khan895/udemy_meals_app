import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../dummy_data.dart';
import '../models/meal_model.dart';

class CubitMain extends Cubit<List<MealModel>> {
  CubitMain() : super(DUMMY_MEALS);

  List<MealModel> availableMeals = DUMMY_MEALS;
  List<MealModel> favoriteMeals = [];

  Map<String, bool> filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  getPref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.getBool('_glutenFree') == null) {
      pref.setBool('_lactoseFree', false);
      pref.setBool('_vegan', false);
      pref.setBool('_vegetarian', false);
      pref.setBool('_glutenFree', false);
    }
    bool gluten = pref.getBool('_glutenFree');
    bool lactose = pref.getBool('_lactoseFree');
    bool vegan = pref.getBool('_vegan');
    bool vegetarian = pref.getBool('_vegetarian');

    filters = {
      'gluten': gluten,
      'lactose': lactose,
      'vegan': vegan,
      'vegetarian': vegetarian,
    };
  }

  setFilters(Map<String, bool> filterData) {
    filters = filterData;
    availableMeals = DUMMY_MEALS.where((meal) {
      if (filters['gluten'] && !meal.isGlutenFree) {
        return false;
      }
      if (filters['lactose'] && !meal.isLactoseFree) {
        return false;
      }
      if (filters['vegan'] && !meal.isVegan) {
        return false;
      }
      if (filters['vegetarian'] && !meal.isVegetarian) {
        return false;
      }
      return true;
    }).toList();
    emit(availableMeals);
  }

  toggleFavorite(String mealId) {
    final existingIndex = favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      favoriteMeals.removeAt(existingIndex);
      DUMMY_MEALS[int.parse(mealId)].isFav = false;
      emitState();
    } else {
      favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      DUMMY_MEALS[int.parse(mealId)].isFav = true;
      emitState();
    }
  }
  emitState() {
    emit(favoriteMeals);
    emit(availableMeals);
  }
}
