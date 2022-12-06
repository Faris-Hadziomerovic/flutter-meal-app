import 'package:flutter/material.dart';

import '../widgets/category_item.dart';
import '../data/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  static const String routeName = '/categories';

  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(15),
      physics: const BouncingScrollPhysics(),
      controller: ScrollController(initialScrollOffset: 1),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: dummyCategories.map(
        (categoryData) {
          return CategoryItem(
            id: categoryData.id,
            title: categoryData.title,
            color: categoryData.color,
          );
        },
      ).toList(),
    );
  }
}
