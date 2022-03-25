import 'package:breaking_bad_app/models/base_models/base_model.dart';

class Character extends BaseModel {
  final int? id;
  final String? name;
  final String? birthday;
  final String? img;
  final String? nickname;
  final List<dynamic>? appearance;

  Character({
    this.id,
    this.name,
    this.birthday,
    this.img,
    this.nickname,
    this.appearance,
  });

  factory Character.fromJson(Map<String, dynamic> json) => Character(
        id: json["char_id"],
        name: json["name"],
        birthday: json["birthday"],
        img: json["img"],
        nickname: json["nickname"],
        appearance: json["appearance"],
      );

  @override
  Map<String, dynamic> toJson() => {
        "char_id": id,
        "name": name,
        "birthday": birthday,
        "img": img,
        "nickname": nickname,
        "appearance": appearance,
      };

  @override
  fromJson(Map<String, dynamic> json) {
    return Character.fromJson(json);
  }
}
