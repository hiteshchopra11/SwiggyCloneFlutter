import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:swiggy_clone/app/data/api/model/food_categories_model.dart';
import 'package:swiggy_clone/app/data/api/model/images_model.dart';
import 'package:swiggy_clone/app/shared/constants/colors.dart';
import 'package:swiggy_clone/app/ui/landing/landing_controller.dart';
import 'package:swiggy_clone/app/ui/widgets/bottom_bordered_container.dart';
import 'package:swiggy_clone/app/ui/widgets/wrap_text_with_padding.dart';

class HomeTab extends GetView<LandingController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: fixedTopAppBar(),
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      resizeToAvoidBottomInset: false,
      body: Obx(
        () => RefreshIndicator(
          onRefresh: () => controller.loadFoodCategories(),
          child: BottomBorderedContainer(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: (foodData != null && imagesData != null)
                  ? ListView(
                      children: [
                        foodCategories(),
                        instaMartCard(),
                        topPicksForYou(),
                        restaurants(),
                      ],
                    )
                  : Center(child: CircularProgressIndicator()),
            ),
          ),
        ),
      ),
    );
  }

  Widget topPicksForYou() {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset(
              'assets/images/like.png',
              width: 30,
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
              child: Text(
                "Top Picks for You",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget foodCategories() {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: foodData!.length,
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
                      image: NetworkImage(foodData![position].strCategoryThumb),
                    ),
                  ),
                  Text(foodData![position].strCategory,
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

  Widget restaurants() {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: foodData!.length,
        itemBuilder: (context, position) {
          return Card(
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 130,
                    child: Image(
                      image: NetworkImage(imagesData![position].downloadUrl),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(imagesData![position].author,
                        style: TextStyle(
                            fontSize: 16, fontFamily: 'PromixaNovaMedium'),
                        textAlign: TextAlign.left),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(4.0, 12.0, 0, 0),
                            child: Image.asset(
                              'assets/images/star.png',
                              width: 20,
                              height: 20,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("4.4  Ratings\t\t 28 mins"),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Free Delivery",
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: 16,
                                fontFamily: 'PromixaNovaMedium'),
                            textAlign: TextAlign.left),
                      )
                    ],
                  )
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
                  color: Colors.black,
                ),
                SizedBox(width: 4),
                Text(
                  "Offers",
                  style: TextStyle(
                      fontSize: 18,
                      letterSpacing: 0.3,
                      fontFamily: 'NeueBold',
                      color: Colors.black),
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
            letterSpacing: 0.3,
            fontSize: 14,
            fontFamily: 'PromixaRegular',
            color: Colors.black),
      ),
    );
  }

  Widget destinationName() {
    return Row(children: [
      Icon(
        CupertinoIcons.location,
        color: Colors.black,
      ),
      WrapTextWithPadding(
        child: Text(
          "Hitesh's Home",
          style: TextStyle(fontSize: 22, color: Colors.black),
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

  List<Category>? get foodData {
    return controller.foodCategories.value?.categories;
  }

  List<ImagesModel>? get imagesData {
    return controller.images.value;
  }
}
