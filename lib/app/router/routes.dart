// ignore_for_file: prefer_match_file_name
import 'package:caloree_app/flows/add_dish/presentation/add_dish_page.dart';
import 'package:caloree_app/flows/home/data/models/dish_model.dart';
import 'package:caloree_app/flows/home/presentation/dish_details_page.dart';
import 'package:caloree_app/flows/home/presentation/home_page.dart';
import 'package:circular_reveal_animation/circular_reveal_animation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'routes.g.dart';

@TypedGoRoute<HomePageRoute>(
  path: '/home',
  routes: [
    TypedGoRoute<DishDetailsPageRoute>(path: 'dish-details'),
  ],
)
class HomePageRoute extends GoRouteData with _$HomePageRoute {
  const HomePageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomePage();
  }
}

class DishDetailsPageRoute extends GoRouteData with _$DishDetailsPageRoute {
  const DishDetailsPageRoute(this.$extra);

  final DishModel $extra;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return DishDetailsPage(dish: $extra);
  }
}

@TypedGoRoute<AddDishPageRoute>(path: '/add-dish')
class AddDishPageRoute extends GoRouteData with _$AddDishPageRoute {
  const AddDishPageRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage(
      child: const AddDishPage(),
      transitionsBuilder: (context, animation, _, child) {
        return CircularRevealAnimation(
          centerOffset: MediaQuery.of(context).size.bottomCenter(Offset.zero),
          animation: animation,
          child: child,
        );
      },
    );
  }
}
