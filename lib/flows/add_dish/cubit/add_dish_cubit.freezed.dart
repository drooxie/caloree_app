// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_dish_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AddDishState {

 List<String> get ingredients; double get calories; bool get isCameraShowing; String? get imagePath; String? get title; String? get error;
/// Create a copy of AddDishState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddDishStateCopyWith<AddDishState> get copyWith => _$AddDishStateCopyWithImpl<AddDishState>(this as AddDishState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddDishState&&const DeepCollectionEquality().equals(other.ingredients, ingredients)&&(identical(other.calories, calories) || other.calories == calories)&&(identical(other.isCameraShowing, isCameraShowing) || other.isCameraShowing == isCameraShowing)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.title, title) || other.title == title)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(ingredients),calories,isCameraShowing,imagePath,title,error);

@override
String toString() {
  return 'AddDishState(ingredients: $ingredients, calories: $calories, isCameraShowing: $isCameraShowing, imagePath: $imagePath, title: $title, error: $error)';
}


}

/// @nodoc
abstract mixin class $AddDishStateCopyWith<$Res>  {
  factory $AddDishStateCopyWith(AddDishState value, $Res Function(AddDishState) _then) = _$AddDishStateCopyWithImpl;
@useResult
$Res call({
 List<String> ingredients, double calories, bool isCameraShowing, String? imagePath, String? title, String? error
});




}
/// @nodoc
class _$AddDishStateCopyWithImpl<$Res>
    implements $AddDishStateCopyWith<$Res> {
  _$AddDishStateCopyWithImpl(this._self, this._then);

  final AddDishState _self;
  final $Res Function(AddDishState) _then;

/// Create a copy of AddDishState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ingredients = null,Object? calories = null,Object? isCameraShowing = null,Object? imagePath = freezed,Object? title = freezed,Object? error = freezed,}) {
  return _then(_self.copyWith(
ingredients: null == ingredients ? _self.ingredients : ingredients // ignore: cast_nullable_to_non_nullable
as List<String>,calories: null == calories ? _self.calories : calories // ignore: cast_nullable_to_non_nullable
as double,isCameraShowing: null == isCameraShowing ? _self.isCameraShowing : isCameraShowing // ignore: cast_nullable_to_non_nullable
as bool,imagePath: freezed == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc


class _AddDishState implements AddDishState {
  const _AddDishState({final  List<String> ingredients = const [], this.calories = 0, this.isCameraShowing = true, this.imagePath, this.title, this.error}): _ingredients = ingredients;
  

 final  List<String> _ingredients;
@override@JsonKey() List<String> get ingredients {
  if (_ingredients is EqualUnmodifiableListView) return _ingredients;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ingredients);
}

@override@JsonKey() final  double calories;
@override@JsonKey() final  bool isCameraShowing;
@override final  String? imagePath;
@override final  String? title;
@override final  String? error;

/// Create a copy of AddDishState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddDishStateCopyWith<_AddDishState> get copyWith => __$AddDishStateCopyWithImpl<_AddDishState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddDishState&&const DeepCollectionEquality().equals(other._ingredients, _ingredients)&&(identical(other.calories, calories) || other.calories == calories)&&(identical(other.isCameraShowing, isCameraShowing) || other.isCameraShowing == isCameraShowing)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.title, title) || other.title == title)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_ingredients),calories,isCameraShowing,imagePath,title,error);

@override
String toString() {
  return 'AddDishState(ingredients: $ingredients, calories: $calories, isCameraShowing: $isCameraShowing, imagePath: $imagePath, title: $title, error: $error)';
}


}

/// @nodoc
abstract mixin class _$AddDishStateCopyWith<$Res> implements $AddDishStateCopyWith<$Res> {
  factory _$AddDishStateCopyWith(_AddDishState value, $Res Function(_AddDishState) _then) = __$AddDishStateCopyWithImpl;
@override @useResult
$Res call({
 List<String> ingredients, double calories, bool isCameraShowing, String? imagePath, String? title, String? error
});




}
/// @nodoc
class __$AddDishStateCopyWithImpl<$Res>
    implements _$AddDishStateCopyWith<$Res> {
  __$AddDishStateCopyWithImpl(this._self, this._then);

  final _AddDishState _self;
  final $Res Function(_AddDishState) _then;

/// Create a copy of AddDishState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ingredients = null,Object? calories = null,Object? isCameraShowing = null,Object? imagePath = freezed,Object? title = freezed,Object? error = freezed,}) {
  return _then(_AddDishState(
ingredients: null == ingredients ? _self._ingredients : ingredients // ignore: cast_nullable_to_non_nullable
as List<String>,calories: null == calories ? _self.calories : calories // ignore: cast_nullable_to_non_nullable
as double,isCameraShowing: null == isCameraShowing ? _self.isCameraShowing : isCameraShowing // ignore: cast_nullable_to_non_nullable
as bool,imagePath: freezed == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
