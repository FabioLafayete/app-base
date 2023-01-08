import 'package:app/util/util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/bottom_sheet/botto_sheet_view_model.dart';

class HomeController extends GetxController with StateMixin {


  final RxString _email = RxString('');
  final Rxn<String> _errorEmail = Rxn<String>();
  final Rxn<String> _errorCode = Rxn<String>();
  final RxBool _isLoading = RxBool(false);
  final RxBool _isLoadingSendCode = RxBool(false);

  HomeController() : super() {
    changeStatus();
  }

  void changeStatus(){
    change(null, status: RxStatus.success());
  }

}