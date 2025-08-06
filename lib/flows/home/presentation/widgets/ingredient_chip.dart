import 'package:caloree_app/app/style/app_style_constants.dart';
import 'package:flutter/material.dart';

class IngredientChip extends StatelessWidget {
  const IngredientChip({
    required this.ingredient,
    super.key,
  });

  final String ingredient;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: AppStyleConstants().borderRadius,
        border: Border.all(
          width: 2,
          color: ColorScheme.of(context).primaryContainer,
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
