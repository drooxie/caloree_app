import 'package:caloree_app/app/style/app_style_constants.dart';
import 'package:caloree_app/flows/home/data/models/dish_model.dart';
import 'package:flutter/material.dart';

class DishCard extends StatelessWidget {
  const DishCard({
    required this.dish,
    super.key,
  });

  final DishModel dish;

  @override
  Widget build(BuildContext context) {
    final colors = ColorScheme.of(context);
    final textTheme = TextTheme.of(context);

    return Container(
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
        color: colors.primaryContainer.withValues(alpha: 0.2),
        borderRadius: AppStyleConstants().borderRadius,
        border: Border.all(
          width: 2,
          color: colors.primaryContainer,
        ),
      ),
      child: Row(
        children: [
          Hero(
            tag: 'dish-${dish.id}-image',
            child: const AspectRatio(
              aspectRatio: 1,
              child: Placeholder(),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dish.title,
                    style: textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: textTheme.headlineLarge?.color,
                    ),
                  ),
                  Text(
                    '${dish.calories} calories',
                    style: textTheme.labelLarge,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    dish.ingredients.join(', '),
                    style: textTheme.labelLarge,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
