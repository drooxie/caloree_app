// ignore_for_file: prefer_match_file_name

import 'package:caloree_app/app/di/dependency_injector.dart';
import 'package:caloree_app/app/router/router.dart';
import 'package:caloree_app/app/style/app_theme.dart';
import 'package:caloree_app/flows/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  configureDependencies();

  runApp(const CaloreeApp());
}

class CaloreeApp extends StatelessWidget {
  const CaloreeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<HomeCubit>(),
      child: MaterialApp.router(
        routerConfig: router,
        theme: AppTheme().dark,
      ),
    );
  }
}
