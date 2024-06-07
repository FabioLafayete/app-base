import 'package:app/modules/home/controller/home_controller.dart';
import 'package:app/modules/navigator/controller/nav_controller.dart';
import 'package:app/shared/widgets/base_page.dart';
import 'package:app/shared/widgets/base_widget.dart';
import 'package:app/shared/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../food/widgets/list_cards_food.dart';
import '../../workout/widgets/list_cards_items.dart';
import '../../workout/widgets/top_presentation.dart';
import '../widgets/list_images_widget.dart';
import 'home_mock.dart';


class HomePage extends BaseState<HomeController> {
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
          HomeMock.listWorkout[0],
          const SizedBox(height: 40),
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
          HomeMock.listWorkout[1],
          const SizedBox(height: 60),
          ListImagesWidget(
            title: 'Programas',
            onPress: (){},
            listImages: List.generate(15, (index) =>
                ListImagesModel(
                    title: 'Teste',
                    image: 'https://images.pexels.com/photos/4327133/pexels-photo-4327133.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                    days: 8,
                    onPress: (){}
                )),
          ),
          const SizedBox(height: 60),
          _bottomCard(
              'Precisa de ajuda?',
              'Envie uma mensagem para nossa equipe de suporte',
              'Entrar em contato conosco',
                  (){}
          ),
        ],
      )
    );
  }

  Widget _bottomCard(
      String title,
      String description,
      String buttonName,
      Function() onPress){
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
      color: colors.primary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          text(
              title,
              color: colors.text2,
              fontWeight: FontWeight.w700,
              fontSize: 24
          ),
          const SizedBox(height: 30),
          text(
              description,
              color: colors.text2,
              fontWeight: FontWeight.w400,
          ),
          const SizedBox(height: 30),
          MyButton(
            title: buttonName,
            onPress: onPress,
            colorButton: colors.text2,
            colorTitle: colors.primary,
          ),
        ],
      ),
    );
  }

}