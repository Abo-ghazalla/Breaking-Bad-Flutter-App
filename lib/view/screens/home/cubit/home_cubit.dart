import 'package:bloc/bloc.dart';
import 'package:breaking_bad_app/data/repos/characters_repos.dart';
import 'package:breaking_bad_app/locator.dart';
import 'package:breaking_bad_app/models/character.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  Future<void> allCharacters() async {
    emit(HomeLoading());
    final allChars = await getIt.get<CharactersRepos>().getAllCharacters();
    allChars.fold(
      (allChars) => emit(HomeData(allChars)),
      (e) => emit(HomeError(e.msg)),
    );
    // emit(HomeData(allChars));
    // } catch (_) {
    //   emit(HomeError());
    // }
  }
}
