import 'package:get/get.dart';
import 'package:swiggy_clone/app/ui/splash/splash_controller.dart';

class SplashBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());
  }
}
