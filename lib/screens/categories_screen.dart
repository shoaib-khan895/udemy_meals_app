import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/category_item.dart';

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
          childAspectRatio: 3 /2,
          crossAxisSpacing: 0,
          mainAxisSpacing: 10,
        ),
        children: DUMMY_CATEGORIES
            .map(
              (catData) => CategoryItem(
                    catData.id,
                    catData.title,
                    catData.image,
                  ),
            ).toList(),
      ),
    );
  }
}
