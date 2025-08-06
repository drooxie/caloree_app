import 'package:caloree_app/flows/home/data/models/dish_model.dart';
import 'package:caloree_app/flows/home/domain/repositories/dishes_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: DishesRepositoryI)
class DishesRepository implements DishesRepositoryI {
  @override
  Future<List<DishModel>> getDishes() async {
    return [];
  }

  @override
  Future<void> saveDishes(List<DishModel> dishes) async {
    throw UnimplementedError();
  }
}
