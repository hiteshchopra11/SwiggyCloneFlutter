import 'package:swiggy_clone/app/data/api/model/breaking_bad_model.dart';
import 'package:swiggy_clone/app/data/api/provider/base/base_provider.dart';

import '../api_constants.dart';

class ImageApiProvider extends BaseProvider {
  Future<List<BreakingBadModel>> fetchAllCharacters() async {
    List<BreakingBadModel> pokemon = <BreakingBadModel>[];
    final response = await get<List<BreakingBadModel>>(ApiConstants.foodCategoriesUrl,
        decoder: (body) {
      pokemon = breakingBadModelFromJson(body);
      return pokemon;
    });

    if (response.hasError) {
      throw Exception('Error');
    }
    return pokemon;
  }
}
