import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class MealDetailsToggleButtons extends StatefulWidget {
  final List<String> ingredients;
  final List<String> steps;

  const MealDetailsToggleButtons({
    super.key,
    required this.ingredients,
    required this.steps,
  });

  @override
  State<MealDetailsToggleButtons> createState() => _MealDetailsToggleButtonsState();
}

class _MealDetailsToggleButtonsState extends State<MealDetailsToggleButtons> {
  final _isSelected = [true, false];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        ToggleButtons(
          renderBorder: false,
          borderWidth: 0,
          isSelected: _isSelected,
          onPressed: (index) {
            for (var i = 0; i < _isSelected.length; i++) {
              setState(() {
                _isSelected[i] = i == index;
              });
            }
          },
          children: [
            SizedBox(
              width: width / 2,
              child: const Text(
                'Ingredients',
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              width: width / 2,
              child: const Text(
                'Steps',
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        if (_isSelected[0])
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: widget.ingredients.mapIndexed((index, ingredient) {
                return ListTile(
                  horizontalTitleGap: 5,
                  leading: CircleAvatar(
                    radius: 17,
                    child: Text('${index + 1}.'),
                  ),
                  title: Text(ingredient),
                );
              }).toList(),
            ),
          ),
        if (_isSelected[1])
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: widget.steps.mapIndexed((index, step) {
                return ListTile(
                  horizontalTitleGap: 5,
                  leading: CircleAvatar(
                    radius: 17,
                    child: Text('${index + 1}.'),
                  ),
                  title: Text(step),
                );
              }).toList(),
            ),
          ),
      ],
    );
  }
}
