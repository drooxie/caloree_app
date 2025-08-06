// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dish_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DishModel _$DishModelFromJson(Map<String, dynamic> json) => _DishModel(
  title: json['title'] as String,
  imagePath: json['imagePath'] as String,
  calories: (json['calories'] as num).toInt(),
  ingredients: (json['ingredients'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  dateAdded: DateTime.parse(json['dateAdded'] as String),
);

Map<String, dynamic> _$DishModelToJson(_DishModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'imagePath': instance.imagePath,
      'calories': instance.calories,
      'ingredients': instance.ingredients,
      'dateAdded': instance.dateAdded.toIso8601String(),
    };
