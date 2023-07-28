import 'package:app/components/base_page.dart';
import 'package:app/components/base_widget.dart';
import 'package:app/modules/food/models/food_detail_model/food_detail_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

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
      body: Stack(
        children: [
          ListView(
            padding: MediaQuery.maybeOf(context)?.padding.copyWith(top: 0),
            children: [
              _imageTop(),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    text(
                        model.name!,
                        fontSize: 24,
                        fontWeight: FontWeight.w600
                    ),
                    
                  ],
                ),
              ),
            ],
          ),
          _buttonBack()
        ],
      ),
    );
  }

  Widget _buttonBack(){
    return SafeArea(
      child: GestureDetector(
        onTap: router.pop,
        child: Container(
          decoration: BoxDecoration(
            color: colors.primary.withOpacity(1),
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(1000),
              bottomRight: Radius.circular(1000),
            ),
          ),
          padding: const EdgeInsets.all(10).copyWith(
            left: 30
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
      alignment: Alignment.bottomCenter,
      children: [
        CachedNetworkImage(
          fadeInDuration: const Duration(milliseconds: 400),
          imageUrl: model.image ?? '',
          width: width,
          height: height * 0.4,
          alignment: Alignment.bottomCenter,
          fit: BoxFit.cover,
        ),
        Container(
          height: 10,
          width: width,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(10),
              topLeft: Radius.circular(10),
            ),
            color: colors.background
          ),
        )
      ],
    );
  }

}
