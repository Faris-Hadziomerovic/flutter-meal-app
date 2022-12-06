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

  Container renderList({
    required List<String> list,
    required Color backgroundColor,
  }) {
    return Container(
      color: backgroundColor,
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: list.mapIndexed((index, item) {
          return ListTile(
            horizontalTitleGap: 5,
            leading: CircleAvatar(
              radius: 17,
              child: Text('${index + 1}.'),
            ),
            title: Text(item),
          );
        }).toList(),
      ),
    );
  }

  Container renderToggleTab({
    required bool isSelected,
    required String text,
    required Color selectedColor,
    required Color unSelectedColor,
    required double width,
    required double height,
    required BorderRadius selectedBorderRadius,
    required BorderRadius unselectedBorderRadius,
  }) {
    return Container(
      color: isSelected ? unSelectedColor : selectedColor,
      width: width,
      height: height,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? selectedColor : unSelectedColor,
          borderRadius: isSelected ? selectedBorderRadius : unselectedBorderRadius,
        ),
        child: Center(
          child: Text(text),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final buttonWidth = screenWidth / 2;
    const buttonHeight = 50.0;
    const unSelectedColor = Colors.white;
    const selectedColor = Color.fromARGB(255, 243, 243, 243);
    const selectedBorderRadius = BorderRadius.vertical(top: Radius.circular(20));

    return Column(
      children: [
        ToggleButtons(
          renderBorder: false,
          fillColor: Colors.white,
          textStyle: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            fontFamily: 'Raleway',
          ),
          isSelected: _isSelected,
          onPressed: (index) {
            for (var i = 0; i < _isSelected.length; i++) {
              setState(() {
                _isSelected[i] = i == index;
              });
            }
          },
          children: [
            renderToggleTab(
              isSelected: _isSelected[0],
              text: 'Ingredients',
              selectedColor: selectedColor,
              unSelectedColor: unSelectedColor,
              selectedBorderRadius: selectedBorderRadius,
              unselectedBorderRadius: const BorderRadius.only(bottomRight: Radius.circular(15)),
              height: buttonHeight,
              width: buttonWidth,
            ),
            renderToggleTab(
              isSelected: _isSelected[1],
              text: 'Steps',
              selectedColor: selectedColor,
              unSelectedColor: unSelectedColor,
              selectedBorderRadius: selectedBorderRadius,
              unselectedBorderRadius: const BorderRadius.only(bottomLeft: Radius.circular(15)),
              height: buttonHeight,
              width: buttonWidth,
            ),
          ],
        ),
        if (_isSelected[0])
          renderList(
            list: widget.ingredients,
            backgroundColor: selectedColor,
          ),
        if (_isSelected[1])
          renderList(
            list: widget.steps,
            backgroundColor: selectedColor,
          ),
      ],
    );
  }
}
