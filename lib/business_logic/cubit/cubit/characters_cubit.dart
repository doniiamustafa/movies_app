import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/config/dependency_injection.dart';
import 'package:movies_app/data/repository/characters_repository.dart';
import 'package:movies_app/data/web_services/response.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository _charactersRepository =
      instance<CharactersRepository>();
  CharactersCubit() : super(CharactersInitialState());

  List<Character>? items = [];

  List<Character>? getAllCharacters() {
     _charactersRepository.getAllCharacters().then((characters) {
      log("cubit ${characters.toString()}");
      emit(CharactersSuccessState(characters));
      items = characters;
    });

    return items;
  }
}
