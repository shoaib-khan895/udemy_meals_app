import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:udemy_meals_app/screens/favorites_screen.dart';

import './dummy_data.dart';
import './screens/tabs_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/filters_screen.dart';
import './screens/categories_screen.dart';
import './models/meal_model.dart';
import 'cubits/category_cubit.dart';
import 'cubits/cubit_favorites.dart';
import 'cubits/cubit_filter.dart';
import 'cubits/meal_cubit.dart';

void main() {
  runApp(Home());
}

class Home extends MaterialApp {
  Home({Key key}) : super(key: key, home: CalculatorView());
}

class CalculatorView extends StatelessWidget {
  CalculatorView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => CategoryCubit()),
        BlocProvider(create: (BuildContext context) => MealCubit()),
        BlocProvider(create: (BuildContext context) => CubitFilter()),
        BlocProvider(create: (BuildContext context) => CubitFavorite())
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  // Map<String, bool> filters;
  // List<MealModel> availableMeals = DUMMY_MEALS;
  List<MealModel> favoriteMeals = [];
  List<MealModel> viewPageMeals;

  // getPref() async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   if (pref.getBool('_glutenFree') == null) {
  //     pref.setBool('_lactoseFree', false);
  //     pref.setBool('_vegan', false);
  //     pref.setBool('_vegetarian', false);
  //     pref.setBool('_glutenFree', false);
  //   }
  //   bool gluten = pref.getBool('_glutenFree');
  //   bool lactose = pref.getBool('_lactoseFree');
  //   bool vegan = pref.getBool('_vegan');
  //   bool vegetarian = pref.getBool('_vegetarian');
  //
  //   filters = {
  //     'gluten': gluten,
  //     'lactose': lactose,
  //     'vegan': vegan,
  //     'vegetarian': vegetarian,
  //   };
  // }

  // void _setFilters(Map<String, bool> filterData) {
  //   setState(() {
  //     filters = filterData;
  //
  //     availableMeals = DUMMY_MEALS.where((meal) {
  //       if (filters['gluten'] && !meal.isGlutenFree) {
  //         return false;
  //       }
  //       if (filters['lactose'] && !meal.isLactoseFree) {
  //         return false;
  //       }
  //       if (filters['vegan'] && !meal.isVegan) {
  //         return false;
  //       }
  //       if (filters['vegetarian'] && !meal.isVegetarian) {
  //         return false;
  //       }
  //       return true;
  //     }).toList();
  //     setState(() {
  //     });
  //   });
  // }

  void _toggleFavorite(String mealId) {
    final existingIndex = favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        favoriteMeals.removeAt(existingIndex);
        //favoriteMeals[int.parse(mealId)].isFav = false;
        DUMMY_MEALS[int.parse(mealId)].isFav = false;
      });
    } else {
      setState(() {
        favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
        // favoriteMeals[int.parse(mealId)].isFav = false;
        DUMMY_MEALS[int.parse(mealId)].isFav = true;
      });
    }
  }

  bool _isMealFavorite(String id) {
    return favoriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    context.read<CubitFilter>().getPref();
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: const TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            bodyText2: const TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            subtitle1: const TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
            )),
      ),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(
              favoriteMeals,
              _toggleFavorite,
              _isMealFavorite,
            ),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(
              _toggleFavorite,
              _isMealFavorite,
            ),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(
              _toggleFavorite,
              _isMealFavorite,
              favMeals: favoriteMeals,
            ),
        FiltersScreen.routeName: (ctx) => FiltersScreen(),
      },
    );
  }
}
