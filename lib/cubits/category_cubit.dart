
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:udemy_meals_app/models/category_model.dart';

import '../dummy_data.dart';
import '../widgets/category_item.dart';

class CategoryCubit extends Cubit<CategoryModel> {
  CategoryCubit()
      : super(const CategoryModel(
            id: 'c1', title: 'Italian', image: 'assets/images/img1.jpeg'));

  List<Widget> showCategoryMeals() {
    return DUMMY_CATEGORIES
        .map((catData) =>
        CategoryItem(
          catData.id,
          catData.title,
          catData.image,
        ),
    ).toList();
  }


}
