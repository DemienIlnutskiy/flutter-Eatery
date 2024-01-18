import 'models/models.dart';

abstract class MenuRepositoryImpl {
  Future<List<MenuDishe>>? getMenuDishes();
}
