import 'package:caloree_app/flows/home/data/models/dish_model.dart';
import 'package:caloree_app/flows/home/domain/repositories/dishes_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'home_cubit.freezed.dart';
part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._dishesRepository)
    : super(
        HomeState(currentDay: DateTime.now()),
      );

  final DishesRepositoryI _dishesRepository;

  List<DishModel>? get todayDishes => state.dishes
      ?.where(
        (dish) => DateUtils.isSameDay(
          state.currentDay,
          dish.dateAdded,
        ),
      )
      .toList();

  int? get todayCalories {
    final todayDishes = this.todayDishes;
    if (todayDishes == null) return null;

    final todayCalories = todayDishes
        .map((dish) => dish.calories)
        .fold(0.0, (previousValue, element) => previousValue + element);

    return todayCalories.toInt();
  }

  Future<void> loadHomeData() async {
    try {
      final dishes = await _dishesRepository.getDishes();
      emit(state.copyWith(dishes: dishes));
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }

  Future<void> addNewDish(DishModel dish) async {
    final dishes = state.dishes;
    if (state.isLoading || dishes == null) return;

    final updatedDishes = List<DishModel>.from(dishes);
    updatedDishes.add(dish);

    try {
      emit(state.copyWith(dishes: updatedDishes));
      await _dishesRepository.saveDishes(updatedDishes);
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }

  Future<void> goToNextDay() async {
    emit(
      state.copyWith(
        currentDay: state.currentDay.add(const Duration(days: 1)),
      ),
    );
  }

  Future<void> goToPreviousDay() async {
    emit(
      state.copyWith(
        currentDay: state.currentDay.subtract(const Duration(days: 1)),
      ),
    );
  }
}
