// To parse this JSON data, do
//
//     final breakingBadModel = breakingBadModelFromJson(jsonString);

import 'dart:convert';

List<BreakingBadModel> breakingBadModelFromJson(str) =>
    List<BreakingBadModel>.from(str.map((x) => BreakingBadModel.fromJson(x)));

String breakingBadModelToJson(List<BreakingBadModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BreakingBadModel {
  BreakingBadModel({
    required this.charId,
    required this.name,
    required this.img,
    required this.nickname,
    required this.portrayed,
  });

  int charId;
  String name;
  String img;
  String nickname;
  String portrayed;

  factory BreakingBadModel.fromJson(Map<String, dynamic> json) =>
      BreakingBadModel(
        charId: json["char_id"],
        name: json["name"],
        img: json["img"],
        nickname: json["nickname"],
        portrayed: json["portrayed"],
      );

  Map<String, dynamic> toJson() => {
        "char_id": charId,
        "name": name,
        "img": img,
        "nickname": nickname,
        "portrayed": portrayed,
      };
}
