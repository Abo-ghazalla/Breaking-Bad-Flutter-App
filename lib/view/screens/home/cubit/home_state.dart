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

  HomeData(this.characters);
}

class HomeError extends HomeState {}
