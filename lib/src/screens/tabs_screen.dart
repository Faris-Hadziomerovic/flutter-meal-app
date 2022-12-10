import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

import '../widgets/main_drawer.dart';
import './categories_screen.dart';
import './favourites_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Object>> _pages = [
    {
      'page': const CategoriesScreen(),
      'title': 'Categories',
      'icon': const Icon(Icons.category_outlined),
      'activeIcon': const Icon(Icons.category),
    },
    {
      'page': const FavouritesScreen(),
      'title': 'Favourites',
      'icon': const Icon(Icons.favorite_border),
      'activeIcon': const Icon(Icons.favorite),
    },
  ];

  int _pageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _pageIndex = index;
    });
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

Widget buildTopSideTabbedPage() {
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
      body: const TabBarView(
        children: [
          CategoriesScreen(),
          FavouritesScreen(),
        ],
      ),
    ),
  );
}
