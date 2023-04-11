import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_meals_app/cubits/category_cubit.dart';
import 'package:udemy_meals_app/cubits/cubit_favorites.dart';
import 'package:udemy_meals_app/cubits/cubit_filter.dart';
import 'package:udemy_meals_app/cubits/meal_cubit.dart';

import '../widgets/main_drawer.dart';
import './favorites_screen.dart';
import './categories_screen.dart';
import '../models/meal_model.dart';

class TabsScreen extends StatefulWidget {
  final List<MealModel> favoriteMeals;
  // List<MealModel> availableMeals ;
  final Function toggleFavorite;
  final Function isFavorite;

  TabsScreen(
    this.favoriteMeals,
    this.toggleFavorite,
    this.isFavorite, {Key key}
  ) : super(key: key);

  @override
  TabsScreenState createState() => TabsScreenState();
}

class TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    _pages = [
      {
        'page': CategoriesScreen(),
        'title': 'Categories',
      },
      {
        'page': FavoritesScreen(
          widget.favoriteMeals,
          widget.toggleFavorite,
          widget.isFavorite,
        ),
        'title': 'Your Favorite',
      },
    ];
    // widget.availableMeals=availableMeals;
    // print(availableMeals);
    // return MultiBlocProvider(
    //   providers: [
    //     BlocProvider(create: (BuildContext context) => CategoryCubit()),
    //     BlocProvider(create: (BuildContext context) => MealCubit()),
    //     BlocProvider(create: (BuildContext context) => CubitFilter()),
    //     BlocProvider(create: (BuildContext context) => CubitFavorite())
    //   ],
    //   child:
     return Scaffold(
        appBar: AppBar(
          title: Text(_pages[_selectedPageIndex]['title']),
        ),
        drawer: MainDrawer(),
        body: _pages[_selectedPageIndex]['page'],
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          currentIndex: _selectedPageIndex,
          // type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: const Icon(Icons.category),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: const Icon(Icons.star),
              label: 'Favorites',
            ),
          ],
        ),
      );
    // );
  }
}
