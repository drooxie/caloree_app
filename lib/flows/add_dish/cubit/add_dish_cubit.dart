import 'dart:io';

import 'package:caloree_app/flows/home/data/models/dish_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';

part 'add_dish_cubit.freezed.dart';
part 'add_dish_state.dart';

@injectable
class AddDishCubit extends Cubit<AddDishState> {
  AddDishCubit() : super(const AddDishState());

  bool get canAddDish =>
      state.title != null &&
      state.imagePath != null &&
      state.calories != 0 &&
      state.ingredients.isNotEmpty;

  Future<void> getDishPhoto() async {
    try {
      emit(state.copyWith(isCameraShowing: true));

      final image = await ImagePicker().pickImage(
        source: ImageSource.camera,
        requestFullMetadata: false,
        imageQuality: 25,
      );

      if (image == null) {
        emit(state.copyWith(isCameraShowing: false));

        return;
      }

      final documentsPath = (await getApplicationDocumentsDirectory()).path;
      final imageBytes = await image.readAsBytes();

      final fileName = image.path.split('/').last;
      final filePath = '$documentsPath/$fileName';

      await File(filePath).writeAsBytes(imageBytes);

      emit(
        state.copyWith(
          imagePath: filePath,
          isCameraShowing: false,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          error: 'Error happened during the photo: $e',
          isCameraShowing: false,
        ),
      );
    }
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

  DishModel? getCompleteDish() {
    final title = state.title;
    final calories = state.calories;
    final imagePath = state.imagePath;
    final ingredients = state.ingredients;

    if (!canAddDish || title == null || imagePath == null) {
      emit(state.copyWith(error: 'Unable to add incomplete dish'));

      return null;
    }

    return DishModel(
      title: title,
      imagePath: imagePath,
      calories: calories.toInt(),
      ingredients: ingredients,
      dateAdded: DateTime.now(),
    );
  }
}
