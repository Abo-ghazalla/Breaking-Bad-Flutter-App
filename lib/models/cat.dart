import 'package:breaking_bad_app/models/base_models/base_model.dart';

class Cat extends BaseModel {
  final int? categoryId;
  final int? languageId;
  final int? id;
  final String? name;

  Cat({this.categoryId, this.languageId, this.id, this.name});

  factory Cat.fromJson(json) => Cat(
        categoryId: json["categoryId"],
        id: json["id"],
        name: json["name"],
        languageId: json["languageId"],
      );

  @override
  fromJson(Map<String, dynamic> json) {
    return Cat.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "categoryId": categoryId,
      "languageId": languageId,
      "id": id,
      "name": name
    };
  }
}
