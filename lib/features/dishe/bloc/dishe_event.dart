part of 'dishe_bloc.dart';

abstract class DisheEvent extends Equatable {}

class DisheNumberIncrement extends DisheEvent {
  @override
  List<Object?> get props => [];
}

class DisheNumberDecrement extends DisheEvent {
  @override
  List<Object?> get props => [];
}
