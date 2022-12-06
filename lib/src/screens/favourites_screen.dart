import 'package:flutter/material.dart';

class FavouritesScreen extends StatelessWidget {
  static const String routeName = '/favourites';

  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Your favourite meals will appear here.'),
    );
  }
}
