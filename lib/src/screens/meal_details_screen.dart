import 'package:flutter/material.dart';

import '../widgets/meal_details_toggle_buttons.dart';
import '../data/dummy_data.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routeName = '/meal-details';

  final void Function(String mealId) onFavourite;

  final bool Function(String mealId) determineFavouriteStatus;

  const MealDetailsScreen({
    super.key,
    required this.onFavourite,
    required this.determineFavouriteStatus,
  });

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    final isFavourite = determineFavouriteStatus(mealId);
    final meal = dummyMeals.firstWhere((meal) => meal.id == mealId);

    final backgroundColor = Theme.of(context).backgroundColor;

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(isFavourite ? Icons.favorite : Icons.favorite_border_outlined),
        onPressed: () => onFavourite(meal.id),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: backgroundColor,
              child: Image.network(
                meal.imageUrl,
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              color: backgroundColor,
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 15,
              ),
              child: Text(
                meal.title,
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            Container(
              height: 55,
              decoration: BoxDecoration(
                color: backgroundColor,
                border: Border.symmetric(
                  horizontal: BorderSide(
                    width: 0,
                    color: Theme.of(context).dividerColor,
                  ),
                ),
              ),
              child: Row(
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
            ),
            MealDetailsToggleButtons(
              ingredients: meal.ingredients,
              steps: meal.steps,
            ),
          ],
        ),
      ),
    );
  }
}
