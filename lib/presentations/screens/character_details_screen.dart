import 'dart:developer';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/business_logic/cubit/characters_cubit.dart';
import 'package:movies_app/constants/app_colors.dart';
import 'package:movies_app/constants/app_strings.dart';
import 'package:movies_app/data/web_services/response.dart';

class CharacterDetailsScreen extends StatefulWidget {
  final Character item;
  const CharacterDetailsScreen({required this.item, super.key});

  @override
  State<CharacterDetailsScreen> createState() => _CharacterDetailsScreenState();
}

class _CharacterDetailsScreenState extends State<CharacterDetailsScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharactersCubit>(context).getLocations(widget.item.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey,
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                  margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      characterInfo(AppStrings.species, widget.item.species),
                      buildDivider(250),
                      characterInfo(AppStrings.gender, widget.item.gender),
                      buildDivider(255),
                      characterInfo(
                          AppStrings.origin, widget.item.origin['name']!),
                      buildDivider(266),
                      // law fi data type List fl API for example List origin:[a,b,c,d,e,f,g,h]
                      // ha3redha item.origin.join(" / ")
                      // htban fl UI a/b/c/d/e/f/g/h
                      characterInfo(
                          AppStrings.location, widget.item.location['name']!),
                      buildDivider(245),
                      characterInfo('Created: ', widget.item.created),
                      buildDivider(245),
                      widget.item.type.isEmpty
                          ? Container()
                          : characterInfo('Type: ', widget.item.type),
                      widget.item.type.isEmpty
                          ? Container()
                          : buildDivider(275),

                      const SizedBox(height: 50),
                      BlocBuilder<CharactersCubit, CharactersState>(
                          builder: (context, state) {
                        if (state is LocationsSuccessState) {
                          log(state.location.toString());

                          return renderLocations(state);
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: AppColors.yellow,
                            ),
                          );
                        }
                      }),
                    ],
                  )),
              const SizedBox(height: 500),
            ]),
          )
        ],
      ),
    );
  }

  Widget buildSliverAppBar() {
    return SliverAppBar(
      pinned: true,
      expandedHeight: 600,
      stretch: true,
      backgroundColor: AppColors.grey,
      flexibleSpace: FlexibleSpaceBar(
        // centerTitle: true,
        title: Text(
          widget.item.name,
          style: const TextStyle(
            color: AppColors.yellow,
          ),
        ),
        background: Hero(
          tag: widget.item.id,
          child: Image.network(widget.item.image, fit: BoxFit.cover),
        ),
      ),
    );
  }

  Widget characterInfo(String title, String value) {
    return RichText(
        maxLines: 1,
        text: TextSpan(children: [
          TextSpan(
              text: title,
              style: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: AppColors.white)),
          TextSpan(
              text: value,
              style: const TextStyle(fontSize: 16, color: AppColors.white)),
        ]));
  }

  Widget buildDivider(double endIndent) {
    return Divider(
      color: AppColors.yellow,
      height: 30,
      endIndent: endIndent, // el space mn el yemen tb2a ad eh
      thickness: 2,
    );
  }

  Widget renderLocations(state) {
    var word = state.location.toString();
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const SizedBox(width: 20.0, height: 100.0),
          const Text(
            'Location:',
            style: TextStyle(fontSize: 43.0),
          ),
          const SizedBox(width: 20.0, height: 100.0),
          DefaultTextStyle(
            style: const TextStyle(
              fontSize: 22.0,
              fontFamily: 'Horizon',
            ),
            child: AnimatedTextKit(
              animatedTexts: [
                RotateAnimatedText(word),
                RotateAnimatedText('$word s'),
                RotateAnimatedText('$word t'),
              ],
              onTap: () {
                print("Tap Event");
              },
            ),
          ),
        ],
      ),
    );
  }
}
