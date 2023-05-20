import 'dart:ui';

import 'package:app/components/base_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ListCardFood extends BaseWidget {
  ListCardFood({
    Key? key,
    required this.title,
    required this.listItems,
    this.seeMore,
    this.invertColors = false
  }) : super(key: key);

  final String title;
  final Function()? seeMore;
  final bool invertColors;
  final List<CardFoodModel> listItems;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: text(
                  title,
                  maxLines: 1,
                  textOverflow: TextOverflow.ellipsis,
                  color: invertColors ? colors.text2 : colors.text,
                  fontWeight: FontWeight.w700,
                  fontSize: 22
              )),
              if(seeMore != null)
                GestureDetector(
                  onTap: (){},
                  child: Row(
                    children: [
                      text('Ver mais ', color: invertColors ? colors.text2 : colors.primary, fontWeight: FontWeight.w600, fontSize: 14),
                      Icon(Icons.arrow_forward_ios_rounded, size: 14, color: invertColors ? colors.text2 : colors.primary)
                    ],
                  ),
                )
            ],
          ),
        ),
        space(0.01),
        SizedBox(
          height:  width * 0.7,
          child: ListView(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: List.generate(listItems.length, (index){
              return _item(index);
            }),
          ),
        )
      ],
    );
  }

  Widget _item(int index){
    CardFoodModel item = listItems[index];
    return GestureDetector(
      onTap: item.onPress,
      child: Container(
        margin: EdgeInsets.only(left: index == 0 ? 16 : 0, right: index + 1 == listItems.length ? 16 : 10, bottom: 6),
        width: width * 0.55,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16)
          ),
          elevation: 5,
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0).copyWith(bottom: 0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Stack(
                      children: [
                        CachedNetworkImage(
                          fadeInDuration: const Duration(milliseconds: 300),
                          imageUrl: listItems[index].thumbnail,
                          alignment: Alignment.center,
                          width: width,
                          height: height,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                            top: 10,
                            right: 10,
                            child: Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: colors.text.withOpacity(0.6),
                                  borderRadius: BorderRadius.circular(1000),
                                ),
                                child: Icon(Icons.favorite_border, color: colors.background, size: 24,)
                            )
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: width * 0.2,
                width: width,
                padding: const EdgeInsets.all(12).copyWith(top: 8, bottom: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    text(
                        item.description,
                        maxLines: 2,
                        fontSize: 16,
                        textOverflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.w600,
                        color: colors.text
                    ),
                    text(
                        '320 Kcal | 25% AKG',
                        maxLines: 1,
                        textOverflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.w400,
                        color: colors.text
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}

class CardFoodModel {
  final String title;
  final String thumbnail;
  final String description;
  final String typeTraining;
  final String? timeTraining;
  final String? trainer;
  final bool isFavorite;
  final Function() onPress;

  CardFoodModel({
    required this.title,
    required this.thumbnail,
    required this.description,
    required this.typeTraining,
    required this.onPress,
    this.timeTraining,
    this.trainer,
    this.isFavorite = false
  });
}