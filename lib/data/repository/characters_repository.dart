import 'dart:developer';

import 'package:movies_app/data/models/characters.dart';
import 'package:movies_app/data/web_services/characters_web_services.dart';

class CharactersRepository {
  final CharactersWebservices _charactersWebservices;

  CharactersRepository(this._charactersWebservices);

  Future<Characters> getAllCharacters() async {
    final characters = await _charactersWebservices.getAllCharacters();
    log(characters.toString());
    return characters;
  }
}
