import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_meals_app/cubits/category_cubit.dart';

import '../models/meal_model.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          opacity: 0.5,
          image: AssetImage('assets/images/newnew.jpeg'),
          fit: BoxFit.fill,
        ),
      ),
      child: GridView(
        padding: const EdgeInsets.all(15),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 0,
          mainAxisSpacing: 10,
        ),
        ///HomePage Category GridView Call
        children: context.read<CategoryCubit>().showCategoryMeals()
      ),
    );
  }
}
