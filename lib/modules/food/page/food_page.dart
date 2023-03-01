import 'package:app/components/base_page.dart';
import 'package:app/modules/food/controller/food_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../components/base_widget.dart';
import '../../navigator/controller/nav_controller.dart';
import '../../workout/widgets/list_cards_items.dart';
import '../../workout/widgets/top_presentation.dart';
import '../widgets/items_wrap.dart';
import '../widgets/list_cards_food.dart';

class FoodPage extends BaseWidget<FoodController> {
  FoodPage({Key? key}) : super(key: key);

  final navController = Get.find<NavController>();

  @override
  Widget build(BuildContext context) {

    return Obx(() => BasePage(
        padding: 0,
        showAppBar: false,
        body: ListView(
          children: [
            space(0.03),
            ListCardFood(
              title: 'Receitas populares',
              seeMore: (){},
              listItems: _items3
            ),
            space(0.03),
            Container(
                color: colors.primary,
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: ListCardItems(title: 'Em breve', listItems: _items2, invertColors: true)
            ),
            space(0.03),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: text('Categorias', fontWeight: FontWeight.w700, fontSize: 20),
            ),
            space(0.02),
            ItemsWrapWidget(
              items: List.generate(_items.length, (index) => _items[index]),
            ),
            if(navController.videoSelected != null)
              space(0.12),
            if(navController.videoSelected == null)
              space(0.03),
          ],
        )
    ));
  }

  List<CardFoodModel> _items3 = [
    CardFoodModel(
        title: 'SEI LA 2',
        onPress: (){},
        thumbnail: 'https://images.pexels.com/photos/103124/pexels-photo-103124.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
        description: 'Pão com Ovo',
        typeTraining: 'RESISTENCIA',
        timeTraining: '15 min',
        trainer: 'Roberta Souza'
    ),
    CardFoodModel(
        title: 'SEI LA 2',
        onPress: (){},
        thumbnail: 'https://images.pexels.com/photos/5710178/pexels-photo-5710178.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
        description: 'Macarrão com camarão e molho poro e alguma coisa a mais ai',
        typeTraining: 'RESISTENCIA',
        timeTraining: '15 min',
        trainer: 'Roberta Souza'
    ),
    CardFoodModel(
        title: 'SEI LA 2',
        onPress: (){},
        thumbnail: 'https://images.pexels.com/photos/1351238/pexels-photo-1351238.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
        description: 'Macarrão com camarão',
        typeTraining: 'RESISTENCIA',
        timeTraining: '15 min',
        trainer: 'Roberta Souza'
    )
  ];

  List<CardItemModel> _items2 = [
    CardItemModel(
        title: 'SEI LA 2',
        onPress: (){},
        thumbnail: 'https://images.pexels.com/photos/8629098/pexels-photo-8629098.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
        description: 'Aquela janta rápida e gostosa',
        typeTraining: 'JANTA',
        timeTraining: '20 min',
        showFavorite: false,
        soon: true,
        trainer: 'Rodrigo Luis'
    ),
    CardItemModel(
      title: 'SEI LA 2',
      onPress: (){},
      thumbnail: 'https://images.pexels.com/photos/4259140/pexels-photo-4259140.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      description: 'Para a família',
      typeTraining: 'ALMOÇO',
      timeTraining: '1 hora',
      showFavorite: false,
      soon: true,
      trainer: 'Roberta Souza',
    ),
  ];

  List<ItemWrapModel> _items = [
    ItemWrapModel(
        image: 'https://images.pexels.com/photos/103124/pexels-photo-103124.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
        title: 'Café da manhã',
        onPress: (){}
    ),
    ItemWrapModel(
        image: 'https://images.pexels.com/photos/5710178/pexels-photo-5710178.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
        title: 'Almoço',
        onPress: (){}
    ),
    ItemWrapModel(
        image: 'https://images.pexels.com/photos/2092906/pexels-photo-2092906.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
        title: 'Janta',
        onPress: (){}
    ),
    ItemWrapModel(
        image: 'https://images.pexels.com/photos/3889844/pexels-photo-3889844.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
        title: 'Bebidas',
        onPress: (){}
    ),
    ItemWrapModel(
        image: 'https://images.pexels.com/photos/257816/pexels-photo-257816.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
        title: 'Saladas',
        onPress: (){}
    ),
    ItemWrapModel(
        image: 'https://images.pexels.com/photos/1351238/pexels-photo-1351238.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
        title: 'Vegano',
        onPress: (){}
    ),
    ItemWrapModel(
        image: 'https://images.pexels.com/photos/5836776/pexels-photo-5836776.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
        title: 'Lanche',
        onPress: (){}
    ),
    ItemWrapModel(
        image: 'https://images.pexels.com/photos/3026804/pexels-photo-3026804.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
        title: 'Doce',
        onPress: (){}
    ),

  ];
}
