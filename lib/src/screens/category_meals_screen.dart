import 'package:flutter/material.dart';
import 'package:meal_app/src/widgets/meal_item.dart';

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

    final meals = dummyMeals.where((meal) => meal.categories.contains(categoryId)).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('$categoryTitle Recipes'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        itemCount: meals.length,
        itemBuilder: (ctx, index) {
          final meal = meals[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: MealItem(
              title: meal.title,
              imageUrl: meal.imageUrl,
              duration: meal.duration,
              complexity: meal.complexity,
              affordability: meal.affordability,
            ),
          );
        },
      ),
    );
  }
}
