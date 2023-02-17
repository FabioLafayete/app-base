import 'package:app/components/base_widget.dart';
import 'package:app/modules/workout/widgets/list_cards_items.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../components/custom_button.dart';

class TopPresentation extends BaseWidget {
  TopPresentation({
    Key? key,
    required this.cardItemModel
  }) : super(key: key);

  final CardItemModel cardItemModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * 0.4,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(80),
          bottomLeft: Radius.circular(0),
        ),
        child: Stack(
          children: [
            _image(),
            _effectImage(),
            _information()
          ],
        ),
      )
    );
  }

  Widget _information(){
    return Container(
      width: width * 0.9,
      margin: EdgeInsets.only(bottom: height * 0.015).copyWith(
        left: 16
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: colors.primary,
              borderRadius: BorderRadius.circular(1000)
            ),
            child: text(cardItemModel.typeTraining, fontSize: 12, fontWeight: FontWeight.w600, color: colors.background),
          ),
          space(0.01),
          text(cardItemModel.description,
              fontWeight: FontWeight.w600,
              maxLines: 2,
              textOverflow: TextOverflow.ellipsis,
              color: colors.background, fontSize: 26
          ),
          space(0.01),
          Row(
            children: [
              if(cardItemModel.trainer != null)
                text(cardItemModel.trainer!, fontWeight: FontWeight.w300, fontSize: 12, color: colors.background),
              if(cardItemModel.timeTraining != null)
                text('${cardItemModel.trainer != null ? ' | ' : ''}${cardItemModel.timeTraining!}',
                    fontWeight: FontWeight.w300, fontSize: 12, color: colors.background),
            ],
          ),
          space(0.015),
          SizedBox(
            width: 100,
            child: CustomButton(
              title: 'INICIAR',
              heightButton: 30,
              sizeTitle: 14,
              colorTitle: colors.primary,
              colorButton: colors.background,
              onPress: cardItemModel.onPress,
            ),
          ),
        ],
      ),
    );
  }

  Widget _image() {
    return CachedNetworkImage(
      fadeInDuration: const Duration(milliseconds: 300),
      imageUrl: cardItemModel.thumbnail,
      width: width,
      height: height * 0.4,
      alignment: Alignment.bottomCenter,
      fit: BoxFit.cover,
    );
  }

  Widget _effectImage(){
    return Container(
      height: height * 0.4,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.3),
                colors.primary,
              ],
              stops: const [0.1, 1]
          )
      ),
    );
  }
}
