import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/config/dependency_injection.dart';
import 'package:movies_app/data/models/all_characters.dart';
import 'package:movies_app/data/models/character_locations.dart';
import 'package:movies_app/data/repository/characters_repository.dart';
import 'package:movies_app/data/web_services/response.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository _charactersRepository =
      instance<CharactersRepository>();
  CharactersCubit() : super(CharactersInitialState());

  List<Character>? items = [];
  String? location2 = "";

  List<Character>? getAllCharacters() {
    _charactersRepository.getAllCharacters().then((characters) {
      log("cubit ${characters![1].toString()}");
      emit(CharactersSuccessState(characters));
      items = characters;
    });

    return items;
  }

  void getLocations(int id) {
    _charactersRepository.getLocations(id).then((location) {
      log("cubit $location");
      emit(LocationsSuccessState(location));
    });
  }
}
