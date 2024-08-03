import 'dart:math';

import 'package:app/modules/food/controller/food_controller.dart';
import 'package:app/modules/food/page/food_list_by_category.dart';
import 'package:app/route/my_router.dart';
import 'package:app/route/pages_name.dart';
import 'package:app/shared/widgets/base_page.dart';
import 'package:app/shared/widgets/base_widget.dart';
import 'package:app/shared/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:super_sliver_list/super_sliver_list.dart';
import '../../navigator/controller/nav_controller.dart';
import '../../workout/widgets/list_cards_items.dart';
import '../widgets/items_wrap.dart';
import '../widgets/list_cards_food.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({Key? key}) : super(key: key);

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends ViewState<FoodPage, FoodController> {
  final navController = Modular.get<NavController>();

  late dynamic tr;

  @override
  Widget build(BuildContext context) {
    tr = local.tr['food'];
    controller.generateListFood();
    return Observer(
      builder: (_) => BasePage(
        paddingPage: 0,
        showAppBar: false,
        body: SuperListView(
          children: [
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: text(
                tr['title'],
                fontWeight: FontWeight.w600,
                fontSize: 30,
              ),
            ),
            const SizedBox(height: 40),
            _randomFood(),
            const SizedBox(height: 40),
            ListCardFood(
              title: tr['popularFoods'],
              listItems: controller.listFoodDetail.take(20).map((e) {
                return CardFoodModel(
                  title: e.name!,
                  kcal: e.kcal.toString(),
                  duration: e.duration,
                  onPress: () {
                    router.pushNamed(
                      PagesNames.foodDetail,
                      arguments: e,
                    );
                  },
                  thumbnail: e.image!,
                );
              }).toList(),
            ),
            const SizedBox(height: 40),
            Container(
              color: colors.primary,
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: ListCardItems(
                title: tr['soon']['title'],
                description: tr['soon']['description'],
                listItems: _soonVideos,
                invertColors: true,
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: text(
                tr['categories']['title'],
                fontWeight: FontWeight.w700,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 20),
            ItemsWrapWidget(
              items: List.generate(
                _categories().length,
                (index) => _categories()[index],
              ),
            ),
            if (navController.videoSelected != null) space(0.12),
            if (navController.videoSelected == null) const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _randomFood() {
    return Container(
      padding: const EdgeInsets.all(16).copyWith(right: 0),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 1.5,
          color: colors.text,
        ),
      ),
      child: Row(
        children: [
          Flexible(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                text(
                  tr['findFood']['title'],
                  fontWeight: FontWeight.w600,
                ),
                const SizedBox(height: 5),
                text(
                  tr['findFood']['description'],
                ),
              ],
            ),
          ),
          Flexible(
            flex: 4,
            child: MyButton(
              cleanButton: true,
              title: tr['findFood']['seeFood'],
              colorTitle: colors.primary,
              onPress: () {
                final item = Random().nextInt(controller.listFoodDetail.length);
                router.pushNamed(
                  PagesNames.foodDetail,
                  arguments: controller.listFoodDetail[item],
                );
              },
            ),
          )
        ],
      ),
    );
  }

  final List<CardItemModel> _soonVideos = [
    CardItemModel(
        onPress: () {},
        thumbnail: 'assets/images/foods/soon_01.png',
        description: 'Aquela janta rápida e gostosa',
        typeTraining: 'JANTA',
        timeTraining: '20 min',
        showFavorite: false,
        soon: true,
        trainer: 'Rodrigo Luis'),
    CardItemModel(
      onPress: () {},
      thumbnail: 'assets/images/foods/soon_02.png',
      description: 'Para a família',
      typeTraining: 'ALMOÇO',
      timeTraining: '1 hora',
      showFavorite: false,
      soon: true,
      trainer: 'Roberta Souza',
    ),
  ];

  List<ItemWrapModel> _categories() => [
        ItemWrapModel(
            image: 'assets/images/foods/category/pexels-photo-103124.jpg',
            title: tr['categories']['breakfast'],
            onPress: () {
              final item = controller.listFoodDetail;
              MyRouter().push(FoodListByCategory(
                nameCategory: tr['categories']['breakfast'],
                listFoodDetailModel: item
                    .where(
                      (e) => e.category == tr['categories']['breakfast'],
                    )
                    .toList(),
              ));
            }),
        ItemWrapModel(
            image: 'assets/images/foods/category/pexels-photo-5710178.jpeg',
            title: tr['categories']['lunch'],
            onPress: () {
              final item = controller.listFoodDetail;
              MyRouter().push(FoodListByCategory(
                nameCategory: tr['categories']['lunch'],
                listFoodDetailModel: item
                    .where(
                      (e) => e.category == tr['categories']['lunch'],
                    )
                    .toList(),
              ));
            }),
        ItemWrapModel(
            image: 'assets/images/foods/category/pexels-photo-2092906.jpeg',
            title: tr['categories']['dinner'],
            onPress: () {
              final item = controller.listFoodDetail;
              MyRouter().push(FoodListByCategory(
                nameCategory: tr['categories']['dinner'],
                listFoodDetailModel: item
                    .where(
                      (e) => e.category == tr['categories']['dinner'],
                    )
                    .toList(),
              ));
            }),
        ItemWrapModel(
            image: 'assets/images/foods/category/pexels-photo-3889844.jpeg',
            title: tr['categories']['beverages'],
            onPress: () {
              final item = controller.listFoodDetail;
              MyRouter().push(FoodListByCategory(
                nameCategory: tr['categories']['beverages'],
                listFoodDetailModel: item
                    .where(
                      (e) => e.category == tr['categories']['beverages'],
                    )
                    .toList(),
              ));
            }),
        ItemWrapModel(
            image: 'assets/images/foods/category/pexels-photo-257816.jpg',
            title: tr['categories']['salads'],
            onPress: () {
              final item = controller.listFoodDetail;
              MyRouter().push(FoodListByCategory(
                nameCategory: tr['categories']['salads'],
                listFoodDetailModel: item
                    .where(
                      (e) => e.category == tr['categories']['salads'],
                    )
                    .toList(),
              ));
            }),
        ItemWrapModel(
            image: 'assets/images/foods/category/pexels-photo-1351238.jpeg',
            title: tr['categories']['vegan'],
            onPress: () {
              final item = controller.listFoodDetail;
              MyRouter().push(FoodListByCategory(
                nameCategory: tr['categories']['vegan'],
                listFoodDetailModel: item
                    .where(
                      (e) => e.category == tr['categories']['vegan'],
                    )
                    .toList(),
              ));
            }),
        ItemWrapModel(
            image: 'assets/images/foods/category/pexels-photo-5836776.jpeg',
            title: tr['categories']['snacks'],
            onPress: () {
              final item = controller.listFoodDetail;
              MyRouter().push(FoodListByCategory(
                nameCategory: tr['categories']['snacks'],
                listFoodDetailModel: item
                    .where(
                      (e) => e.category == tr['categories']['snacks'],
                    )
                    .toList(),
              ));
            }),
        ItemWrapModel(
            image: 'assets/images/foods/category/pexels-photo-3026804.jpeg',
            title: tr['categories']['desserts'],
            onPress: () {
              final item = controller.listFoodDetail;
              MyRouter().push(FoodListByCategory(
                nameCategory: tr['categories']['desserts'],
                listFoodDetailModel: item
                    .where(
                      (e) => e.category == tr['categories']['desserts'],
                    )
                    .toList(),
              ));
            }),
      ];
}
