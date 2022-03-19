import 'package:breaking_bad_app/config/helpers/conncetivity_helper.dart';
import 'package:breaking_bad_app/data/service/remote_service.dart';
import 'package:breaking_bad_app/models/character.dart';
import 'package:breaking_bad_app/models/error.dart';
import 'package:dartz/dartz.dart';

class CharactersRepos {
  final APIService _service;
  CharactersRepos(this._service);

  Future<Either<List<Character>, AppError>> getAllCharacters() async {
    final hasConnection = await hasNetworkConnection();
    if (!hasConnection) {
      return Right(AppError("Internet Error"));
    }
    final res = await _service.get(path: 'characters');
    final data = res.data;
    return Left(List<Map<String, dynamic>>.from(data)
        .map((e) => Character.fromJson(e))
        .toList());
  }
}
