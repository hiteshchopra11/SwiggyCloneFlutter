import 'package:get/get.dart';
import 'package:swiggy_clone/app/ui/landing/landing_controller.dart';

/* Bindings are classes where we can declare our
   dependencies and then ‘bind’ them to the routes. */
class LandingBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LandingController>(() => LandingController(
        foodRepository: Get.find(), imagesRepository: Get.find()));
  }
}
