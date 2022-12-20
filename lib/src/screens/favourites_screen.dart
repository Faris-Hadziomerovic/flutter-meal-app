import 'package:flutter/material.dart';
import 'package:meal_app/src/models/meal.dart';

import '../widgets/meal_item.dart';

class FavouritesScreen extends StatelessWidget {
  static const String routeName = '/favourites';

  final List<Meal> meals;

  const FavouritesScreen({super.key, required this.meals});

  @override
  Widget build(BuildContext context) {
    return meals.isEmpty
        ? const Center(
            child: Text('Your favourite meals will appear here.'),
          )
        : ListView.builder(
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
          );
  }
}
