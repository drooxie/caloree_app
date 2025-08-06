// ignore_for_file: avoid_unused_parameters
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dish_model.freezed.dart';
part 'dish_model.g.dart';

@freezed
sealed class DishModel with _$DishModel {
  const factory DishModel({
    required String title,
    required String imagePath,
    required int calories,
    required List<String> ingredients,
    required DateTime dateAdded,
  }) = _DishModel;

  factory DishModel.fromJson(Map<String, dynamic> json) =>
      _$DishModelFromJson(json);
}
