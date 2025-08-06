part of 'add_dish_cubit.dart';

@freezed
sealed class AddDishState with _$AddDishState {
  const factory AddDishState({
    @Default([]) List<String> ingredients,
    @Default(0) double calories,
    @Default(true) bool isCameraShowing,
    String? imagePath,
    String? title,
    String? error,
  }) = _AddDishState;
}
