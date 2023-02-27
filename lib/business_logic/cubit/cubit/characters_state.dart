part of 'characters_cubit.dart';

abstract class CharactersState {}

class CharactersInitialState extends CharactersState {}

class CharactersLoadingState extends CharactersState {
  final Characters characters;
  CharactersLoadingState(this.characters);
}
