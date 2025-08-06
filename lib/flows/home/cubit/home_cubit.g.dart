// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HomeState _$HomeStateFromJson(Map<String, dynamic> json) => _HomeState(
  currentDay: DateTime.parse(json['currentDay'] as String),
  isLoading: json['isLoading'] as bool? ?? false,
  dishes: (json['dishes'] as List<dynamic>?)
      ?.map((e) => DishModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  errorMessage: json['errorMessage'] as String?,
);

Map<String, dynamic> _$HomeStateToJson(_HomeState instance) =>
    <String, dynamic>{
      'currentDay': instance.currentDay.toIso8601String(),
      'isLoading': instance.isLoading,
      'dishes': instance.dishes,
      'errorMessage': instance.errorMessage,
    };
