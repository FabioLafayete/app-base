import 'package:app/components/base_widget.dart';
import 'package:app/modules/home/controller/home_controller.dart';
import 'package:app/modules/navigator/controller/nav_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../components/base_page.dart';
import '../../food/widgets/list_cards_food.dart';
import '../../workout/widgets/list_cards_items.dart';
import '../../workout/widgets/top_presentation.dart';
import 'home_mock.dart';


class HomePage extends BaseWidget<HomeController> {
  HomePage({Key? key}) : super(key: key);

  final navController = Modular.get<NavController>();

  @override
  Widget build(BuildContext context) {

    return BasePage(
      backgroundColor: colors.background,
      showAppBar: false,
      paddingPage: 0,
      body: ListView(
        padding: MediaQuery.of(context).padding.copyWith(top: 0),
        children: [
          TopPresentation(cardItemModel: HomeMock.listWorkout[2].listItems[1]),
          const SizedBox(height: 40),
          HomeMock.listWorkout[1],
          const SizedBox(height: 60),
          ListCardFood(
              title: 'Receitas populares',
              seeMore: (){},
              listItems: HomeMock.listFood
          ),
          const SizedBox(height: 60),
          Container(
              color: colors.primary,
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: ListCardItems(
                  title: 'Em breve',
                  listItems: HomeMock.listFoodSoon,
                  invertColors: true
              )
          ),
          const SizedBox(height: 60),
        ],
      )
    );
  }
}