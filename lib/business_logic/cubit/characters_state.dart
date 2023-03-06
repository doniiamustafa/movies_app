part of 'characters_cubit.dart';

abstract class CharactersState {}

class CharactersInitialState extends CharactersState {}

class CharactersSuccessState extends CharactersState {
  final List<Character>? item;
  CharactersSuccessState(this.item);
}
