import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/data/models/characters.dart';
import 'package:movies_app/data/repository/characters_repository.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  CharactersCubit(this._charactersRepository) : super(CharactersInitialState());

  final CharactersRepository _charactersRepository;
  late final Characters characters;

  Characters getAllCharacters() {
    _charactersRepository.getAllCharacters().then((characters) {
      emit(CharactersLoadingState(characters));
      this.characters = characters;
    });
    return characters;
  }
}
