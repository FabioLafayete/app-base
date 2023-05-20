import 'package:app/util/util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobx/mobx.dart';

import '../../../components/bottom_sheet/botto_sheet_view_model.dart';

part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {


  final RxString _email = RxString('');
  final Rxn<String> _errorEmail = Rxn<String>();
  final Rxn<String> _errorCode = Rxn<String>();
  final RxBool _isLoading = RxBool(false);
  final RxBool _isLoadingSendCode = RxBool(false);

  HomeControllerBase() : super() {
    changeStatus();
  }

  void changeStatus(){}

}