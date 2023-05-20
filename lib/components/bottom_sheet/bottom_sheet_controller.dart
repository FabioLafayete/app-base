import 'package:mobx/mobx.dart';

part 'bottom_sheet_controller.g.dart';

class BottomSheetController = BottomSheetControllerBase with _$BottomSheetController;

abstract class BottomSheetControllerBase with Store {

  @observable
  double heightBottomSheet = 0.35;

  @action
  setHeightBottomSheet(double value) => heightBottomSheet = value;

  // @override
  // void dispose() {
  //   setHeightBottomSheet(0.5);
  //   super.dispose();
  // }

}