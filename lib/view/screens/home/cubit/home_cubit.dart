
part of 'imports.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  Future<void> allCharacters() async {
    emit(HomeLoading());
    final allChars = await getIt.get<CharactersRepos>().getAllCharacters();
    allChars.fold(
      (allChars) => emit(HomeData(allChars)),
      (e) => emit(HomeError(e.msg)),
    );
  }
}
