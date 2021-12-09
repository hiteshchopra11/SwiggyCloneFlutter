import 'package:get/get.dart';
import 'package:swiggy_clone/app/data/api/provider/food_category_provider.dart';
import 'package:swiggy_clone/app/data/api/provider/image_api_provider.dart';
import 'package:swiggy_clone/app/data/api/repository/food_repository.dart';

import 'app/data/api/repository/image_repository.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() async {
    Get.put(FoodApiProvider(), permanent: true);
    Get.put(FoodRepository(foodApiProvider: Get.find()), permanent: true);
    Get.put(ImageApiProvider(), permanent: true);
    Get.put(ImageRepository(imageApiProvider: Get.find()), permanent: true);
  }
}
