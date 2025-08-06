// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dish_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DishModel {

 String get title; int get calories; List<String> get ingredients; DateTime get dateAdded;
/// Create a copy of DishModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DishModelCopyWith<DishModel> get copyWith => _$DishModelCopyWithImpl<DishModel>(this as DishModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DishModel&&(identical(other.title, title) || other.title == title)&&(identical(other.calories, calories) || other.calories == calories)&&const DeepCollectionEquality().equals(other.ingredients, ingredients)&&(identical(other.dateAdded, dateAdded) || other.dateAdded == dateAdded));
}


@override
int get hashCode => Object.hash(runtimeType,title,calories,const DeepCollectionEquality().hash(ingredients),dateAdded);

@override
String toString() {
  return 'DishModel(title: $title, calories: $calories, ingredients: $ingredients, dateAdded: $dateAdded)';
}


}

/// @nodoc
abstract mixin class $DishModelCopyWith<$Res>  {
  factory $DishModelCopyWith(DishModel value, $Res Function(DishModel) _then) = _$DishModelCopyWithImpl;
@useResult
$Res call({
 String title, int calories, List<String> ingredients, DateTime dateAdded
});




}
/// @nodoc
class _$DishModelCopyWithImpl<$Res>
    implements $DishModelCopyWith<$Res> {
  _$DishModelCopyWithImpl(this._self, this._then);

  final DishModel _self;
  final $Res Function(DishModel) _then;

/// Create a copy of DishModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? calories = null,Object? ingredients = null,Object? dateAdded = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,calories: null == calories ? _self.calories : calories // ignore: cast_nullable_to_non_nullable
as int,ingredients: null == ingredients ? _self.ingredients : ingredients // ignore: cast_nullable_to_non_nullable
as List<String>,dateAdded: null == dateAdded ? _self.dateAdded : dateAdded // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// @nodoc


class _DishModel implements DishModel {
  const _DishModel({required this.title, required this.calories, required final  List<String> ingredients, required this.dateAdded}): _ingredients = ingredients;
  

@override final  String title;
@override final  int calories;
 final  List<String> _ingredients;
@override List<String> get ingredients {
  if (_ingredients is EqualUnmodifiableListView) return _ingredients;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ingredients);
}

@override final  DateTime dateAdded;

/// Create a copy of DishModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DishModelCopyWith<_DishModel> get copyWith => __$DishModelCopyWithImpl<_DishModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DishModel&&(identical(other.title, title) || other.title == title)&&(identical(other.calories, calories) || other.calories == calories)&&const DeepCollectionEquality().equals(other._ingredients, _ingredients)&&(identical(other.dateAdded, dateAdded) || other.dateAdded == dateAdded));
}


@override
int get hashCode => Object.hash(runtimeType,title,calories,const DeepCollectionEquality().hash(_ingredients),dateAdded);

@override
String toString() {
  return 'DishModel(title: $title, calories: $calories, ingredients: $ingredients, dateAdded: $dateAdded)';
}


}

/// @nodoc
abstract mixin class _$DishModelCopyWith<$Res> implements $DishModelCopyWith<$Res> {
  factory _$DishModelCopyWith(_DishModel value, $Res Function(_DishModel) _then) = __$DishModelCopyWithImpl;
@override @useResult
$Res call({
 String title, int calories, List<String> ingredients, DateTime dateAdded
});




}
/// @nodoc
class __$DishModelCopyWithImpl<$Res>
    implements _$DishModelCopyWith<$Res> {
  __$DishModelCopyWithImpl(this._self, this._then);

  final _DishModel _self;
  final $Res Function(_DishModel) _then;

/// Create a copy of DishModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? calories = null,Object? ingredients = null,Object? dateAdded = null,}) {
  return _then(_DishModel(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,calories: null == calories ? _self.calories : calories // ignore: cast_nullable_to_non_nullable
as int,ingredients: null == ingredients ? _self._ingredients : ingredients // ignore: cast_nullable_to_non_nullable
as List<String>,dateAdded: null == dateAdded ? _self.dateAdded : dateAdded // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
