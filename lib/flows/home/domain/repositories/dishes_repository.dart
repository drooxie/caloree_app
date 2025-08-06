import 'package:caloree_app/flows/home/data/models/dish_model.dart';

abstract interface class DishesRepositoryI {
  Future<List<DishModel>> getDishes();
  Future<void> saveDishes(List<DishModel> dishes);
}
