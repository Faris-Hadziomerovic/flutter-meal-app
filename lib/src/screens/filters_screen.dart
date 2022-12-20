import 'package:flutter/material.dart';
import 'package:meal_app/src/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Map<String, bool> filters;

  final void Function(Map<String, bool> filters) onSave;

  const FiltersScreen({super.key, required this.filters, required this.onSave});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  late bool _isGlutenFree;
  late bool _isLactoseFree;
  late bool _isVegetarian;
  late bool _isVegan;

  @override
  void initState() {
    super.initState();

    setState(() {
      _isGlutenFree = widget.filters['gluten'] ?? false;
      _isLactoseFree = widget.filters['lactose'] ?? false;
      _isVegetarian = widget.filters['vegetarian'] ?? false;
      _isVegan = widget.filters['vegan'] ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: IconButton(
              icon: const Icon(
                Icons.save,
              ),
              onPressed: () {
                widget.onSave(
                  {
                    'gluten': _isGlutenFree,
                    'lactose': _isLactoseFree,
                    'vegetarian': _isVegetarian,
                    'vegan': _isVegan,
                  },
                );

                if (Navigator.of(context).canPop()) {
                  Navigator.of(context).pop();
                } else {
                  Navigator.of(context).pushReplacementNamed('/');
                }
              },
            ),
          ),
        ],
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          SwitchListTile(
            value: _isGlutenFree,
            onChanged: (newValue) {
              setState(() {
                _isGlutenFree = newValue;
              });
            },
            title: const Text('Gluten-free'),
            subtitle: const Text('Only show gluten-free meals.'),
          ),
          SwitchListTile(
            value: _isLactoseFree,
            onChanged: (newValue) {
              setState(() {
                _isLactoseFree = newValue;
              });
            },
            title: const Text('Lactose-free'),
            subtitle: const Text('Only show lactose-free meals'),
          ),
          SwitchListTile(
            value: _isVegetarian,
            onChanged: (newValue) {
              setState(() {
                _isVegetarian = newValue;
              });
            },
            title: const Text('Vegetarian'),
            subtitle: const Text('Only show vegetarian meals'),
          ),
          SwitchListTile(
            value: _isVegan,
            onChanged: (newValue) {
              setState(() {
                _isVegan = newValue;
              });
            },
            title: const Text('Vegan'),
            subtitle: const Text('Only show vegan meals'),
          ),
        ],
      ),
    );
  }
}
