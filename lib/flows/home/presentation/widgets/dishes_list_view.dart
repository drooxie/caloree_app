import 'package:caloree_app/app/router/routes.dart';
import 'package:caloree_app/flows/home/data/models/dish_model.dart';
import 'package:caloree_app/flows/home/presentation/widgets/dish_card.dart';
import 'package:flutter/material.dart';

class DishesListView extends StatelessWidget {
  const DishesListView({
    required this.dishes,
    super.key,
  });

  final List<DishModel> dishes;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: dishes.length,
      separatorBuilder: (_, _) => const SizedBox(height: 24),
      itemBuilder: (_, index) {
        final dish = dishes[index];

        return GestureDetector(
          onTap: () => DishDetailsPageRoute(dish).push(context),
          child: DishCard(dish: dish),
        );
      },
    );
  }
}
