import 'dart:developer';

import 'package:movies_app/data/models/all_characters.dart';
import 'package:movies_app/data/web_services/characters_web_services.dart';

class CharactersRepository {
  final CharactersWebservices _charactersWebservices;

  CharactersRepository(this._charactersWebservices);

  Future<AllCharacters> getAllCharacters() async {
    final characters = await _charactersWebservices.getAllCharacters();
    log(characters.toString());
    return characters;
  }
}
