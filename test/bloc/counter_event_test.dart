import 'package:eatery/features/dishe/bloc/dishe_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DisheEvent', () {
    group('DisheNumberIncrement', () {
      test('supports value equality', () {
        DisheNumberIncrement();
        DisheNumberIncrement();
      });
    });

    group('DisheNumberDecrement', () {
      test('supports value equality', () {
        DisheNumberDecrement();
        DisheNumberDecrement();
      });
    });
  });
}
