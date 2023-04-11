import 'package:bloc/bloc.dart';
import 'package:udemy_meals_app/models/category_model.dart';
import 'package:udemy_meals_app/models/meal_model.dart';

class MealCubit extends Cubit<MealModel> {
  MealCubit()
      : super(MealModel(
            id: '0',
            categories: [
              'c1',
              'c2',
            ],
            title: 'Spaghetti with Tomato Sauce',
            imageUrl: 'assets/images/img1.jpeg',
            ingredients:
                '4 Tomatoes \n 1 Tablespoon of Olive \n Oil 1 Onion \n 250g Spaghetti Spices Cheese (optional)',
            steps:
                'Cut the tomatoes and the onion into small pieces.\n Boil some water - add salt to it once it boils.\nPut the spaghetti into the boiling water - they should be done in about 10 to 12 minutes. \nIn the meantime, heaten up some olive oil and add the cut onion.\n,After 2 minutes, add the tomato pieces, salt, pepper and your other spices.\n,The sauce will be done once the spaghetti are.\n,Feel free to add some cheese on top of the finished dish.',
            duration: 20,
            complexity: Complexity.Simple,
            affordability: Affordability.Affordable,
            isGlutenFree: false,
            isLactoseFree: true,
            isVegan: true,
            isVegetarian: true,
            isFav: false));


}
