import 'package:app/modules/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../components/base_page.dart';
import '../../components/base_widget.dart';
import '../../util/theme.dart';

class HomePage extends BaseWidget<HomeViewModel> {

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.theme.backgroundColor;
    var themeController = Get.find<Themes>();
    return Obx(() =>  BasePage(
      title: 'Posts',
      automaticallyImplyLeading: false,
      actions: [
        IconButton(
          onPressed: (){
            themeController.toggleDarkMode();
            viewModel.setIsDarkTheme(!viewModel.isDarkTheme);
          },
          color: colors.textSecondary,
          icon: Icon(viewModel.isDarkTheme ?
          Icons.dark_mode_outlined :
          Icons.light_mode_outlined
          ),
        )
      ],
      body: Center(child: text('teste'),),
    ));
  }


}
