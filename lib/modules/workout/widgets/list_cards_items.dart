import 'package:app/components/base_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class ListCardItems extends BaseWidget {
  ListCardItems({
    Key? key,
    required this.title,
    required this.listItems,
    this.seeMore
  }) : super(key: key);

  final String title;
  final Function()? seeMore;
  final List<CardItemModel> listItems;

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
              text(title, color: colors.text, fontWeight: FontWeight.w700, fontSize: 22),
              if(seeMore != null)
                GestureDetector(
                  onTap: (){},
                  child: Row(
                    children: [
                      text('Ver mais ', color: colors.textSecondary, fontWeight: FontWeight.w500),
                      Icon(Icons.arrow_forward_ios_rounded, size: 16, color: colors.primary,)
                    ],
                  ),
                )
            ],
          ),
        ),
        space(0.01),
        SizedBox(
          height: height * 0.27,
          child: ListView(
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
    CardItemModel item = listItems[index];
    return Container(
      margin: EdgeInsets.only(left: index == 0 ? 16 : 0, right: index + 1 == listItems.length ? 16 : 10),
      width: width * 0.65,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(13),
              child: Stack(
                children: [
                  CachedNetworkImage(
                    fadeInDuration: const Duration(milliseconds: 300),
                    imageUrl: listItems[index].thumbnail,
                    width: width,
                    height: height * 0.19,
                    alignment: Alignment.topCenter,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                      top: 5,
                      right: 5,
                      child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: colors.text.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(1000),
                          ),
                          child: Icon(Icons.favorite_border, color: colors.background, size: 18,)
                      )
                  ),
                ],
              ),
            ),
          ),
          space(0.005),
          text(item.typeTraining, fontSize: 10, fontWeight: FontWeight.w600, color: colors.primary),
          space(0.005),
          text(item.description, fontWeight: FontWeight.w600, maxLines: 2, textOverflow: TextOverflow.ellipsis),
          space(0.005),
          Row(
            children: [
              if(item.trainer != null)
                text(item.trainer!, fontWeight: FontWeight.w300, fontSize: 12),
              if(item.timeTraining != null)
                text('${item.trainer != null ? ' | ' : ''}${item.timeTraining!}', fontWeight: FontWeight.w300, fontSize: 12),
            ],
          )
        ],
      ),
    );
  }

}

class CardItemModel {
  final String title;
  final String thumbnail;
  final String description;
  final String typeTraining;
  final String? timeTraining;
  final String? trainer;
  final bool isFavorite;

  CardItemModel({
    required this.title,
    required this.thumbnail,
    required this.description,
    required this.typeTraining,
    this.timeTraining,
    this.trainer,
    this.isFavorite = false
  });
}