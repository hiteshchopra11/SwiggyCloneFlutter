import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:swiggy_clone/app/data/api/model/food_categories_model.dart';
import 'package:swiggy_clone/app/shared/constants/colors.dart';
import 'package:swiggy_clone/app/ui/landing/landing_controller.dart';
import 'package:swiggy_clone/app/ui/widgets/bottom_bordered_container.dart';
import 'package:swiggy_clone/app/ui/widgets/wrap_text_with_padding.dart';

class HomeTab extends GetView<LandingController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => RefreshIndicator(
          onRefresh: () => controller.loadFoodCategories(),
          child: BottomBorderedContainer(
            child: Container(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 8),
              child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    fixedTopAppBar(),
                    foodCategories(),
                    instaMartCard(),
                    Expanded(flex: 1, child: Text(""))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget foodCategories() {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: data!.length,
        itemBuilder: (context, position) {
          return Card(
            child: Container(
              padding: const EdgeInsets.all(8.0),
              height: 100,
              width: 150,
              child: Column(
                children: [
                  Container(
                    height: 100,
                    child: Image(
                      image: NetworkImage(data![position].strCategoryThumb),
                    ),
                  ),
                  Text(data![position].strCategory,
                      style: TextStyle(
                          fontSize: 16, fontFamily: 'PromixaNovaMedium'),
                      textAlign: TextAlign.start)
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget fixedTopAppBar() {
    return Row(
      children: [
        destinationAndAddressButton(),
        offersButton(),
      ],
    );
  }

  Widget destinationAndAddressButton() {
    return InkWell(
      onTap: () {
        print("Tapped on container");
      },
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            destinationName(),
            addressName(),
          ],
        ),
      ),
    );
  }

  Widget offersButton() {
    return Expanded(
      child: WrapTextWithPadding(
        child: InkWell(
          onTap: () {
            print("Tapped on container");
          },
          child: Container(
            padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Image.asset(
                  'assets/images/ic_offers_icon.png',
                  width: 30,
                  height: 30,
                ),
                SizedBox(width: 4),
                Text(
                  "Offers",
                  style: TextStyle(
                      fontSize: 18, letterSpacing: 0.3, fontFamily: 'NeueBold'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget addressName() {
    return WrapTextWithPadding(
      child: Text(
        "Street No. 4, Vedant Nagar, Moga",
        style: TextStyle(
            letterSpacing: 0.3, fontSize: 14, fontFamily: 'PromixaRegular'),
      ),
    );
  }

  Widget destinationName() {
    return Row(children: [
      Icon(CupertinoIcons.location),
      WrapTextWithPadding(
        child: Text(
          "Hitesh's Home",
          style: TextStyle(fontSize: 22),
        ),
      ),
    ]);
  }

  Widget instaMartCard() {
    return SizedBox(
      height: 230,
      child: Container(
        margin: EdgeInsets.fromLTRB(4.0, 16.0, 4.0, 4.0),
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            gradient: LinearGradient(
                colors: [hexToColor("#dd5e89"), hexToColor("#f7bb97")],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
        child: Stack(children: <Widget>[
          Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text("Instamart",
                    style: TextStyle(
                        letterSpacing: 0.3,
                        fontSize: 20,
                        color: hexToColor("#FFFFFF"),
                        fontFamily: 'NeueBold')),
                Spacer(),
                Text("Late Night\nCravings?",
                    style: TextStyle(
                        letterSpacing: 0.3,
                        fontSize: 30,
                        color: hexToColor("#FFFFFF"),
                        fontFamily: 'PromixaNovaMedium')),
                Spacer(),
                Text("Get 40% OFF on munchies\nDelivered in 15-30 mins.",
                    style: TextStyle(
                        letterSpacing: 0.3,
                        fontSize: 16,
                        color: hexToColor("#FFFFFF"),
                        fontFamily: 'PromixaNovaMedium')),
                Spacer(),
                Card(
                    elevation: 4.0,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
                      child: Container(
                        child: Text("Shop Now",
                            style: TextStyle(
                                letterSpacing: 0.3,
                                fontSize: 16,
                                color: hexToColor("#000000"),
                                fontFamily: 'PromixaNovaMedium')),
                      ),
                    ))
              ],
            ),
          ),
          Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(50, 50, 0, 0),
                child: Image.asset(
                  "assets/images/food.png",
                  height: 300,
                  width: 100,
                ),
              )),
          Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 10.0, 0, 0),
                child: Container(
                  transform: Matrix4.translationValues(-10, 10, -20),
                  child: Text("*T&C Apply",
                      style: TextStyle(
                          fontSize: 8,
                          color: hexToColor("#808080"),
                          fontFamily: 'PromixaNovaMedium')),
                ),
              )),
          Align(
              alignment: Alignment.topRight,
              child: Container(
                transform: Matrix4.translationValues(20, -35, 0),
                child: Card(
                    color: hexToColor("#FFD1DC"),
                    elevation: 10.0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("FREE\nDelivery"),
                    )),
              ))
        ]),
      ),
    );
  }

  List<Category>? get data {
    return controller.foodCategories.value?.categories;
  }
}
