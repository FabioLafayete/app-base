import 'package:app/modules/workout/controller/workout_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/base_page.dart';
import '../../../components/base_widget.dart';
import '../widgets/list_cards_items.dart';

class WorkoutPage extends BaseWidget<WorkoutController> {
  WorkoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (_) => BasePage(
        backgroundColor: colors.background,
        showAppBar: true,
        padding: 0,
        title: 'Treinos',
        body: ListView(
            children: List.generate(
                _list.length,
                (index) => Container(
                  margin: const EdgeInsets.only(top: 30),
                  child: _list[index],
                )
            )
        ),
      ),
    );
  }

  final List<ListCardItems> _list = [
    ListCardItems(title: 'Corpo todo', seeMore: (){}, listItems: [
      CardItemModel(
          title: 'SEI LA 2',
          thumbnail: 'https://images.pexels.com/photos/416778/pexels-photo-416778.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
          description: 'Queime gordura no ritmo',
          typeTraining: 'RESISTENCIA',
          timeTraining: '15 min',
          trainer: 'Roberta Souza'
      ),
      CardItemModel(
          title: 'SEI LA 2',
          thumbnail: 'https://images.pexels.com/photos/2780762/pexels-photo-2780762.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
          description: 'Crie resistencia',
          typeTraining: 'RESISTENCIA',
          timeTraining: '10 min',
          trainer: 'Sabrina Luisa'
      ),
    ]),
    ListCardItems(title: 'Luta', seeMore: (){}, listItems: [
      CardItemModel(
          title: 'SEI LA 2',
          thumbnail: 'https://images.pexels.com/photos/4754133/pexels-photo-4754133.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
          description: 'Suando com Muay Thai',
          typeTraining: 'Muay Thai',
          timeTraining: '15 min',
          trainer: 'Mariana Cardoso'
      ),
      CardItemModel(
          title: 'SEI LA 2',
          thumbnail: 'https://images.pexels.com/photos/8810062/pexels-photo-8810062.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
          description: 'Respire e bata',
          typeTraining: 'Boxe',
          timeTraining: '10 min',
          trainer: 'Joao Carlos'
      ),
    ]),
    ListCardItems(title: 'Meditação', seeMore: (){}, listItems: [
      CardItemModel(
          title: 'SEI LA 2',
          thumbnail: 'https://images.pexels.com/photos/5384538/pexels-photo-5384538.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
          description: 'Alongue-se com yoga',
          typeTraining: 'Yoga',
          timeTraining: '15 min',
          trainer: 'Caio Santos'
      ),
      CardItemModel(
          title: 'SEI LA 2',
          thumbnail: 'https://images.pexels.com/photos/2908175/pexels-photo-2908175.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
          description: 'Treinando a repiração',
          typeTraining: 'Corpo',
          timeTraining: '20 min',
          trainer: 'Monge Li'
      ),
    ]),
  ];
}
