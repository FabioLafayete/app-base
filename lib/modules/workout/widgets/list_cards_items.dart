import 'package:app/components/base_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ListCardItems extends BaseWidget {
  ListCardItems({
    Key? key,
    required this.title,
    required this.listItems,
    this.seeMore,
    this.invertColors = false
  }) : super(key: key);

  final String title;
  final Function()? seeMore;
  final bool invertColors;
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
              text(title, color: invertColors ? colors.text2 : colors.text, fontWeight: FontWeight.w700, fontSize: 22),
              if(seeMore != null)
                GestureDetector(
                  onTap: (){},
                  child: Row(
                    children: [
                      text(
                          'Ver mais ',
                          color: invertColors ? colors.text2 : colors.primary,
                          fontWeight: FontWeight.w600,
                          fontSize: 14
                      ),
                      Icon(Icons.arrow_forward_ios_rounded, size: 14, color: invertColors ? colors.text2 : colors.primary,)
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
    return GestureDetector(
      onTap: item.onPress,
      child: Container(
        margin: EdgeInsets.only(left: index == 0 ? 16 : 0, right: index + 1 == listItems.length ? 16 : 10),
        width: width * 0.65,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Opacity(
                opacity: item.soon ? 1.0 : 1.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CachedNetworkImage(
                        fadeInDuration: const Duration(milliseconds: 300),
                        imageUrl: listItems[index].thumbnail,
                        width: width,
                        height: height * 0.19,
                        alignment: Alignment.bottomCenter,
                        fit: BoxFit.cover,
                      ),
                      if(item.showFavorite)
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
                      Container(
                          padding: const EdgeInsets.all(0),
                          decoration: BoxDecoration(
                            color: colors.text.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(1000),
                            border: Border.all(width: 1.5, color: colors.text2)
                          ),
                          child: Icon(Icons.play_arrow_rounded, color: colors.background, size: 50)
                      ),
                    ],
                  ),
                ),
              ),
            ),
            space(0.01),
            text(item.typeTraining,
                fontSize: 10,
                fontWeight: FontWeight.w700,
                color: invertColors ? colors.text2 : colors.primary),
            space(0.005),
            text(item.description,
                fontWeight: FontWeight.w600,
                maxLines: 2,
                textOverflow: TextOverflow.ellipsis,
                color: invertColors ? colors.text2 : colors.text),
            space(0.005),
            Row(
              children: [
                if(item.trainer != null)
                  text(item.trainer!,
                      fontWeight: FontWeight.w300,
                      fontSize: 12,
                      color: invertColors ? colors.text2 : colors.text
                  ),
                if(item.timeTraining != null)
                  text('${item.trainer != null ? ' | ' : ''}${item.timeTraining!}',
                      fontWeight: FontWeight.w300,
                      fontSize: 12,
                    color: invertColors ? colors.text2 : colors.text
                  ),
              ],
            )
          ],
        ),
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
  final bool showFavorite;
  final bool soon;
  final Function() onPress;

  CardItemModel({
    required this.title,
    required this.thumbnail,
    required this.description,
    required this.typeTraining,
    required this.onPress,
    this.timeTraining,
    this.trainer,
    this.isFavorite = false,
    this.showFavorite = true,
    this.soon = false
  });
}