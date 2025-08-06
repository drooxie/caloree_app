import 'package:caloree_app/flows/home/data/models/dish_model.dart';
import 'package:caloree_app/flows/home/presentation/widgets/ingredient_chip.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DishDetailsPage extends StatelessWidget {
  const DishDetailsPage({
    required this.dish,
    super.key,
  });

  final DishModel dish;

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat(
      DateFormat.HOUR_MINUTE,
    ).format(dish.dateAdded);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: 'dish-${dish.id}-image',
                child: const AspectRatio(
                  aspectRatio: 1,
                  child: Placeholder(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24),
                    Text(
                      dish.title,
                      style: TextTheme.of(context).headlineMedium,
                    ),
                    Text(
                      'Calories: ${dish.calories}',
                      style: TextTheme.of(context).titleLarge,
                    ),

                    const SizedBox(height: 32),

                    Text(
                      'Spotted at: $formattedDate',
                      style: TextTheme.of(context).titleLarge,
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Divider(color: ColorScheme.of(context).surface),
                    ),

                    Text(
                      'Ingredients:',
                      style: TextTheme.of(context).bodyLarge,
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Wrap(
                        spacing: 8,
                        runSpacing: 12,
                        children: dish.ingredients
                            .map(
                              (ingredient) =>
                                  IngredientChip(ingredient: ingredient),
                            )
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
