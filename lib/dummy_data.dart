import './models/category_model.dart';
import 'models/meal_model.dart';

const DUMMY_CATEGORIES = [
  CategoryModel(
    id: 'c1',
    title: 'Italian',
    image: 'assets/images/img1.jpeg',
  ),
  CategoryModel(
    id: 'c2',
    title: 'Quick & Easy',
    image: 'assets/images/img2.jpg',
  ),
  CategoryModel(
    id: 'c3',
    title: 'Hamburgers',
    image: 'assets/images/img3.jpg',
  ),
  CategoryModel(
    id: 'c4',
    title: 'German',
    image: 'assets/images/img4.jpg',
  ),
  CategoryModel(
    id: 'c5',
    title: 'Light & Lovely',
    image: 'assets/images/img5.jpg',
  ),
  CategoryModel(
    id: 'c6',
    title: 'Exotic',
    image: 'assets/images/img6.jpg',
  ),
  CategoryModel(
    id: 'c7',
    title: 'Breakfast',
    image: 'assets/images/img7.jpg',
  ),
  CategoryModel(
    id: 'c8',
    title: 'Asian',
    image: 'assets/images/img8.jpg',
  ),
  CategoryModel(
    id: 'c9',
    title: 'French',
    image: 'assets/images/img9.jpg',
  ),
  CategoryModel(
    id: 'c10',
    title: 'Summer',
    image: 'assets/images/img10.jpg',
  ),
];

List<MealModel> DUMMY_MEALS = [
  MealModel(
      id: '0',
      categories: [
        'c1',
        'c2',
      ],
      title: 'Spaghetti with Tomato Sauce',
      affordability: Affordability.Affordable,
      complexity: Complexity.Simple,
      imageUrl: 'assets/images/img1.jpeg',
      duration: 20,
      ingredients:
          '4 Tomatoes \n 1 Tablespoon of Olive \n Oil 1 Onion \n 250g Spaghetti Spices Cheese (optional)',
      steps:
          'Cut the tomatoes and the onion into small pieces.\n Boil some water - add salt to it once it boils.\nPut the spaghetti into the boiling water - they should be done in about 10 to 12 minutes. \nIn the meantime, heaten up some olive oil and add the cut onion.\n,After 2 minutes, add the tomato pieces, salt, pepper and your other spices.\n,The sauce will be done once the spaghetti are.\n,Feel free to add some cheese on top of the finished dish.',
      isGlutenFree: false,
      isVegan: true,
      isVegetarian: true,
      isLactoseFree: true,
      isFav: false),
  MealModel(
      id: '1',
      categories: [
        'c2',
      ],
      title: 'Toast Hawaii',
      affordability: Affordability.Affordable,
      complexity: Complexity.Simple,
      imageUrl: 'assets/images/img2.jpg',
      duration: 10,
      ingredients:
          '1 Slice White Bread\n1 Slice Ham\n1 Slice Pineapple\n1-2 Slices of Cheese\nButter',
      steps:
          'Butter one side of the white bread\nLayer ham, the pineapple and cheese on the white bread\nBake the toast for round about 10 minutes in the oven at 200°C',
      isGlutenFree: false,
      isVegan: false,
      isVegetarian: false,
      isLactoseFree: false,
      isFav: false),
  MealModel(
      id: '2',
      categories: [
        'c2',
        'c3',
      ],
      title: 'Classic Hamburger',
      affordability: Affordability.Pricey,
      complexity: Complexity.Simple,
      imageUrl: 'assets/images/img3.jpg',
      duration: 45,
      ingredients:
          '300g Cattle Hack\n1 Tomato\n1 Cucumber\n1 Onion\nKetchup\n2 Burger Buns',
      steps:
          'Form 2 patties\nFry the patties for c. 4 minutes on each side\nQuickly fry the buns for c. 1 minute on each side\nBruch buns with ketchup\nServe burger with tomato, cucumber and onion',
      isGlutenFree: false,
      isVegan: false,
      isVegetarian: false,
      isLactoseFree: true,
      isFav: false),
  MealModel(
      id: '3',
      categories: [
        'c4',
      ],
      title: 'Wiener Schnitzel',
      affordability: Affordability.Luxurious,
      complexity: Complexity.Challenging,
      imageUrl: 'assets/images/img4.jpg',
      duration: 60,
      ingredients:
          '8 Veal Cutlets\n4 Eggs\n200g Bread Crumbs\n100g Flour\n300ml Butter\n100g Vegetable Oil\nSalt\nLemon Slices',
      steps:
          'Tenderize the veal to about 2–4mm, and salt on both sides.\nOn a flat plate, stir the eggs briefly with a fork.\nLightly coat the cutlets in flour then dip into the egg, and finally, coat in breadcrumbs.\nHeat the butter and oil in a large pan (allow the fat to get very hot) and fry the schnitzels until golden brown on both sides.\nMake sure to toss the pan regularly so that the schnitzels are surrounded by oil and the crumbing becomes ‘fluffy’.\nRemove, and drain on kitchen paper. Fry the parsley in the remaining oil and drain.\nPlace the schnitzels on awarmed plate and serve garnishedwith parsley and slices of lemon.',
      isGlutenFree: false,
      isVegan: false,
      isVegetarian: false,
      isLactoseFree: false,
      isFav: false),
  MealModel(
      id: '4',
      categories: [
        'c2'
            'c5',
        'c10',
      ],
      title: 'Salad with Smoked Salmon',
      affordability: Affordability.Luxurious,
      complexity: Complexity.Simple,
      imageUrl: 'assets/images/img5.jpg',
      duration: 15,
      ingredients:
          'ArugulaLamb\n Lettuce\nParsley\nFennel\n200g Smoked Salmon\nMustard\nBalsamic Vinegar\nOlive Oil\nSalt and Pepper',
      steps:
          'Wash and cut salad and herbs\nDice the salmon\nProcess mustard, vinegar and olive oil into a dessing\nPrepare the salad\nAdd salmon cubes and dressing',
      isGlutenFree: true,
      isVegan: false,
      isVegetarian: true,
      isLactoseFree: true,
      isFav: false),
  MealModel(
      id: '5',
      categories: [
        'c6',
        'c10',
      ],
      title: 'Delicious Orange Mousse',
      affordability: Affordability.Affordable,
      complexity: Complexity.Hard,
      imageUrl: 'assets/images/img6.jpg',
      duration: 240,
      ingredients:
          '4 Sheets of Gelatin \n150ml Orange Juice\n80g Sugar\n300g Yoghurt\n200g Cream\nOrange Peel',
      steps:
          'Dissolve gelatine in pot\nAdd orange juice and sugar\nTake pot off the stove\nAdd 2 tablespoons of yoghurt\nStir gelatin under remaining yoghurt\nCool everything down in the refrigerator\nWhip the cream and lift it under die orange mass\nCool down again for at least 4 hours\nServe with orange peel',
      isGlutenFree: true,
      isVegan: false,
      isVegetarian: true,
      isLactoseFree: false,
      isFav: false),
  MealModel(
      id: '6',
      categories: [
        'c7',
      ],
      title: 'Pancakes',
      affordability: Affordability.Affordable,
      complexity: Complexity.Simple,
      imageUrl: 'assets/images/img7.jpg',
      duration: 20,
      ingredients:
          '1 1/2 Cups all-purpose Flour\n3 1/2 Teaspoons Baking Powder\n1 Teaspoon Salt\n1 Tablespoon White Sugar\n1 1/4 cups Milk\n1 Egg\n3 Tablespoons Butter, melted',
      steps:
          'Dissolve gelatine in pot\nAdd orange juice and sugar\nTake pot off the stove\nAdd 2 tablespoons of yoghurt\nStir gelatin under remaining yoghurt\nCool everything down in the refrigerator\nWhip the cream and lift it under die orange mass\nCool down again for at least 4 hours\nServe with orange peel',
      isGlutenFree: true,
      isVegan: false,
      isVegetarian: true,
      isLactoseFree: false,
      isFav: false),
  MealModel(
      id: '7',
      categories: [
        'c8',
      ],
      title: 'Creamy Indian Chicken Curry',
      affordability: Affordability.Pricey,
      complexity: Complexity.Challenging,
      imageUrl: 'assets/images/img8.jpg',
      duration: 35,
      ingredients:
          '1 1/2 Cups all-purpose Flour\n3 1/2 Teaspoons Baking Powder\n1 Teaspoon Salt\n1 Tablespoon White Sugar\n1 1/4 cups Milk\n1 Egg\n3 Tablespoons Butter, melted',
      steps:
          'Dissolve gelatine in pot\nAdd orange juice and sugar\nTake pot off the stove\nAdd 2 tablespoons of yoghurt\nStir gelatin under remaining yoghurt\nCool everything down in the refrigerator\nWhip the cream and lift it under die orange mass\nCool down again for at least 4 hours\nServe with orange peel',
      isGlutenFree: true,
      isVegan: false,
      isVegetarian: false,
      isLactoseFree: true,
      isFav: false),
  MealModel(
      id: '8',
      categories: [
        'c9',
      ],
      title: 'Chocolate Souffle',
      affordability: Affordability.Affordable,
      complexity: Complexity.Hard,
      imageUrl: 'assets/images/img9.jpg',
      duration: 45,
      ingredients:
          '1 1/2 Cups all-purpose Flour\n3 1/2 Teaspoons Baking Powder\n1 Teaspoon Salt\n1 Tablespoon White Sugar\n1 1/4 cups Milk\n1 Egg\n3 Tablespoons Butter, melted',
      steps:
          'Dissolve gelatine in pot\nAdd orange juice and sugar\nTake pot off the stove\nAdd 2 tablespoons of yoghurt\nStir gelatin under remaining yoghurt\nCool everything down in the refrigerator\nWhip the cream and lift it under die orange mass\nCool down again for at least 4 hours\nServe with orange peel',
      isGlutenFree: true,
      isVegan: false,
      isVegetarian: true,
      isLactoseFree: false,
      isFav: false),
  MealModel(
      id: '9',
      categories: [
        'c2',
        'c5',
        'c10',
      ],
      title: 'Asparagus Salad with Cherry Tomatoes',
      affordability: Affordability.Luxurious,
      complexity: Complexity.Simple,
      imageUrl: 'assets/images/img10.jpg',
      duration: 30,
      ingredients:
          '1 1/2 Cups all-purpose Flour\n3 1/2 Teaspoons Baking Powder\n1 Teaspoon Salt\n1 Tablespoon White Sugar\n1 1/4 cups Milk\n1 Egg\n3 Tablespoons Butter, melted',
      steps:
          'Dissolve gelatine in pot\nAdd orange juice and sugar\nTake pot off the stove\nAdd 2 tablespoons of yoghurt\nStir gelatin under remaining yoghurt\nCool everything down in the refrigerator\nWhip the cream and lift it under die orange mass\nCool down again for at least 4 hours\nServe with orange peel',
      isGlutenFree: true,
      isVegan: true,
      isVegetarian: true,
      isLactoseFree: true,
      isFav: false),
];
