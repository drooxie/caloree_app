import 'dart:io';

import 'package:caloree_app/app/di/dependency_injector.dart';
import 'package:caloree_app/app/router/routes.dart';
import 'package:caloree_app/flows/add_dish/cubit/add_dish_cubit.dart';
import 'package:caloree_app/flows/add_dish/presentation/widgets/ingredients_selector.dart';
import 'package:caloree_app/shared_widgets/app_button.dart';
import 'package:caloree_app/shared_widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddDishPage extends StatefulWidget {
  const AddDishPage({super.key});

  @override
  State<AddDishPage> createState() => _AddDishPageState();
}

class _AddDishPageState extends State<AddDishPage> {
  late final _cubit = getIt<AddDishCubit>();

  @override
  void initState() {
    super.initState();

    Future.delayed(
      const Duration(seconds: 2),
      _cubit.getDishPhoto,
    );
  }

  void _errorListener(BuildContext context, AddDishState state) {
    final error = state.error;

    if (error != null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(
        SnackBar(
          content: Text(error),
        ),
      );
    }
  }

  Future<void> _onAddPressed() async {
    final isSaved = await _cubit.saveDish();

    if (mounted && isSaved) {
      const HomePageRoute().go(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<AddDishCubit, AddDishState>(
          listener: _errorListener,
          bloc: _cubit,
          builder: (_, state) {
            final imagePath = state.imagePath;

            if (imagePath == null) {
              return const Center(child: CircularProgressIndicator());
            }

            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 300,
                    child: Image.file(
                      File(imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 32,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Title',
                          style: TextTheme.of(context).titleLarge,
                        ),
                        const SizedBox(height: 12),
                        AppTextField(
                          onChanged: _cubit.setDishTitle,
                          hint: "What's the dish?",
                        ),

                        const SizedBox(height: 32),

                        Text(
                          'Calories',
                          style: TextTheme.of(context).titleLarge,
                        ),
                        Align(
                          child: Text(
                            state.calories.toStringAsFixed(0),
                            textAlign: TextAlign.center,
                            style: TextTheme.of(context).titleLarge,
                          ),
                        ),

                        Slider(
                          max: 1000,
                          value: state.calories,
                          onChanged: _cubit.setDishCalories,
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 32),
                          child: IngredientsSelector(
                            onSelectedIngredientsChanged:
                                _cubit.setDishIngredients,
                          ),
                        ),

                        Align(
                          alignment: Alignment.bottomCenter,
                          child: AppButton(
                            text: 'Add',
                            leadingIcon: const Icon(Icons.add),
                            onPressed:
                                state.title == null || state.ingredients.isEmpty
                                ? null
                                : _onAddPressed,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }
}
