import 'package:app/components/base_view_model.dart';
import 'package:get/get.dart';

class BottomSheetViewModel extends BaseViewModel<BottomSheetController> {

  final RxDouble _heightBottomSheet = RxDouble(0.5);

  double get heightBottomSheet => _heightBottomSheet.value;

  setHeightBottomSheet(double value) => _heightBottomSheet.value = value;

  @override
  void dispose() {
    setHeightBottomSheet(0.5);
    super.dispose();
  }

}

class BottomSheetController extends GetxController {}