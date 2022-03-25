part of 'imports.dart';

class CharactersRepos {
  final APIService _service;
  CharactersRepos(this._service);

  Future<Either<List<Character>, AppError>> getAllCharacters() async {
    final res = await _service.get(path: 'characters', model: Character());

    if (res.isLeft()) {
      return Left(List<Character>.from((res as Left).value));
    } else {
      return res as Right<List<Character>, AppError>;
    }
  }
}
