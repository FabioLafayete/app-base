import 'package:app/modules/workout/controller/workout_controller.dart';
import 'package:app/modules/workout/mock/workout_detail_mock.dart';
import 'package:app/modules/workout/mock/workout_json.dart';
import 'package:app/route/pages_name.dart';
import 'package:app/shared/model/workout/program_model/program_model.dart';
import 'package:app/shared/widgets/base_page.dart';
import 'package:app/shared/widgets/base_widget.dart';
import 'package:app/shared/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../navigator/controller/nav_controller.dart';
import '../widgets/list_cards_items.dart';
import '../widgets/top_presentation.dart';

class WorkoutPage extends BaseWidget<WorkoutController> {
  WorkoutPage({Key? key}) : super(key: key);

  final navController = Modular.get<NavController>();

  void openVideo (ProgramModel model){
    controller.setProgramModel(model);
    router.pushNamed(PagesNames.workoutDetail);
  }

  @override
  Widget build(BuildContext context) {

    final List<ListCardItems> list = [
      ListCardItems(title: 'Feitos para você', listItems: [
        CardItemModel(
            title: 'SEI LA 2',
            onPress: () => openVideo(programs[0]),
            thumbnail: programs[0].thumbnail,
            description: programs[0].description ?? '',
            typeTraining: 'RESISTENCIA',
            timeTraining: programs[0].duration ?? '',
            trainer: 'Roberta Souza'
        ),
        CardItemModel(
            title: 'SEI LA 2',
            onPress: () => openVideo(programs[1]),
            thumbnail: programs[1].thumbnail,
            description: programs[1].description ?? '',
            typeTraining: 'RESISTENCIA',
            timeTraining: programs[1].duration ?? '',
            trainer: 'Roberta Souza'
        ),
        CardItemModel(
            title: 'SEI LA 2',
            onPress: () => openVideo(programs[1]),
            thumbnail: programs[2].thumbnail,
            description: programs[2].description ?? '',
            typeTraining: 'RESISTENCIA',
            timeTraining: programs[2].duration ?? '',
            trainer: 'Roberta Souza'
        ),
      ]),
      ListCardItems(title: 'Desafios', listItems: [
        CardItemModel(
            title: 'SEI LA 2',
            onPress: () => openVideo(programs[3]),
            thumbnail: programs[3].thumbnail,
            description: programs[3].description ?? '',
            typeTraining: 'RESISTENCIA',
            timeTraining: programs[3].duration ?? '',
            trainer: 'Roberta Souza'
        ),
        CardItemModel(
            title: 'SEI LA 2',
            onPress: () => openVideo(programs[3]),
            thumbnail: programs[4].thumbnail,
            description: programs[4].description ?? '',
            typeTraining: 'RESISTENCIA',
            timeTraining: programs[4].duration ?? '',
            trainer: 'Roberta Souza'
        ),
        CardItemModel(
            title: 'SEI LA 2',
            onPress: () => openVideo(programs[3]),
            thumbnail: programs[5].thumbnail,
            description: programs[5].description ?? '',
            typeTraining: 'RESISTENCIA',
            timeTraining: programs[5].duration ?? '',
            trainer: 'Roberta Souza'
        ),
      ]),
      ListCardItems(title: 'Treinos em casa', listItems: [
        CardItemModel(
            title: 'SEI LA 2',
            onPress: () => openVideo(programs[1]),
            thumbnail: programs[6].thumbnail,
            description: programs[6].description ?? '',
            typeTraining: 'RESISTENCIA',
            timeTraining: programs[6].duration ?? '',
            trainer: 'Roberta Souza'
        ),
        CardItemModel(
            title: 'SEI LA 2',
            onPress: () => openVideo(programs[1]),
            thumbnail: programs[7].thumbnail,
            description: programs[7].description ?? '',
            typeTraining: 'RESISTENCIA',
            timeTraining: programs[7].duration ?? '',
            trainer: 'Roberta Souza'
        ),
        CardItemModel(
            title: 'SEI LA 2',
            onPress: () => openVideo(programs[1]),
            thumbnail: programs[8].thumbnail,
            description: programs[8].description ?? '',
            typeTraining: 'RESISTENCIA',
            timeTraining: programs[8].duration ?? '',
            trainer: 'Roberta Souza'
        ),
      ]),
    ];

    return BasePage(
      backgroundColor: colors.background,
      showAppBar: false,
      paddingPage: 0,
      extendBodyBehindAppBar: true,
      elevation: 0,
      body: Stack(
        children: [
          ListView(
            physics: const ClampingScrollPhysics(),
              padding: MediaQuery.maybeOf(context)?.padding.copyWith(top: 0),
              children: [
                TopPresentation(
                  cardItemModel: list[2].listItems[1],
                  showUsers: false,
                ),
                Column(
                  children: List.generate(
                      list.length,
                          (index) => Container(
                        margin: const EdgeInsets.only(top: 30),
                        child: list[index],
                      )
                  ),
                ),
                space(0.07),
                _bottomCard(
                  'Precisa de ajuda?',
                  'Envie uma mensagem para nossa equipe de suporte',
                  'Fale com a gente', (){
                    router.pushNamed(PagesNames.profileHelp);
                    },
                ),
              ]
          ),
        ],
      ),
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
