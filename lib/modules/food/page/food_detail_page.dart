import 'package:app/modules/food/models/food_detail_model/food_detail_model.dart';
import 'package:app/shared/widgets/base_page.dart';
import 'package:app/shared/widgets/base_widget.dart';
import 'package:app/shared/widgets/border_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class FoodDetailPage extends BaseWidget {
  FoodDetailPage({
    super.key,
    required this.model
  });

  final FoodDetailModel model;

  @override
  Widget build(BuildContext context) {
    return BasePage(
      showAppBar: false,
      paddingPage: 0,
      body: SlidingUpPanel(
        renderPanelSheet: true,
        minHeight: height * 0.62,
        maxHeight: height * 0.86,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        body: Container(
            height: height,
            width: width,
            alignment: Alignment.topCenter,
            child: _imageTop()
        ),
        margin: EdgeInsets.zero,
        panelBuilder: (_) => ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: Container(
              alignment: Alignment.topCenter,
              color: colors.background,
              child: ListView(
                controller: _,
                padding: const EdgeInsets.only(top: 20),
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: text(
                        model.name!,
                        fontSize: 28,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                  const SizedBox(height: 18),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: _info(),
                  ),
                  const SizedBox(height: 45),
                  _ingredients(),
                  const SizedBox(height: 45),
                  _preparation(),
                ]
              ),
            )
        ),
      ),
    );
  }

  Widget _ingredients(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.centerRight,
          width: 170,
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            border: Border(
              top: BorderSide(color: colors.primary, width: 2),
              bottom: BorderSide(color: colors.primary, width: 2),
              right: BorderSide(color: colors.primary, width: 2.1),
              left: BorderSide(color: colors.primary, width: 0),
            )
          ),
          child: text('Ingredientes', fontWeight: FontWeight.w600, fontSize: 16),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(model.ingredients.length, (index){
            final item = model.ingredients[index];
            return Container(
              margin: const EdgeInsets.only(top: 15, left: 16),
              child: text(item, fontSize: 18, fontWeight: FontWeight.w600),
            );
          }),
        )
      ],
    );
  }

  Widget _preparation(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.centerRight,
          width: 170,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              border: Border(
                top: BorderSide(color: colors.primary, width: 2),
                bottom: BorderSide(color: colors.primary, width: 2),
                right: BorderSide(color: colors.primary, width: 2.1),
                left: BorderSide(color: colors.primary, width: 0),
              )
          ),
          child: text('Preparação', fontWeight: FontWeight.w600, fontSize: 16),
        ),
        const SizedBox(height: 40),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 80),
          child: text(model.preparation!, fontSize: 16, fontWeight: FontWeight.w500),
        )
      ],
    );
  }

  Widget _info(){
    return SizedBox(
      height: 40,
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: [
          BorderWidget(
            backgroundColor: Colors.white,
            margin: const EdgeInsets.only(right: 10),
            child: Row(
              children: [
                const Icon(Icons.local_fire_department_outlined, color: Colors.red),
                const SizedBox(width: 5),
                text(model.kcal.toString(), fontWeight: FontWeight.w700),
                text(' Kcal', fontSize: 10, )
              ],
            ),
          ),
          if(model.duration != null)
            BorderWidget(
              backgroundColor: Colors.white,
              margin: const EdgeInsets.only(right: 10),
              child: Row(
                children: [
                  const Icon(Icons.access_time_sharp, color: Colors.grey),
                  const SizedBox(width: 5),
                  text(model.duration!, fontWeight: FontWeight.w700),
                  text(' min', fontSize: 10, )
                ],
              ),
            ),
          if(model.difficulty != null)
            BorderWidget(
              backgroundColor: Colors.white,
              margin: const EdgeInsets.only(right: 10),
              child: Row(
                children: [
                  text('👩‍🍳', fontSize: 14),
                  const SizedBox(width: 5),
                  text(model.difficulty!, fontWeight: FontWeight.w700),
                ],
              ),
            ),
          if(model.servings != null)
            BorderWidget(
              backgroundColor: Colors.white,
              margin: const EdgeInsets.only(right: 10),
              child: Row(
                children: [
                  text('Porções:', fontSize: 14),
                  const SizedBox(width: 5),
                  text(model.servings.toString()!, fontWeight: FontWeight.w700),
                ],
              ),
            )
        ],
      ),
    );
  }

  Widget _buttonBack(){
    return SafeArea(
      child: GestureDetector(
        onTap: router.pop,
        child: Container(
          margin: const EdgeInsets.only(left: 10, top: 10),
          decoration: BoxDecoration(
            color: colors.primary.withOpacity(1),
            borderRadius: BorderRadius.circular(10)
          ),
          padding: const EdgeInsets.only(
            left: 20, right: 10, top: 15, bottom: 15
          ),
          child: Icon(
              Icons.arrow_back_ios,
              color: colors.background
          ),
        ),
      ),
    );
  }

  Widget _imageTop(){
    return Stack(
      children: [
        CachedNetworkImage(
          fadeInDuration: const Duration(milliseconds: 400),
          imageUrl: model.image ?? '',
          width: width,
          height: height * 0.4,
          alignment: Alignment.bottomCenter,
          fit: BoxFit.cover,
        ),
        _buttonBack()
      ],
    );
  }

}
