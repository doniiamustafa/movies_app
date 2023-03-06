import 'dart:developer';
import 'package:movies_app/business_logic/cubit/characters_cubit.dart';
import 'package:movies_app/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/data/web_services/response.dart';
import 'package:movies_app/presentations/widgets/character_item.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  // final AllCharacters allCharacters = AllCharacters();
  List<Character>? character = [];
  @override
  void initState() {
    super.initState();
    character = BlocProvider.of<CharactersCubit>(context).getAllCharacters();
    log("initstate ${character.toString()}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.yellow,
        centerTitle: true,
        title: const Text(
          "Rick and Morty Movie",
          style: TextStyle(color: AppColors.grey),
        ),
      ),
      body: BlocBuilder<CharactersCubit, CharactersState>(
          builder: ((context, state) {
        if (state is CharactersSuccessState) {
          character = state.item;
          return charactersScreenBody();
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      })),
    );
  }

  Widget charactersScreenBody() {
    return SingleChildScrollView(
      child: Container(
        color: AppColors.grey,
        child: Column(
          children: [
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 3,
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 1),
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: character!.length,
              itemBuilder: (context, index) {
                return CharacterItemWidget(
                  item: character![index],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
