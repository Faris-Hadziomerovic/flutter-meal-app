import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

import '../models/meal.dart';
import '../widgets/main_drawer.dart';
import './categories_screen.dart';
import './favourites_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favouriteMeals;

  const TabsScreen({super.key, required this.favouriteMeals});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late List<Map<String, Object>> _pages;

  int _pageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _pageIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();

    _pages = [
      {
        'page': const CategoriesScreen(),
        'title': 'Categories',
        'icon': const Icon(Icons.category_outlined),
        'activeIcon': const Icon(Icons.category),
      },
      {
        'page': FavouritesScreen(meals: widget.favouriteMeals),
        'title': 'Favourites',
        'icon': const Icon(Icons.favorite_border),
        'activeIcon': const Icon(Icons.favorite),
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _pages[_pageIndex]['title'] as String,
        ),
      ),
      drawer: const MainDrawer(),
      body: _pages[_pageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        backgroundColor: Theme.of(context).primaryColor,
        onTap: _selectPage,
        currentIndex: _pageIndex,
        items: [
          ..._pages.mapIndexed((i, page) {
            return BottomNavigationBarItem(
              label: _pages[i]['title'] as String,
              icon: _pages[i]['icon'] as Icon,
              activeIcon: _pages[i]['activeIcon'] as Icon,
            );
          }),
        ],
      ),
    );
  }
}
