class Character {
  final int id;
  final String name;
  final String birthday;
  final String img;
  final String nickname;
  final List<dynamic> appearance;

  Character({
    required this.id,
    required this.name,
    required this.birthday,
    required this.img,
    required this.nickname,
    required this.appearance,
  });

  factory Character.fromJson(Map<String, dynamic> json) => Character(
        id: json["char_id"],
        name: json["name"],
        birthday: json["birthday"],
        img: json["img"],
        nickname: json["nickname"],
        appearance: json["appearance"],
      );

  Map<String, dynamic> toJson() => {
        "char_id": id,
        "name": name,
        "birthday": birthday,
        "img": img,
        "nickname": nickname,
        "appearance": appearance,
      };
}
