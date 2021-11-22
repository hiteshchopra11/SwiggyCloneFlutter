import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:swiggy_clone/app/ui/landing/landing_controller.dart';
import 'package:swiggy_clone/app/ui/landing/tabs/tabs.dart';

class LandingPage extends GetView<LandingController> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Obx(() => _buildWidget()),
    );
  }

  Widget _buildWidget() {
    return Scaffold(
      body: SafeArea(
          child: _buildContent(controller.currentTab.value, controller)),
      bottomNavigationBar: buildBottomNavigationBar(controller),
    );
  }
}

Container buildBottomNavigationBar(LandingController controller) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border(top: BorderSide(color: Colors.grey.shade200, width: 0.5)),
    ),
    child: BottomNavigationBar(
      unselectedItemColor: Colors.grey.shade700,
      selectedItemColor: Colors.redAccent,
      onTap: (index) => controller.switchTab(index),
      type: BottomNavigationBarType.fixed,
      selectedFontSize: 10.0,
      unselectedFontSize: 10.0,
      currentIndex: controller.getCurrentIndex(controller.currentTab.value),
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedLabelStyle:
          TextStyle(fontFamily: 'PromixaNovaCondBold', fontSize: 10.0),
      unselectedLabelStyle: TextStyle(
          fontFamily: 'PromixaNovaCondBold',
          fontSize: 10.0,
          color: Colors.grey),
      backgroundColor: Colors.white,
      elevation: 8,
      items: [
        _bottomNavigationBarItem(
          icon: FontAwesomeIcons.home,
          label: 'SWIGGY',
        ),
        _bottomNavigationBarItem(
          icon: FontAwesomeIcons.bowlingBall,
          label: 'FOOD',
        ),
        _bottomNavigationBarItem(
          icon: FontAwesomeIcons.shoppingBasket,
          label: 'INSTAMART',
        ),
        _bottomNavigationBarItem(
          icon: FontAwesomeIcons.search,
          label: 'SEARCH',
        ),
        _bottomNavigationBarItem(
          icon: FontAwesomeIcons.snowman,
          label: 'ACCOUNT',
        ),
      ],
    ),
  );
}

_bottomNavigationBarItem({required IconData icon, required String label}) {
  return BottomNavigationBarItem(
    tooltip: '',
    icon: Padding(
      padding: const EdgeInsets.all(4.0),
      child: Icon(icon),
    ),
    label: label,
  );
}

Widget _buildContent(MainTabs tab, LandingController controller) {
  switch (tab) {
    case MainTabs.home:
      return controller.homeTab;
    case MainTabs.food:
      return controller.foodTab;
    case MainTabs.instaMart:
      return controller.instaMartTab;
    case MainTabs.search:
      return controller.searchTab;
    case MainTabs.account:
      return controller.accountTab;
    default:
      return controller.homeTab;
  }
}
