import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eatery/core/repositories/eatery_menu/menu_repository_impl.dart';
import 'package:eatery/core/repositories/eatery_menu/models/menu_dishes.dart';
import 'package:get/get.dart';

class MenuRepository implements MenuRepositoryImpl {
  static MenuRepository get instance => Get.find();

  final FirebaseFirestore firebase = FirebaseFirestore.instance;
  @override
  Future<List<MenuDishe>>? getMenuDishes() async {
    try {
      final snaphot = await firebase.collection('Menu').get();
      final dishesData =
          snaphot.docs.map((e) => MenuDishe.fromSnapshot(e)).toList();
      return dishesData;
    } catch (e) {
      return [];
    }
  }
}
