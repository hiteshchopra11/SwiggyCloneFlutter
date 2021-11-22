import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:swiggy_clone/app/data/api/model/breaking_bad_model.dart';
import 'package:swiggy_clone/app/data/api/model/food_categories_model.dart';
import 'package:swiggy_clone/app/data/api/repository/food_repository.dart';
import 'package:swiggy_clone/app/ui/landing/tabs/account_tab.dart';
import 'package:swiggy_clone/app/ui/landing/tabs/food_tab.dart';
import 'package:swiggy_clone/app/ui/landing/tabs/home_tab.dart';
import 'package:swiggy_clone/app/ui/landing/tabs/insta_mart_tab.dart';
import 'package:swiggy_clone/app/ui/landing/tabs/search_tab.dart';

import 'tabs/tabs.dart';

class LandingController extends GetxController {
  // var tabIndex = 0;
  //
  // void changeTabIndex(int index) {
  //   tabIndex = index;
  //   update();
  // }
  // final ImageRepository apiRepository;
  final FoodRepository foodRepository;

  LandingController({required this.foodRepository});

  var currentTab = MainTabs.home.obs;
  var images = Rxn<List<BreakingBadModel>>();
  var foodCategories = Rxn<FoodCategoriesModel>();

  late HomeTab homeTab;
  late FoodTab foodTab;
  late InstaMartTab instaMartTab;
  late SearchTab searchTab;
  late AccountTab accountTab;

  @override
  void onInit() async {
    super.onInit();

    homeTab = HomeTab();
    // loadImages();
    loadFoodCategories();
    foodTab = FoodTab();
    instaMartTab = InstaMartTab();
    searchTab = SearchTab();
    accountTab = AccountTab();
  }

  // Future<void> loadImages() async {
  //   var _users = await apiRepository.getAll();
  //   if (_users.length != 0) {
  //     images.value = _users;
  //     images.refresh();
  //   } else {
  //     Fluttertoast().printError();
  //   }
  // }

  Future<void> loadFoodCategories() async {
    var _users = await foodRepository.getFoodCategories();
    if (_users?.categories.length != 0) {
      foodCategories.value = _users;
      foodCategories.refresh();
    } else {
      Fluttertoast().printError();
    }
  }

  void switchTab(index) {
    var tab = _getCurrentTab(index);
    currentTab.value = tab;
  }

  int getCurrentIndex(MainTabs tab) {
    switch (tab) {
      case MainTabs.home:
        return 0;
      case MainTabs.food:
        return 1;
      case MainTabs.instaMart:
        return 2;
      case MainTabs.search:
        return 3;
      case MainTabs.account:
        return 4;
      default:
        return 0;
    }
  }

  MainTabs _getCurrentTab(int index) {
    switch (index) {
      case 0:
        return MainTabs.home;
      case 1:
        return MainTabs.food;
      case 2:
        return MainTabs.instaMart;
      case 3:
        return MainTabs.search;
      case 4:
        return MainTabs.account;
      default:
        return MainTabs.home;
    }
  }
}
