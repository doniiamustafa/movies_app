import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/constants/app_strings.dart';
import 'package:movies_app/presentations/screens/character_details_screen.dart';
import 'package:movies_app/presentations/screens/characters_screen.dart';

class AppRoutes {
  Route? generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case AppStrings.charactersScreen:
        return MaterialPageRoute(builder: (_) => const CharactersScreen());
      case AppStrings.characterDetailsScreen:
        return MaterialPageRoute(
            builder: (_) => const CharacterDetailsScreen());

      default:
        return MaterialPageRoute(builder: (_) => const CharactersScreen());
    }
  }
}
