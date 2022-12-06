import 'package:flutter/material.dart';
import 'package:meal_app/src/screens/category_meals_screen.dart';
import 'package:meal_app/src/screens/meal_details_screen.dart';

import './screens/categories_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        // ignore: deprecated_member_use
        accentColor: Colors.amber,
        canvasColor: const Color.fromARGB(255, 238, 238, 238),
        cardTheme: const CardTheme(
          elevation: 5,
        ),
        fontFamily: 'Raleway',
        iconTheme: ThemeData.light().iconTheme.copyWith(color: Colors.black54),
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(
                color: Color.fromARGB(255, 20, 51, 51),
              ),
              bodyText2: const TextStyle(
                color: Color.fromARGB(255, 20, 51, 51),
              ),
              headline5: const TextStyle(
                fontFamily: 'Raleway',
                fontSize: 30,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              headline6: const TextStyle(
                fontFamily: 'Roboto',
                fontSize: 24,
                color: Color.fromARGB(255, 51, 20, 20),
              ),
            ),
      ),
      home: const CategoriesScreen(),
      routes: {
        CategoryMealsScreen.routeName: (context) => const CategoryMealsScreen(),
        MealDetailsScreen.routeName: (context) => const MealDetailsScreen(),
      },
    );
  }
}
