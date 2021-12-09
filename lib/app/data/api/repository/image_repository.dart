import 'package:swiggy_clone/app/data/api/model/images_model.dart';
import 'package:swiggy_clone/app/data/api/provider/image_api_provider.dart';

class ImageRepository {
  final ImageApiProvider imageApiProvider;

  ImageRepository({required this.imageApiProvider});

  Future<List<ImagesModel>?> getAll() async {
    return imageApiProvider.fetchAllImages();
  }
}
