import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/business_logic/cubit/cubit/characters_cubit.dart';
import 'package:movies_app/config/dependency_injection.dart';
import 'package:movies_app/constants/app_strings.dart';
import 'package:movies_app/data/repository/characters_repository.dart';
import 'package:movies_app/presentations/screens/character_details_screen.dart';
import 'package:movies_app/presentations/screens/characters_screen.dart';

class AppRoutes {
  final CharactersCubit charactersCubit = CharactersCubit();
  Route? generateRoutes(RouteSettings settings) {
    switch (settings.name){
      case AppStrings.charactersScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => charactersCubit,
            child: const CharactersScreen(),
          ),
        );

      case AppStrings.characterDetailsScreen:
        return MaterialPageRoute(
            builder: (_) => const CharacterDetailsScreen());

      default:
        return MaterialPageRoute(builder: (_) => const CharactersScreen());
    }
  }
}
