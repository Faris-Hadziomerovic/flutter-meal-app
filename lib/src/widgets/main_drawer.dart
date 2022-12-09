import 'package:flutter/material.dart';
import 'package:meal_app/src/screens/favourites_screen.dart';
import 'package:meal_app/src/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  final String title;

  const MainDrawer({super.key, this.title = 'What\'s cooking?'});

  Widget buildListTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.only(
        left: 32.0,
        right: 16.0,
      ),
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 21,
          fontWeight: FontWeight.w600,
        ),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).viewPadding.top,
              ),
              Container(
                height: 60,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                alignment: Alignment.centerLeft,
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              const Divider(height: 0),
              const SizedBox(height: 10),
              buildListTile(
                icon: Icons.restaurant,
                title: 'Meals',
                onTap: () {
                  Navigator.of(context).pushReplacementNamed('/');
                },
              ),
              buildListTile(
                icon: Icons.star,
                title: 'Favourites',
                onTap: () {
                  Navigator.of(context).pushReplacementNamed(FavouritesScreen.routeName);
                },
              ),
            ],
          ),
          Column(
            children: [
              const Divider(height: 0),
              buildListTile(
                icon: Icons.settings,
                title: 'Filters',
                onTap: () {
                  Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
