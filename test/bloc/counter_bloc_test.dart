import 'package:bloc_test/bloc_test.dart';
import 'package:eatery/features/dishe/bloc/dishe_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DisheBloc', () {
    setUp(() {});

    DisheBloc buildBloc() {
      return DisheBloc();
    }

    group('constructor', () {
      test('work properly', () {
        expect(buildBloc, returnsNormally);
      });

      test('has correct initial state', () {
        expect(buildBloc().state, equals(1));
      });
    });
    group('DisheNumberIncrement', () {
      blocTest('emits when the user taps the incerement button',
          build: () => DisheBloc(),
          act: (bloc) => bloc.add(DisheNumberIncrement()),
          expect: () => [2]);
      blocTest(
          'emits when the user taps the incerement button twice, increases the value by 3',
          build: () => DisheBloc(),
          act: (bloc) => bloc
            ..add(DisheNumberIncrement())
            ..add(DisheNumberIncrement()),
          expect: () => [2, 3]);
    });
    group('DisheNumberDecrement', () {
      blocTest('emits when the user taps the decerement button',
          build: () => DisheBloc(),
          act: (bloc) => bloc.add(DisheNumberDecrement()),
          expect: () => [1]);
      blocTest(
          'emits when the user taps the decerement button twice, increases the value by 1',
          build: () => DisheBloc(),
          act: (bloc) => bloc
            ..add(DisheNumberDecrement())
            ..add(DisheNumberDecrement()),
          expect: () => [1]);
    });
  });
}
