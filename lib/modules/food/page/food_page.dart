import 'package:app/components/base_page.dart';
import 'package:app/modules/food/controller/food_controller.dart';
import 'package:flutter/material.dart';
import '../../../components/base_widget.dart';
import '../widgets/items_wrap.dart';

class FoodPage extends BaseWidget<FoodController> {
  FoodPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePage(
        body: ListView(
          children: [
            ItemsWrapWidget(
              items: List.generate(10, (index) => ItemWrapModel(
                  image: 'https://images.pexels.com/photos/376464/pexels-photo-376464.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                  title: 'TESTE 01',
                  onPress: (){}
              ),),
            )
          ],
        )
    );
  }
}
