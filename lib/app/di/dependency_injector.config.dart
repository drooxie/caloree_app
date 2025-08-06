// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:caloree_app/flows/add_dish/cubit/add_dish_cubit.dart' as _i154;
import 'package:caloree_app/flows/home/cubit/home_cubit.dart' as _i389;
import 'package:caloree_app/flows/home/data/repositories/dishes_repository.dart'
    as _i1063;
import 'package:caloree_app/flows/home/domain/repositories/dishes_repository.dart'
    as _i371;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i154.AddDishCubit>(() => _i154.AddDishCubit());
    gh.factory<_i371.DishesRepositoryI>(() => _i1063.DishesRepository());
    gh.factory<_i389.HomeCubit>(
      () => _i389.HomeCubit(gh<_i371.DishesRepositoryI>()),
    );
    return this;
  }
}
