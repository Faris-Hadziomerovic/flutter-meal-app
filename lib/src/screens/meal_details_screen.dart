import 'package:flutter/material.dart';

import '../widgets/meal_details_toggle_buttons.dart';
import '../data/dummy_data.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routeName = '/meal-details';

  const MealDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    final meal = dummyMeals.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              meal.imageUrl,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
                top: 10,
              ),
              child: Text(
                meal.title,
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            const Divider(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    const Icon(Icons.access_time_rounded),
                    const SizedBox(width: 5),
                    Text(meal.durationLabel),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.work),
                    const SizedBox(width: 5),
                    Text(meal.complexityLabel),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.attach_money_rounded),
                    Text(meal.affordabilityLabel),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0.0),
              child: MealDetailsToggleButtons(ingredients: meal.ingredients, steps: meal.steps),
            )
          ],
        ),
      ),
    );
  }
}
