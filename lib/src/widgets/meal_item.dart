import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;

import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final Meal meal;

  const MealItem({super.key, required this.meal});

  String toCapitalized(String text) {
    return text[0].toUpperCase() + text.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    const borderRadius = Radius.circular(15);
    final durationLabel = '${meal.duration} min';
    final complexityLabel = toBeginningOfSentenceCase(meal.complexity.name) ?? meal.complexity.name;
    final affordabilityLabel =
        toBeginningOfSentenceCase(meal.affordability.name) ?? meal.affordability.name;

    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(borderRadius),
      ),
      child: Column(
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(top: borderRadius),
            ),
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                Image.network(meal.imageUrl),
                Padding(
                  padding: const EdgeInsets.only(bottom: 25.0),
                  child: Container(
                    color: Colors.black54,
                    width: 300,
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 15,
                    ),
                    child: Text(
                      meal.title,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton.icon(
                  onPressed: null,
                  icon: const Icon(Icons.access_time_rounded),
                  label: Text(durationLabel),
                ),
                TextButton.icon(
                  onPressed: null,
                  icon: const Icon(Icons.cases_rounded),
                  label: Text(complexityLabel),
                ),
                TextButton.icon(
                  onPressed: null,
                  icon: const Icon(Icons.attach_money_rounded),
                  label: Text(affordabilityLabel),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
