import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class MealDetailsToggleButtons extends StatefulWidget {
  final List<String> ingredients;
  final List<String> steps;
  final double buttonHeight;
  final Color? unselectedBackgroundColor;
  final Color? selectedBackgroundColor;
  final Color? unselectedForegroundColor;
  final Color? selectedForegroundColor;

  const MealDetailsToggleButtons({
    super.key,
    required this.ingredients,
    required this.steps,
    this.buttonHeight = 45.0,
    this.unselectedBackgroundColor,
    this.selectedBackgroundColor,
    this.selectedForegroundColor,
    this.unselectedForegroundColor,
  });

  @override
  State<MealDetailsToggleButtons> createState() => _MealDetailsToggleButtonsState();
}

class _MealDetailsToggleButtonsState extends State<MealDetailsToggleButtons> {
  final _isSelected = [true, false];

  @override
  Widget build(BuildContext context) {
    final selectedColor = widget.selectedBackgroundColor ?? Theme.of(context).canvasColor;
    final unselectedColor = widget.unselectedBackgroundColor ?? Theme.of(context).backgroundColor;
    final screenWidth = MediaQuery.of(context).size.width;
    final buttonWidth = screenWidth / 2;
    final buttonHeight = widget.buttonHeight;

    return Column(
      children: [
        SizedBox(
          height: buttonHeight,
          child: ToggleButtons(
            color: widget.unselectedForegroundColor,
            selectedColor: widget.selectedForegroundColor,
            renderBorder: false,
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
              buildToggleButtonTabV2(
                isSelected: _isSelected[0],
                text: 'Ingredients',
                selectedColor: selectedColor,
                unselectedColor: unselectedColor,
                width: buttonWidth,
              ),
              buildToggleButtonTabV2(
                isSelected: _isSelected[1],
                text: 'Steps',
                selectedColor: selectedColor,
                unselectedColor: unselectedColor,
                width: buttonWidth,
              ),
            ],
          ),
        ),
        if (_isSelected[0]) buildList(list: widget.ingredients),
        if (_isSelected[1]) buildList(list: widget.steps),
      ],
    );
  }

  Widget buildList({
    required List<String> list,
    Color? backgroundColor,
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

  Widget buildToggleButtonTab({
    required bool isSelected,
    required String text,
    required Color selectedColor,
    required Color unselectedColor,
    required double width,
    required double height,
    required BorderRadius selectedBorderRadius,
    required BorderRadius unselectedBorderRadius,
  }) {
    return Container(
      color: isSelected ? unselectedColor : selectedColor,
      width: width,
      height: height,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? selectedColor : unselectedColor,
          borderRadius: isSelected ? selectedBorderRadius : unselectedBorderRadius,
        ),
        child: Center(
          child: Text(text),
        ),
      ),
    );
  }

  Widget buildToggleButtonTabV2({
    required bool isSelected,
    required String text,
    required Color selectedColor,
    required Color unselectedColor,
    required double width,
    double? height,
    AxisDirection openSideDirection = AxisDirection.down,
    Radius borderRadius = const Radius.circular(15),
    int centerFlex = 15,
    int sidesFlex = 1,
  }) {
    Axis axis;
    BorderRadius borderRadiusFirst;
    BorderRadius borderRadiusCenter;
    BorderRadius borderRadiusLast;

    switch (openSideDirection) {
      case AxisDirection.left:
        axis = Axis.vertical;
        borderRadiusCenter = BorderRadius.horizontal(right: borderRadius);
        borderRadiusFirst = BorderRadius.only(bottomLeft: borderRadius);
        borderRadiusLast = BorderRadius.only(topLeft: borderRadius);
        break;
      case AxisDirection.right:
        axis = Axis.vertical;
        borderRadiusCenter = BorderRadius.horizontal(left: borderRadius);
        borderRadiusFirst = BorderRadius.only(bottomRight: borderRadius);
        borderRadiusLast = BorderRadius.only(topRight: borderRadius);
        break;
      case AxisDirection.up:
        axis = Axis.horizontal;
        borderRadiusCenter = BorderRadius.vertical(bottom: borderRadius);
        borderRadiusFirst = BorderRadius.only(topRight: borderRadius);
        borderRadiusLast = BorderRadius.only(topLeft: borderRadius);
        break;
      default:
        axis = Axis.horizontal;
        borderRadiusCenter = BorderRadius.vertical(top: borderRadius);
        borderRadiusFirst = BorderRadius.only(bottomRight: borderRadius);
        borderRadiusLast = BorderRadius.only(bottomLeft: borderRadius);
    }

    return SizedBox(
      width: width,
      height: height,
      child: Flex(
        direction: axis,
        children: [
          // first concave border part
          Flexible(
            flex: sidesFlex,
            child: Container(
              color: isSelected ? selectedColor : unselectedColor,
              child: Container(
                decoration: BoxDecoration(
                  color: unselectedColor,
                  borderRadius: isSelected ? borderRadiusFirst : null,
                ),
              ),
            ),
          ),
          // center part
          Flexible(
            flex: centerFlex,
            child: Container(
              color: isSelected ? unselectedColor : selectedColor,
              child: Container(
                decoration: BoxDecoration(
                  color: isSelected ? selectedColor : unselectedColor,
                  borderRadius: isSelected ? borderRadiusCenter : null,
                ),
                child: Center(
                  child: Text(text),
                ),
              ),
            ),
          ),
          // last concave border part
          Flexible(
            flex: sidesFlex,
            child: Container(
              color: isSelected ? selectedColor : unselectedColor,
              child: Container(
                decoration: BoxDecoration(
                  color: unselectedColor,
                  borderRadius: isSelected ? borderRadiusLast : null,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
