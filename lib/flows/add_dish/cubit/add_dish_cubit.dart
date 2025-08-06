import 'dart:io';

import 'package:caloree_app/flows/home/data/models/dish_model.dart';
import 'package:caloree_app/flows/home/domain/repositories/dishes_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';

part 'add_dish_cubit.freezed.dart';
part 'add_dish_state.dart';

@injectable
class AddDishCubit extends Cubit<AddDishState> {
  AddDishCubit(this._dishesRepository) : super(const AddDishState());

  final DishesRepositoryI _dishesRepository;

  Future<void> getDishPhoto() async {
    try {
      final image = await ImagePicker().pickImage(
        source: ImageSource.camera,
        requestFullMetadata: false,
        imageQuality: 75,
      );
      if (image == null) {
        return;
      }

      final documentsPath = (await getApplicationDocumentsDirectory()).path;
      final imageBytes = await image.readAsBytes();

      final fileName = image.path.split('/').last;
      final filePath = '$documentsPath/$fileName';

      await File(filePath).writeAsBytes(imageBytes);

      print('File saved!');

      emit(state.copyWith(imagePath: filePath));
    } catch (e) {}
  }

  void setDishTitle(String title) {
    emit(state.copyWith(title: title));
  }

  void setDishCalories(double calories) {
    emit(state.copyWith(calories: calories));
  }

  void setDishIngredients(List<String> ingredients) {
    emit(state.copyWith(ingredients: ingredients));
  }

  Future<bool> saveDish() async {
    final dishes = await _dishesRepository.getDishes();

    final title = state.title;
    final calories = state.calories;
    final ingredients = state.ingredients;

    if (title == null) {
      emit(state.copyWith(error: 'Unable to add a dish without name'));

      return false;
    }

    dishes.add(
      DishModel(
        title: title,
        calories: calories.toInt(),
        ingredients: ingredients,
        dateAdded: DateTime.now(),
      ),
    );

    await _dishesRepository.saveDishes(dishes);

    return true;
  }
}
