// ignore_for_file: avoid_unused_parameters
part of 'home_cubit.dart';

@freezed
sealed class HomeState with _$HomeState {
  const factory HomeState({
    required DateTime currentDay,
    @Default(false) bool isLoading,
    List<DishModel>? dishes,
    String? errorMessage,
  }) = _HomeState;
}
