import 'package:flutter/material.dart';

import '../data/dummy_data.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routeName = '/meal-details';

  const MealDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    final meal = dummyMeals.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: Center(
        child: Text(meal.title),
      ),
    );
  }
}
