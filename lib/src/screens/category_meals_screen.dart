import 'package:flutter/material.dart';

import '../data/dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';

  const CategoryMealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)?.settings.arguments as Map<String, String>;

    // ignore: unused_local_variable
    final categoryId = routeArgs['id'];
    final categoryTitle = routeArgs['title'];

    final meals = dummyMeals.where((meal) => meal.categories.contains(categoryId));

    print(meals);

    return Scaffold(
      appBar: AppBar(
        title: Text('$categoryTitle Recipes'),
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (ctx, index) {
          return Container();
        },
      ),
    );
  }
}
