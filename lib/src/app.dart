import 'package:flutter/material.dart';

import './screens/tabs_screen.dart';
import './screens/categories_screen.dart';
import './screens/favourites_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/meal_details_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  Scaffold buildScaffold({required Widget body, String title = ''}) {
    return Scaffold(
      appBar: title.isNotEmpty ? AppBar(title: Text(title)) : null,
      body: body,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        // ignore: deprecated_member_use
        accentColor: Colors.amber,
        canvasColor: const Color.fromARGB(255, 238, 238, 238),
        backgroundColor: Colors.white,
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
      home: const TabsScreen(),
      routes: {
        CategoryMealsScreen.routeName: (context) => const CategoryMealsScreen(),
        MealDetailsScreen.routeName: (context) => const MealDetailsScreen(),
        CategoriesScreen.routeName: (context) => buildScaffold(
              body: const CategoriesScreen(),
              title: 'Categories',
            ),
        FavouritesScreen.routeName: (context) => buildScaffold(
              body: const FavouritesScreen(),
              title: 'Favourites',
            ),
      },
    );
  }
}
