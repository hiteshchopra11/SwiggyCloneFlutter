import 'package:swiggy_clone/app/data/api/model/food_categories_model.dart';
import 'package:swiggy_clone/app/data/api/provider/food_category_provider.dart';

class FoodRepository {
  final FoodApiProvider foodApiProvider;

  FoodRepository({required this.foodApiProvider});

  Future<FoodCategoriesModel?> getFoodCategories() async {
    return foodApiProvider.fetchFoodCategories();
  }
}