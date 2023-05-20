import 'package:app/components/base_view_model.dart';
import 'package:get/get.dart';
import 'package:mobx/mobx.dart';

part 'bottom_sheet_controller.g.dart';

class BottomSheetController = BottomSheetControllerBase with _$BottomSheetController;

abstract class BottomSheetControllerBase with Store {

  @observable
  RxDouble _heightBottomSheet = RxDouble(0.5);

  @computed
  double get heightBottomSheet => _heightBottomSheet.value;

  @action
  setHeightBottomSheet(double value) => _heightBottomSheet.value = value;

  // @override
  // void dispose() {
  //   setHeightBottomSheet(0.5);
  //   super.dispose();
  // }

}