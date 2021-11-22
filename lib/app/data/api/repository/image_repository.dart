import 'package:swiggy_clone/app/data/api/model/breaking_bad_model.dart';
import 'package:swiggy_clone/app/data/api/provider/image_api_provider.dart';

class ImageRepository {
  final ImageApiProvider imageApiProvider;

  ImageRepository({required this.imageApiProvider});

  Future<List<BreakingBadModel>> getAll() async {
    return imageApiProvider.fetchAllCharacters();
  }
}
