part of 'eatery_menu_bloc.dart';

abstract class EateryMenuState extends Equatable {}

class EateryMenuInitial extends EateryMenuState {
  @override
  List<Object?> get props => [];
}

class DishesListLoading extends EateryMenuState {
  @override
  List<Object?> get props => [];
}

class DishesListLoaded extends EateryMenuState {
  DishesListLoaded({required this.dishesList});
  final List<MenuDishe> dishesList;
  @override
  List<Object?> get props => [dishesList];
}

class DishesListLoadingFailure extends EateryMenuState {
  DishesListLoadingFailure({this.exception});

  final Object? exception;

  @override
  List<Object?> get props => [exception];
}
