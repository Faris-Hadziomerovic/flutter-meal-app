import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';

  final List<Meal> availableMeals;

  const CategoryMealsScreen(this.availableMeals, {super.key});

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)?.settings.arguments as Map<String, String>;

    final categoryId = routeArgs['id'];
    final categoryTitle = routeArgs['title'];

    final meals = availableMeals.where((meal) => meal.categories.contains(categoryId)).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('$categoryTitle Recipes'),
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        controller: ScrollController(initialScrollOffset: 1),
        padding: const EdgeInsets.symmetric(horizontal: 5),
        itemCount: meals.length,
        itemBuilder: (ctx, index) {
          final meal = meals[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: MealItem(
              id: meal.id,
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
