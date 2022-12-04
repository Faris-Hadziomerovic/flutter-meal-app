import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;

import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  const MealItem({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.complexity,
    required this.affordability,
  });

  @override
  Widget build(BuildContext context) {
    final durationLabel = '$duration min';
    final complexityLabel = toBeginningOfSentenceCase(complexity.name) ?? complexity.name;
    final affordabilityLabel = toBeginningOfSentenceCase(affordability.name) ?? affordability.name;

    return Card(
      clipBehavior: Clip.antiAlias,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Image.network(
                imageUrl,
                fit: BoxFit.cover,
                height: 250,
                width: double.infinity,
              ),
              Positioned(
                bottom: 30,
                right: 0,
                child: Container(
                  width: 300,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.center,
                      colors: [
                        Colors.transparent,
                        Colors.black54,
                        Colors.black54,
                        Colors.black54,
                      ],
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 30,
                  ),
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.headline5,
                    softWrap: true,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    const Icon(Icons.access_time_rounded),
                    const SizedBox(width: 5),
                    Text(durationLabel),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.work),
                    const SizedBox(width: 5),
                    Text(complexityLabel),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.attach_money_rounded),
                    Text(affordabilityLabel),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
