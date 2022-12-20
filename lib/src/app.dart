import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import './screens/filters_screen.dart';
import './screens/tabs_screen.dart';
import './screens/categories_screen.dart';
import './screens/favourites_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/meal_details_screen.dart';
import './widgets/main_drawer.dart';
import './models/meal.dart';
import './data/dummy_data.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  List<Meal> availableMeals = dummyMeals;

  List<Meal> favouriteMeals = [];

  var _filters = {
    'gluten': false,
    'lactose': false,
    'vegetarian': false,
    'vegan': false,
  };

  bool _isMealFavourite(String mealId) {
    return favouriteMeals.isNotEmpty && favouriteMeals.any((meal) => meal.id == mealId);
  }

  void _onToggleFavourite(String mealId) {
    Meal meal;

    try {
      meal = dummyMeals.firstWhere((meal) => meal.id == mealId);
    } on StateError {
      Fluttertoast.showToast(
        msg: 'An error occured! Please contact the developers.',
        backgroundColor: Colors.black54,
      );

      return;
    }

    setState(() {
      if (!favouriteMeals.remove(meal)) {
        favouriteMeals.add(meal);
        Fluttertoast.showToast(
          msg: '${meal.title} added to favourites',
          backgroundColor: Colors.black54,
        );
      } else {
        Fluttertoast.showToast(
          msg: '${meal.title} removed to favourites',
          backgroundColor: Colors.black54,
        );
      }
    });
  }

  void _onSave(Map<String, bool> newFilters) {
    setState(() {
      _filters = newFilters;

      availableMeals = dummyMeals.where((meal) {
        if (_filters['gluten'] as bool && !meal.isGlutenFree) return false;
        if (_filters['lactose'] as bool && !meal.isLactoseFree) return false;
        if (_filters['vegetarian'] as bool && !meal.isVegetarian) return false;
        if (_filters['vegan'] as bool && !meal.isVegan) return false;

        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        // ignore: deprecated_member_use
        // accentColor: Colors.amber,
        canvasColor: const Color.fromARGB(255, 238, 238, 238),
        backgroundColor: Colors.white,
        cardTheme: const CardTheme(elevation: 5),
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
      home: TabsScreen(favouriteMeals: favouriteMeals),
      routes: {
        MealDetailsScreen.routeName: (context) => MealDetailsScreen(
              onFavourite: _onToggleFavourite,
              determineFavouriteStatus: _isMealFavourite,
            ),
        CategoryMealsScreen.routeName: (context) => CategoryMealsScreen(availableMeals),
        FiltersScreen.routeName: (context) {
          return FiltersScreen(
            filters: _filters,
            onSave: _onSave,
          );
        },
        CategoriesScreen.routeName: (context) => buildScaffold(
              body: const CategoriesScreen(),
              title: 'Categories',
            ),
        FavouritesScreen.routeName: (context) => buildScaffold(
              body: FavouritesScreen(meals: favouriteMeals),
              title: 'Favourites',
              includeDrawer: true,
            ),
      },
    );
  }

  Scaffold buildScaffold({required Widget body, String title = '', bool includeDrawer = false}) {
    return Scaffold(
      appBar: title.isNotEmpty ? AppBar(title: Text(title)) : null,
      drawer: includeDrawer ? const MainDrawer() : null,
      body: body,
    );
  }
}
