import 'package:app/modules/workout/controller/workout_controller.dart';
import 'package:app/modules/workout/widgets/workout_loading.dart';
import 'package:app/route/pages_name.dart';
import 'package:app/shared/model/workout/program_model/program_model.dart';
import 'package:app/shared/widgets/base_page.dart';
import 'package:app/shared/widgets/base_widget.dart';
import 'package:app/shared/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:super_sliver_list/super_sliver_list.dart';
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
    controller.getWorkouts();
    return BasePage(
      onRefresh: () => controller.getWorkouts(force: true),
      backgroundColor: colors.background,
      showAppBar: false,
      paddingPage: 0,
      extendBodyBehindAppBar: true,
      elevation: 0,
      body: Observer(builder: (_){
        if(controller.state.comboProgramModel == null) {
          return const WorkoutLoading();
        }

        return Stack(
          children: [
            SuperListView(
              padding: MediaQuery.maybeOf(context)?.padding.copyWith(top: 0),
              children: [
                if(controller.state.topProgram != null)
                  TopPresentation(
                    cardItemModel: controller.state.topProgram!,
                    showUsers: false,
                  ),
                SuperListView.builder(
                  itemCount: controller.state.comboProgramModel!.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (_, index){
                    final item = controller.state.comboProgramModel![index];
                    final targetProgram = controller.state.comboProgramModel![index].targetProgram;
                    return Padding(
                      padding: EdgeInsets.only(top: index == 0 ? 0 : 40),
                      child: ListCardItems(
                          title: item.name,
                          listItems: List.generate(targetProgram.length, (index){
                            final program = targetProgram[index].program!;
                            return CardItemModel(
                              onPress: program.isSoon ? (){} : () => openVideo(program),
                              thumbnail: program.thumbnail,
                              description: program.description ?? '',
                              timeTraining: program.duration ?? '', trainer: program.difficulty,
                              showFavorite: false,
                              soon: program.isSoon,
                            );
                          })),
                    );
                  },
                ),
                space(0.07, context),
                _bottomCard(
                  'Precisa de ajuda?',
                  'Envie uma mensagem para nossa equipe de suporte',
                  'Fale com a gente', (){
                  router.pushNamed(PagesNames.profileHelp);
                },
                ),
              ],
            ),
          ],
        );
      }),
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
