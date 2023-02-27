part of 'characters_cubit.dart';

abstract class CharactersState {}

class CharactersInitialState extends CharactersState {}

class CharactersLoadingState extends CharactersState {
  final AllCharacters characters;
  CharactersLoadingState(this.characters);
}
