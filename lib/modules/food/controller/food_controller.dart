import 'package:app/config/app_local.dart';
import 'package:app/modules/food/mock/food_detail_eng_mock.dart';
import 'package:app/modules/food/mock/food_detail_mock.dart';
import 'package:app/shared/model/food/food_detail_model/food_detail_model.dart';
import 'package:mobx/mobx.dart';

part 'food_controller.g.dart';

class FoodController = FoodControllerBase with _$FoodController;

abstract class FoodControllerBase with Store {

  FoodControllerBase();

  @observable
  List<FoodDetailModel> listFoodDetail = [];

  @action
  setListFoodDetail(List<FoodDetailModel> value) => listFoodDetail = List.from(value);

  generateListFood(){
    final local = AppLocal();

    List<FoodDetailModel> value = (local.local.value == LanguageLocal.pt ?
    FoodDetailMock.mockJson() :
    FoodDetailEngMock.mockEngJson())
        .map((e) => FoodDetailModel.fromJson(e))
        .toList();
    setListFoodDetail(value);
  }

}