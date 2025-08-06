import 'package:caloree_app/app/style/app_style_constants.dart';
import 'package:flutter/material.dart';

class IngredientChip extends StatelessWidget {
  const IngredientChip({
    required this.ingredient,
    this.isSelected = false,
    super.key,
  });

  final String ingredient;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final activeColor = ColorScheme.of(context).primaryContainer;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: isSelected ? activeColor : null,
        borderRadius: AppStyleConstants().borderRadius,
        border: Border.all(
          width: 2,
          color: activeColor,
        ),
      ),
      child: Text(
        ingredient,
        style: TextTheme.of(
          context,
        ).bodyLarge?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }
}
