import 'package:app/modules/workout/widgets/list_cards_items.dart';
import 'package:app/shared/modules/user/controller/user_controller.dart';
import 'package:app/shared/widgets/base_widget.dart';
import 'package:app/shared/widgets/my_button.dart';
import 'package:app/shared/widgets/subscription_bottom_sheet.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../shared/widgets/multiple_users.dart';

class TopPresentation extends BaseWidget {
  TopPresentation({
    Key? key,
    required this.cardItemModel,
    this.titleButton,
    this.showUsers = true
  }) : super(key: key);

  final CardItemModel cardItemModel;
  final String? titleButton;
  final bool? showUsers;
  final userController = Modular.get<UserController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height(context) * 0.45,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(0),
          bottomLeft: Radius.circular(40),
        ),
        child: Stack(
          children: [
            _image(context),
            _effectImage(context),
            _information(context)
          ],
        ),
      )
    );
  }

  Widget _information(BuildContext context){
    return Container(
      margin: EdgeInsets.only(bottom: height(context) * 0.02).copyWith(left: 16, right: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(cardItemModel.typeTraining != null)
            ...[
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                    color: colors.primary,
                    borderRadius: BorderRadius.circular(8)
                ),
                child: text(cardItemModel.typeTraining!, fontSize: 12, fontWeight: FontWeight.w600, color: colors.background),
              ),
              space(0.01, context),
            ],
          text(cardItemModel.description,
              fontWeight: FontWeight.w600,
              maxLines: 2,
              textOverflow: TextOverflow.ellipsis,
              color: colors.background, fontSize: 26
          ),
          space(0.01, context),
          Row(
            children: [
              if(cardItemModel.trainer != null)
                text(cardItemModel.trainer!, fontWeight: FontWeight.w400, fontSize: 14, color: colors.background),
              if(cardItemModel.timeTraining != null)
                text('${cardItemModel.trainer != null ? ' | ' : ''}${cardItemModel.timeTraining!}',
                    fontWeight: FontWeight.w400, fontSize: 14, color: colors.background),
            ],
          ),
          space(0.02, context),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if(showUsers!)
                MultipleUsers(
                  users: [
                    MultipleUsersModel(name: 'Fabio Lafayete', photo: 'https://www.netliteracy.org/wp-content/uploads/2020/07/Capture-3-768x758.png'),
                    MultipleUsersModel(name: 'Mariana Cardoso'),
                    // MultipleUsersModel(name: 'Lucas Alves', photo: 'https://ddg.wiki/wp-content/uploads/sites/22/2019/02/thispersondoesnotexist.com_000.jpg'),
                    MultipleUsersModel(name: 'Vitor Rafael'),
                  ],
                ),
              SizedBox(
                width: 120,
                child: MyButton(
                  title: titleButton ?? 'INICIAR',
                  heightButton: 35,
                  sizeTitle: 15,
                  colorTitle: colors.primary,
                  colorButton: colors.background,
                  onPress: userController.user.activated ? cardItemModel.onPress : (){
                    const SubscriptionBottomSheet().show(context: context);
                  }
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _image(BuildContext context) {
    if(!cardItemModel.thumbnail.contains('http')){
      return Image.asset(
        cardItemModel.thumbnail,
        width: width(context),
        height: height(context) * 0.45,
        alignment: Alignment.bottomCenter,
        fit: BoxFit.cover,
      );
    }
    return CachedNetworkImage(
      fadeInDuration: const Duration(milliseconds: 300),
      imageUrl: cardItemModel.thumbnail,
      width: width(context),
      height: height(context) * 0.45,
      alignment: Alignment.bottomCenter,
      fit: BoxFit.cover,
    );
  }

  Widget _effectImage(BuildContext context){
    return Container(
      height: height(context) * 0.45,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter,
              colors: [
                Colors.transparent,
                colors.primary,
              ],
              stops: const [0.1, 1]
          )
      ),
    );
  }
}
