import 'package:app/components/base_widget.dart';
import 'package:app/modules/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/base_page.dart';
import '../../../components/custom_bottom_navigation.dart';


class HomePage extends BaseWidget<HomeController> {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return controller.obx(
            (_) => BasePage(
              body: Center(child: text('TESTE')),
              bottomNavigationBar: const CustomBottomNavigation(),
            ),
    );
  }
}
