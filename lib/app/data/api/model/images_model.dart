import 'dart:convert';

List<ImagesModel> imagesModelFromJson(str) =>
    List<ImagesModel>.from(str.map((x) => ImagesModel.fromJson(x)));

String imagesModelToJson(List<ImagesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ImagesModel {
  ImagesModel({
    required this.id,
    required this.author,
    required this.width,
    required this.height,
    required this.url,
    required this.downloadUrl,
  });

  String id;
  String author;
  int width;
  int height;
  String url;
  String downloadUrl;

  factory ImagesModel.fromJson(Map<String, dynamic> json) => ImagesModel(
        id: json["id"],
        author: json["author"],
        width: json["width"],
        height: json["height"],
        url: json["url"],
        downloadUrl: json["download_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "author": author,
        "width": width,
        "height": height,
        "url": url,
        "download_url": downloadUrl,
      };
}
