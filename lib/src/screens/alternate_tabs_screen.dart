import 'package:flutter/material.dart';

import '../models/meal.dart';
import './categories_screen.dart';
import './favourites_screen.dart';

class AlternateTabsScreen extends StatelessWidget {
  final List<Meal> favouriteMeals;

  const AlternateTabsScreen({super.key, required this.favouriteMeals});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Deli meals'),
          bottom: TabBar(
            splashBorderRadius: const BorderRadius.vertical(
              top: Radius.circular(20),
            ),
            tabs: [
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.category_outlined),
                    SizedBox(width: 10),
                    Text('Categories'),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.favorite_outline),
                    SizedBox(width: 15),
                    Text('Favourites'),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            const CategoriesScreen(),
            FavouritesScreen(meals: favouriteMeals),
          ],
        ),
      ),
    );
  }
}
