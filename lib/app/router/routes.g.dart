// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$homePageRoute, $addDishPageRoute];

RouteBase get $homePageRoute => GoRouteData.$route(
  path: '/home',

  factory: _$HomePageRoute._fromState,
  routes: [
    GoRouteData.$route(
      path: 'dish-details',

      factory: _$DishDetailsPageRoute._fromState,
    ),
  ],
);

mixin _$HomePageRoute on GoRouteData {
  static HomePageRoute _fromState(GoRouterState state) => const HomePageRoute();

  @override
  String get location => GoRouteData.$location('/home');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$DishDetailsPageRoute on GoRouteData {
  static DishDetailsPageRoute _fromState(GoRouterState state) =>
      DishDetailsPageRoute(state.extra as DishModel);

  DishDetailsPageRoute get _self => this as DishDetailsPageRoute;

  @override
  String get location => GoRouteData.$location('/home/dish-details');

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $addDishPageRoute => GoRouteData.$route(
  path: '/add-dish',

  factory: _$AddDishPageRoute._fromState,
);

mixin _$AddDishPageRoute on GoRouteData {
  static AddDishPageRoute _fromState(GoRouterState state) =>
      const AddDishPageRoute();

  @override
  String get location => GoRouteData.$location('/add-dish');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}
