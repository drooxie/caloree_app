import 'package:caloree_app/app/constants/app_constants.dart';
import 'package:caloree_app/flows/home/presentation/widgets/ingredient_chip.dart';
import 'package:flutter/material.dart';

class IngredientsSelector extends StatefulWidget {
  const IngredientsSelector({
    required this.onSelectedIngredientsChanged,
    super.key,
  });

  final ValueChanged<List<String>> onSelectedIngredientsChanged;

  @override
  State<IngredientsSelector> createState() => _IngredientsSelectorState();
}

class _IngredientsSelectorState extends State<IngredientsSelector> {
  final List<String> selected = [];

  void _onIngredientPressed(String ingredient) {
    setState(
      () => selected.contains(ingredient)
          ? selected.remove(ingredient)
          : selected.add(ingredient),
    );

    widget.onSelectedIngredientsChanged(selected);
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 6,
      runSpacing: 8,
      children: AppConstants.dishIngredients.map(
        (ingredient) {
          return GestureDetector(
            onTap: () => _onIngredientPressed(ingredient),
            child: IngredientChip(
              ingredient: ingredient,
              isSelected: selected.contains(ingredient),
            ),
          );
        },
      ).toList(),
    );
  }
}
