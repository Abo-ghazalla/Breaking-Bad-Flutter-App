part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeData extends HomeState {
  final List<Character> characters;

  const HomeData(this.characters);
}

class HomeError extends HomeState {
  final String msg;

  const HomeError(this.msg);
}
