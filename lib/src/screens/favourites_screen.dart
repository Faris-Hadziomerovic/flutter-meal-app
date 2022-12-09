import 'package:flutter/material.dart';

import '../data/dummy_data.dart';
import '../widgets/meal_item.dart';

class FavouritesScreen extends StatelessWidget {
  static const String routeName = '/favourites';

  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final meals = dummyMeals.where((meal) => meal.isFavourite).toList();

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
