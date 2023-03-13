import 'dart:convert';
import 'dart:developer';
import 'dart:ffi';

import 'package:movies_app/data/models/all_characters.dart';
import 'package:movies_app/data/models/character_locations.dart';
import 'package:movies_app/data/web_services/response.dart';
import 'package:movies_app/data/web_services/web_service_retrofit.dart';

class CharactersRepository {
  // final CharactersWebservices _charactersWebservices;
  final WebServices webServices;

  CharactersRepository(this.webServices);

  var characters;

  Future<List<Character>?> getAllCharacters() async {
    try {
      characters = await webServices.getCharacters();
      log("repository ${characters.info.pages}");
      return characters.results;
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

  Future<int> getLocations(int charId) async {
    try {
      // final locations = await webServices.getLocation();
      return characters.info.pages ;
    } catch (e) {
      log(e.toString());
      return 0;
    }
  }
}
