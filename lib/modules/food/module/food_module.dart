import 'package:app/modules/food/page/food_detail_page.dart';
import 'package:app/modules/navigator/controller/nav_controller.dart';
import 'package:app/modules/navigator/page/nav_page.dart';
import 'package:app/shared/model/food/food_detail_model/food_detail_model.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FoodModule extends Module {
  @override
  void routes(r) {
    r.child(
        '/',
        child: (context) {
          Modular.get<NavController>().setSelectedIndex(1);
          return NavPage();
        }
    );
    r.child(
        '/detail',
        child: (context){
          FoodDetailModel item = r.args.data;
          return FoodDetailPage(
              model: item
          );
        }
    );
  }
}