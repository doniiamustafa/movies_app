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
  List<Character>? allCharacters = [];

  List<Character> searchCharactersList = [];
  bool isSearching = false;
  final TextEditingController _searchTextController = TextEditingController();

  Widget _buildSearchField() {
    return TextFormField(
      controller: _searchTextController,
      cursorColor: AppColors.grey,
      decoration: const InputDecoration(
        hintText: 'Find a character...',
        border: InputBorder.none,
        hintStyle: TextStyle(color: AppColors.grey, fontSize: 18),
      ),
      style: const TextStyle(color: AppColors.grey, fontSize: 18),
      onChanged: (searchLetter) {
        fillSearchCharactersList(searchLetter);
      },
    );
  }

  void fillSearchCharactersList(String searchLetter) {
    searchCharactersList = allCharacters!
        .where((character) =>
            character.name.toLowerCase().startsWith(searchLetter))
        .toList();
    setState(() {});
    log("s ${searchCharactersList.toString()}");
  }

  List<Widget> buildAppBarActions() {
    if (isSearching) {
      return [
        IconButton(
            onPressed: () {
              _stopSearching();
            },
            icon: const Icon(
              Icons.clear,
              color: AppColors.grey,
            ))
      ];
    } else {
      return [
        IconButton(
            onPressed: _startSearching,
            icon: const Icon(
              Icons.search,
              color: AppColors.grey,
            ))
      ];
    }
  }

  void _startSearching() {
    ModalRoute.of(context)!.addLocalHistoryEntry(LocalHistoryEntry(
        onRemove: _stopSearching)); // ha3mel call lel stop searching method
    setState(() {
      isSearching = true;
    });
  }

  _stopSearching() {
    setState(() {
      _searchTextController.clear();
      isSearching = false;
    });
  }

  Widget buildAppBarTitle() {
    return const Text(
      "Rick and Morty Movie",
      style: TextStyle(color: AppColors.grey),
    );
  }

  Widget buildAppBarLeading() {
    if (isSearching) {
      return BackButton(
        onPressed: () => Navigator.of(context).pop(),
        color: AppColors.grey,
      );
    } else {
      return Container();
    }
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.yellow,
          title: isSearching ? _buildSearchField() : buildAppBarTitle(),
          actions: buildAppBarActions(),
          leading: buildAppBarLeading()),
      body: BlocBuilder<CharactersCubit, CharactersState>(
          builder: ((context, state) {
        if (state is CharactersSuccessState) {
          allCharacters = state.item;
          return charactersScreenBody();
        } else {
          return Center(
            child: Container(
                color: AppColors.grey,
                child: Image.asset(
                  'assets/images/loading.gif',
                )),
          );
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
              itemCount: _searchTextController.text.isEmpty
                  ? allCharacters!.length
                  : searchCharactersList.length,
              itemBuilder: (context, index) {
                return CharacterItemWidget(
                  item: _searchTextController.text.isEmpty
                      ? allCharacters![index]
                      : searchCharactersList[index],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
