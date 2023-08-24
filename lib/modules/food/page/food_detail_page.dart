import 'package:app/modules/food/models/food_detail_model/food_detail_model.dart';
import 'package:app/shared/widgets/base_page.dart';
import 'package:app/shared/widgets/base_widget.dart';
import 'package:app/shared/widgets/border_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
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
        maxHeight: ((height * 0.9) - MediaQuery.of(context).padding.top),
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
              color: Colors.white,
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
                  if(model.description != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 10),
                      child: text(model.description!, fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: _info(),
                  ),

                  const SizedBox(height: 20),
                  _ingredients(),
                  const SizedBox(height: 35),
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
          width: 200,
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            border: Border(
              top: BorderSide(color: colors.primary, width: 1),
              bottom: BorderSide(color: colors.primary, width: 1),
              right: BorderSide(color: colors.primary, width: 1.1),
              left: BorderSide(color: colors.primary, width: 0),
            )
          ),
          child: text('Ingredientes', fontWeight: FontWeight.w600, fontSize: 18),
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
          width: 200,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              border: Border(
                top: BorderSide(color: colors.primary, width: 1),
                bottom: BorderSide(color: colors.primary, width: 1),
                right: BorderSide(color: colors.primary, width: 1.1),
                left: BorderSide(color: colors.primary, width: 0),
              )
          ),
          child: text('Modo de preparo', fontWeight: FontWeight.w600, fontSize: 18),
        ),
        const SizedBox(height: 25),
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
          if(model.duration != null)
            Row(
              children: [
                const Icon(Icons.access_time_sharp, color: Colors.grey, size: 20,),
                const SizedBox(width: 5),
                text(model.duration!, fontWeight: FontWeight.w400),
                text(' min', fontSize: 10)
              ],
            ),
            Row(
              children: [
                const SizedBox(width: 20),
                const Icon(Icons.local_fire_department_outlined, color: Colors.grey),
                const SizedBox(width: 5),
                text(model.kcal.toString(), fontWeight: FontWeight.w400),
                text(' Kcal', fontSize: 10)
              ],
            ),
          if(model.difficulty != null)
            Row(
              children: [
                const SizedBox(width: 20),
                const Icon(Icons.bar_chart_rounded, color: Colors.grey, size: 20),
                const SizedBox(width: 5),
                text(model.difficulty!, fontWeight: FontWeight.w400),
              ],
            ),
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
            color: colors.primary,
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
        if(model.image!.contains('assets/image'))
          Image.asset(
            model.image!,
            width: width,
            height: height * 0.4,
            alignment: Alignment.bottomCenter,
            fit: BoxFit.cover,
          )
          else
        CachedNetworkImage(
          fadeInDuration: const Duration(milliseconds: 400),
          imageUrl: model.image ?? '',
          width: width,
          height: height * 0.4,
          alignment: Alignment.bottomCenter,
          fit: BoxFit.cover,
          imageBuilder: (_, img) {
            return Image(
              image: img,
              fit: BoxFit.cover,
            );
          },
          placeholder: (context, url) => Shimmer.fromColors(
            baseColor: Colors.grey.withOpacity(0.8),
            highlightColor: Colors.grey.withOpacity(0.6),
            child: Container(
              color: Colors.black,
            ),
          ),
          errorWidget: (context, url, error) => const Center(
            child: Icon(Icons.no_photography_sharp, color: Colors.grey),
          )
        ),
        _buttonBack()
      ],
    );
  }

}
