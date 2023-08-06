import 'package:app/modules/food/models/food_detail_model/food_detail_model.dart';
import 'package:app/modules/food/widgets/items_wrap.dart';
import 'package:app/shared/widgets/base_page.dart';
import 'package:app/shared/widgets/base_widget.dart';
import 'package:flutter/material.dart';

import '../../../route/pages_name.dart';
import '../mock/food_detail_mock.dart';

class FoodListByCategory extends BaseWidget {
  FoodListByCategory({
    super.key,
    required this.listFoodDetailModel,
    required this.nameCategory,
  });

  String nameCategory;
  List<FoodDetailModel> listFoodDetailModel;

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: nameCategory,
      paddingPage: 0,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: ItemsWrapWidget(
            items: List.generate(listFoodDetailModel.length, (index){
              return ItemWrapModel(
                  image: listFoodDetailModel[index].image!,
                  title: listFoodDetailModel[index].name!,
                  onPress: (){
                    router.pushNamed(
                        PagesNames.foodDetail,
                        arguments: listFoodDetailModel[index]
                    );
                  }
              );
            }),
          ),
        ),
      )
    );
  }
}
