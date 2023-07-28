import 'package:app/modules/food/models/food_detail_model/food_detail_model.dart';
import 'package:app/modules/food/page/food_detail_page.dart';
import 'package:app/modules/navigator/page/nav_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FoodModule extends Module {
  @override
  List<ModularRoute> get routes => [
    ChildRoute(
        '/',
        child: (context, args) => NavPage(index: 1)
    ),
    ChildRoute(
        '/detail',
        child: (context, args){
          FoodDetailModel item = args.data;
          return FoodDetailPage(
              model: item
          );
        }
    ),

  ];
}