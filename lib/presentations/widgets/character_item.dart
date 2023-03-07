import 'package:flutter/material.dart';
import 'package:movies_app/constants/app_colors.dart';
import 'package:movies_app/data/web_services/response.dart';
import 'package:movies_app/presentations/screens/character_details_screen.dart';

class CharacterItemWidget extends StatelessWidget {
  final Character item;

  const CharacterItemWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> const CharacterDetailsScreen())),
      child: Container(
        width: double.infinity,
        margin: const EdgeInsetsDirectional.all(8),
        padding: const EdgeInsetsDirectional.all(4),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: GridTile(
          footer: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            color: Colors.black54,
            alignment: Alignment.bottomCenter,
            child: Text(
              item.name,
              style: const TextStyle(
                height: 1.3,
                fontSize: 16,
                color: AppColors.white,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
          child: Hero(
            tag: item.id,
            child: Container(
              color: AppColors.grey,
              child: item.image.isNotEmpty
                  ? FadeInImage.assetNetwork(
                      width: double.infinity,
                      height: double.infinity,
                      placeholder: 'assets/images/loading.gif',
                      image: item.image,
                      fit: BoxFit.cover,
                    )
                  : const CircularProgressIndicator(),
            ),
          ),
        ),
      ),
    );
  }
}
