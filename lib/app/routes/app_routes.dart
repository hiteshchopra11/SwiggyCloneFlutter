import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:swiggy_clone/app/ui/landing/landing_bindings.dart';
import 'package:swiggy_clone/app/ui/landing/landing_page.dart';
import 'package:swiggy_clone/app/ui/splash/splash_bindings.dart';
import 'package:swiggy_clone/app/ui/splash/splash_page.dart';

import 'app_pages.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashPage(),
      binding: SplashBindings(),
    ),
    GetPage(
      name: Routes.LANDING,
      page: () => LandingPage(),
      binding: LandingBindings(),
    )
  ];
}
