import 'package:swiggy_clone/app/data/api/model/images_model.dart';
import 'package:swiggy_clone/app/data/api/provider/base/base_provider.dart';

import '../api_constants.dart';

class ImageApiProvider extends BaseProvider {
  Future<List<ImagesModel>?> fetchAllImages() async {
    final response = await get(ApiConstants.imagesUrl);
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return imagesModelFromJson(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
