import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/cubit_filter.dart';
import '../widgets/meal_item.dart';
import '../models/meal_model.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  // final List<MealModel> availableMeals;
  final Function toggleFavorite;
  final Function isFavorite;

  CategoryMealsScreen(this.toggleFavorite, this.isFavorite,
      {Key key})
      : super(key: key);

  @override
  CategoryMealsScreenState createState() => CategoryMealsScreenState();
}

class CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  String catId;
  List<MealModel> displayedMeals;
  var _loadedInitData = false;

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      catId = categoryId;
      displayedMeals = context.read<CubitFilter>().state.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayedMeals[index].id,
            title: displayedMeals[index].title,
            imageUrl: displayedMeals[index].imageUrl,
            duration: displayedMeals[index].duration,
            affordability: displayedMeals[index].affordability,
            complexity: displayedMeals[index].complexity,
            toggleFavorite: widget.toggleFavorite,
            isFavorite: widget.isFavorite,
            isFav: displayedMeals[index].isFav,
            catId: catId,
            reset: removeItem,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }

  removeItem() {
    setState(() {});
  }
}
