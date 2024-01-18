import 'package:eatery/core/event/event.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'dishe_event.dart';

class DisheBloc extends Bloc<DisheEvent, int> {
  DisheBloc() : super(1) {
    //Ініціалізація Event зменшення кількості замовляймих порцій на одну якщо вони не дорівнюють одиниці
    on<DisheNumberDecrement>((event, emit) {
      emit(Counter.decrement(state));
    });
    //Ініціалізація Event збільшення кількості замовляймих порцій на одну
    on<DisheNumberIncrement>((event, emit) {
      emit(Counter.increment(state));
    });
  }
}
