import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/business_logic/cubit/characters_cubit.dart';
import 'package:movies_app/constants/app_strings.dart';
import 'package:movies_app/data/web_services/response.dart';
import 'package:movies_app/presentations/screens/character_details_screen.dart';
import 'package:movies_app/presentations/screens/characters_screen.dart';

class AppRoutes {
  final CharactersCubit charactersCubit = CharactersCubit();
  Route? generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case AppStrings.charactersScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => charactersCubit,
            child: const CharactersScreen(),
          ),
        );

      case AppStrings.characterDetailsScreen:
        final item = settings.arguments as Character;
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (BuildContext context) => charactersCubit,
                  child: CharacterDetailsScreen(item: item),
                ));

      default:
        return MaterialPageRoute(builder: (_) => const CharactersScreen());
    }
  }
}
