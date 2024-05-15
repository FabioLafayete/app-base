import 'package:app/shared/modules/user/controller/user_controller.dart';
import 'package:app/shared/widgets/base_widget.dart';
import 'package:app/shared/widgets/subscription_bottom_sheet.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:super_sliver_list/super_sliver_list.dart';

class ListCardItems extends BaseWidget {
  ListCardItems({
    Key? key,
    required this.title,
    this.description,
    required this.listItems,
    this.seeMore,
    this.invertColors = false
  }) : super(key: key);

  final String title;
  final String? description;
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
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    text(
                        title,
                        color: invertColors ? colors.text2 : colors.text,
                        fontWeight: FontWeight.w700,
                        fontSize: 22
                    ),
                    if(description != null)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: text(
                            description!,
                            color: invertColors ? colors.text2 : colors.text,
                            fontWeight: FontWeight.w400,
                            fontSize: 16
                        ),
                      ),
                  ],
                ),
              ),
              if(seeMore != null)
                GestureDetector(
                  onTap: (){},
                  child: Row(
                    children: [
                      text(
                          'Ver mais',
                          color: invertColors ? colors.text2 : colors.primary,
                          fontWeight: FontWeight.w600,
                          fontSize: 14
                      ),
                      // Icon(Icons.arrow_forward_ios_rounded, size: 14, color: invertColors ? colors.text2 : colors.primary,)
                    ],
                  ),
                )
            ],
          ),
        ),
        space(0.01),
        SizedBox(
          height: width * 0.57,
          child: SuperListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: List.generate(listItems.length, (index){
              return _item(index, context);
            }),
          ),
        )
      ],
    );
  }

  Widget _item(int index, BuildContext context){
    final userController = Modular.get<UserController>();
    CardItemModel item = listItems[index];
    bool isLock = item.soon || !userController.user.activated;
    return GestureDetector(
      onTap: userController.user.activated ? item.onPress : (){
        const SubscriptionBottomSheet().show(context: context);
      },
      child: Container(
        margin: EdgeInsets.only(left: index == 0 ? 16 : 0, right: index + 1 == listItems.length ? 16 : 10),
        width: width * 0.7,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Opacity(
                opacity: isLock ? 0.8 : 1.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      if(listItems[index].thumbnail.contains('http'))
                        CachedNetworkImage(
                          fadeInDuration: const Duration(milliseconds: 300),
                          imageUrl: listItems[index].thumbnail,
                          width: width,
                          alignment: Alignment.topCenter,
                          fit: BoxFit.cover,
                        )
                      else
                        Image.asset(
                          listItems[index].thumbnail,
                          width: width,
                          alignment: Alignment.topCenter,
                          fit: BoxFit.cover,
                          isAntiAlias: true,
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
                          padding: EdgeInsets.all(
                            !isLock ? 0 : 15,
                          ),
                          decoration: BoxDecoration(
                            color: colors.text.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(1000),
                            border: Border.all(width: 1.5, color: colors.text2)
                          ),
                          child: !isLock ?
                          Icon(Icons.play_arrow_rounded, color: colors.background, size: 50) :
                          Icon(Icons.lock, color: colors.background, size: 30)
                      ),
                    ],
                  ),
                ),
              ),
            ),
            space(0.01),
            if(item.typeTraining != null)
              ...[
                text(item.typeTraining!,
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    color: invertColors ? colors.text2 : colors.primary),
                space(0.005),
              ],
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
  final String thumbnail;
  final String description;
  final String? typeTraining;
  final String? timeTraining;
  final String? trainer;
  final bool isFavorite;
  final bool showFavorite;
  final bool soon;
  final Function() onPress;

  CardItemModel({
    required this.thumbnail,
    required this.description,
    this.typeTraining,
    required this.onPress,
    this.timeTraining,
    this.trainer,
    this.isFavorite = false,
    this.showFavorite = true,
    this.soon = false
  });
}