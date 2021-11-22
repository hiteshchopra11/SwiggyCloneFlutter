import 'package:get/get.dart';
import 'package:swiggy_clone/app/data/api/provider/food_category_provider.dart';
import 'package:swiggy_clone/app/data/api/repository/food_repository.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() async {
    Get.put(FoodApiProvider(), permanent: true);
    Get.put(FoodRepository(foodApiProvider: Get.find()), permanent: true);
  }
}
