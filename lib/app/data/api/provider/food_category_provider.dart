import 'package:swiggy_clone/app/data/api/model/food_categories_model.dart';

import '../api_constants.dart';
import 'base/base_provider.dart';

class FoodApiProvider extends BaseProvider {
  Future<FoodCategoriesModel?> fetchFoodCategories() async {
    final response = await get(ApiConstants.foodCategoriesUrl);
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return FoodCategoriesModel.fromJson(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
