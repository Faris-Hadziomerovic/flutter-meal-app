import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/src/widgets/category_meals_screen.dart';

import 'widgets/categories_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      scrollBehavior: const CupertinoScrollBehavior(),
      theme: ThemeData(
        primarySwatch: Colors.pink,
        // ignore: deprecated_member_use
        accentColor: Colors.amber,
        canvasColor: const Color.fromARGB(255, 212, 212, 212),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(
                color: Color.fromARGB(255, 20, 51, 51),
              ),
              bodyText2: const TextStyle(
                color: Color.fromARGB(255, 20, 51, 51),
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
        '/category-meals': (context) => const CategoryMealsScreen(),
      },
    );
  }
}
