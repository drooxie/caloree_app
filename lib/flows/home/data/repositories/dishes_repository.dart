import 'dart:convert';

import 'package:caloree_app/flows/home/data/models/dish_model.dart';
import 'package:caloree_app/flows/home/domain/repositories/dishes_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable(as: DishesRepositoryI)
class DishesRepository implements DishesRepositoryI {
  static const _dishesKey = 'dishes';

  @override
  Future<List<DishModel>> getDishes() async {
    final sharedPreferences = await SharedPreferences.getInstance();

    final dishesJson = sharedPreferences.getStringList(_dishesKey);
    if (dishesJson == null) {
      return [];
    }

    final List<DishModel> decoded = dishesJson
        .map(
          (e) => DishModel.fromJson(
            json.decode(e) as Map<String, dynamic>,
          ),
        )
        .toList();

    return decoded;
  }

  @override
  Future<void> saveDishes(List<DishModel> dishes) async {
    final sharedPreferences = await SharedPreferences.getInstance();

    await sharedPreferences.setStringList(
      _dishesKey,
      dishes.map((e) {
        final jsonDish = e.toJson();
        final encodedDish = json.encode(jsonDish);

        return encodedDish;
      }).toList(),
    );
  }
}
