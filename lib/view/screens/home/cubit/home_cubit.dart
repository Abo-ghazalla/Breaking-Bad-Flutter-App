part of 'imports.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  Future<void> allCharacters() async {
    emit(HomeLoading());
    final allChars = await getIt.get<CharactersRepos>().getAllCharacters();
// final g= BaseResponse<Cat>.fromJson(data, Cat());

    allChars.fold(
      (allChars) => emit(HomeData(allChars)),
      (e) => emit(HomeError(e.msg)),
    );
  }
}

final data = {
  "statusCode": 200,
  "message": "تم استلام البيانات بنجاح",
  "success": true,
  "data": list
  // "data": map
};
final map = {
  "id": 13,
  "name": "واقعي وتاريخي",
  "categoryId": 7,
  "languageId": 1,
};

final list = [
  {
    "id": 13,
    "name": "واقعي وتاريخي",
    "categoryId": 7,
    "languageId": 1,
  },
  {
    "id": 15,
    "name": "خيالي وإبداعي",
    "categoryId": 8,
    "languageId": 1,
  }
  
];
