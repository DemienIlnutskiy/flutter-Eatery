import 'package:bloc_test/bloc_test.dart';
import 'package:eatery/core/repositories/eatery_menu/menu_repository.dart';
import 'package:eatery/core/repositories/eatery_menu/models/menu_dishes.dart';
import 'package:eatery/features/eatery_menu/bloc/eatery_menu_bloc.dart';
import 'package:mockito/mockito.dart';
import 'package:get_it/get_it.dart';
import 'package:test/test.dart';

class MockMenuRepository extends Mock implements MenuRepository {}

void main() {
  final GetIt getIt = GetIt.instance;

  getIt.registerLazySingleton<MenuRepository>(() => MockMenuRepository());

  group('EateryMenuBloc', () {
    late EateryMenuBloc eateryMenuBloc;
    late MenuRepository menuRepository;
    setUp(() {
      menuRepository = getIt<MenuRepository>();
      eateryMenuBloc = EateryMenuBloc(menuRepository);
    });

    tearDown(() {
      eateryMenuBloc.close();
    });
    group('LoadDishesList', () {
      blocTest<EateryMenuBloc, EateryMenuState>(
        'emits [DishesListLoading, DishesListLoaded] when LoadDishesList is added',
        build: () {
          when(menuRepository.getMenuDishes()).thenAnswer((_) async => const [
                MenuDishe(
                  image: 'h',
                  name: 'dishe',
                  price: 80,
                  description: 'some dishe',
                  cookingTime: '30',
                  rank: '5',
                  number: 0,
                ),
              ]);
          return eateryMenuBloc;
        },
        act: (bloc) => bloc.add(LoadDishesList()),
        expect: () async => [
          isA<DishesListLoading>(),
          isA<DishesListLoaded>().having(
            (state) => state.dishesList,
            'dishesList',
            const [
              MenuDishe(
                image: 'h',
                name: 'dishe',
                price: 80,
                description: 'some dishe',
                cookingTime: '30',
                rank: '5',
                number: 0,
              ),
            ],
          ),
        ],
      );
      blocTest<EateryMenuBloc, EateryMenuState>(
        'emits [DishesListLoadingFailure] when LoadDishesList failure',
        build: () {
          when(menuRepository.getMenuDishes())
              .thenThrow(Exception('An error occurred'));
          return eateryMenuBloc;
        },
        act: (bloc) => bloc.add(LoadDishesList()),
        expect: () async => [
          isA<DishesListLoading>(),
          isA<DishesListLoadingFailure>(),
        ],
      );
    });
    group('SearchDishesList', () {
      blocTest<EateryMenuBloc, EateryMenuState>(
        'emits [DishesListLoading, DishesListLoaded] when SearchDishesList is added',
        build: () {
          when(menuRepository.getMenuDishes()).thenAnswer((_) async => const [
                MenuDishe(
                  image: 'dishe first',
                  name: 'dishe first',
                  price: 80,
                  description: 'some dishe 1',
                  cookingTime: '30',
                  rank: '5',
                  number: 0,
                ),
                MenuDishe(
                  image: 'dishe second',
                  name: 'dishe second',
                  price: 801,
                  description: 'some dishe 2',
                  cookingTime: '3',
                  rank: '3',
                  number: 1,
                ),
              ]);
          return eateryMenuBloc;
        },
        act: (bloc) => bloc.add(SearchDishesList(search: 'dishe s')),
        expect: () async => [
          isA<DishesListLoaded>().having(
            (state) => state.dishesList,
            'dishesList',
            const [
              MenuDishe(
                image: 'dishe second',
                name: 'dishe second',
                price: 801,
                description: 'some dishe 2',
                cookingTime: '3',
                rank: '3',
                number: 1,
              ),
            ],
          ),
        ],
      );
    });
  });
}
