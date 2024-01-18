part of 'eatery_menu_bloc.dart';

abstract class EateryMenuEvent extends Equatable {}

class LoadDishesList extends EateryMenuEvent {
  LoadDishesList({this.completer});
  final Completer? completer;
  @override
  List<Object?> get props => [completer];
}

class SearchDishesList extends EateryMenuEvent {
  SearchDishesList({required this.search, this.completer});
  final Completer? completer;
  final String search;
  @override
  List<Object?> get props => [completer];
}
