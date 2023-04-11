import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../dummy_data.dart';
import '../models/meal_model.dart';

List<MealModel> availableMeals = DUMMY_MEALS;

class CubitFilter extends Cubit<List<MealModel>> {
  CubitFilter() : super(availableMeals);

  Map<String, bool> filters={
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
}
