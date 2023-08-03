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
        header: Container(
          margin: EdgeInsets.only(top: height * 0.015),
          width: width,
          child: Center(
              child: Container(
                width: width * 0.1,
                height: 5,
                decoration: BoxDecoration(
                    color: colors.primary,
                    borderRadius: const BorderRadius.all(Radius.circular(10))
                ),
              )
          ),
        ),
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
        panelBuilder: (_) => ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: Container(
              color: colors.background,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView(
                controller: _,
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                children: [
                  text(
                      model.name!,
                      fontSize: 28,
                      fontWeight: FontWeight.w600
                  ),
                  const SizedBox(height: 18),
                  _info()
                ]
              ),
            )
        ),
      ),
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
