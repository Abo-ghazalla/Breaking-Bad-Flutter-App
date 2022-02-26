import 'package:breaking_bad_app/data/service/remote_service.dart';
import 'package:breaking_bad_app/models/character.dart';

class CharactersRepos {
  final APIService _service;
  CharactersRepos(this._service);
  
  Future<List<Character>> getAllCharacters() async {
    final res = await _service.get(path: 'characters');
    return List<Map<String,dynamic>>.from(res).map((e) => Character.fromJson(e)).toList();
  }
}
