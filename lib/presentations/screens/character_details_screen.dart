import 'package:flutter/material.dart';
import 'package:movies_app/constants/app_colors.dart';
import 'package:movies_app/constants/app_strings.dart';
import 'package:movies_app/data/web_services/response.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final Character item;
  const CharacterDetailsScreen({required this.item, super.key});

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
                      characterInfo(AppStrings.species, item.species),
                      buildDivider(250),
                      characterInfo(AppStrings.gender, item.gender),
                      buildDivider(255),
                      characterInfo(AppStrings.origin, item.origin['name']!),
                      buildDivider(266),
                      // law fi data type List fl API for example List origin:[a,b,c,d,e,f,g,h]
                      // ha3redha item.origin.join(" / ")
                      // htban fl UI a/b/c/d/e/f/g/h
                      characterInfo(
                          AppStrings.location, item.location['name']!),
                      buildDivider(245),
                      characterInfo('Created: ', item.created),
                      buildDivider(245),
                      item.type.isEmpty
                          ? Container()
                          : characterInfo('Type: ', item.type),
                      item.type.isEmpty ? Container() : buildDivider(275),
                      const SizedBox(height: 20),
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
          item.name,
          style: const TextStyle(
            color: AppColors.yellow,
          ),
        ),
        background: Hero(
          tag: item.id,
          child: Image.network(item.image, fit: BoxFit.cover),
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
}
