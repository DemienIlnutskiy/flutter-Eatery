import 'dart:async';

import 'package:eatery/core/repositories/eatery_menu/eatery_menu.dart';
import 'package:eatery/core/repositories/eatery_menu/menu_repository_impl.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

part 'eatery_menu_event.dart';
part 'eatery_menu_state.dart';

class EateryMenuBloc extends Bloc<EateryMenuEvent, EateryMenuState> {
  EateryMenuBloc(this.menuRepository) : super(EateryMenuInitial()) {
    on<LoadDishesList>((event, emit) async {
      try {
        if (state is! DishesListLoaded) {
          emit(DishesListLoading());
        }
        final dishesList = await GetIt.I<MenuRepository>().getMenuDishes();
        if (dishesList == null) {
          emit(DishesListLoadingFailure(exception: 'null'));
        } else {
          emit(DishesListLoaded(dishesList: dishesList));
        }
      } catch (e) {
        emit(DishesListLoadingFailure(exception: e));
      } finally {
        event.completer?.complete();
      }
    });
    on<SearchDishesList>((event, emit) async {
      try {
        List<MenuDishe>? dishesList =
            await GetIt.I<MenuRepository>().getMenuDishes();
        if (event.search != '') {
          dishesList = dishesList
              ?.where((dishe) =>
                  dishe.name.toLowerCase().contains(event.search.toLowerCase()))
              .toList();
        }
        if (dishesList == null) {
          emit(DishesListLoadingFailure(exception: 'null'));
        } else {
          emit(DishesListLoaded(dishesList: dishesList));
        }
      } catch (e) {
        emit(DishesListLoaded(dishesList: const []));
      } finally {
        event.completer?.complete();
      }
    });
  }
  final MenuRepositoryImpl menuRepository;
}
