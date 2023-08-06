import 'package:app/modules/food/controller/food_controller.dart';
import 'package:app/modules/food/mock/food_detail_mock.dart';
import 'package:app/modules/food/models/food_detail_model/food_detail_model.dart';
import 'package:app/modules/food/page/food_list_by_category.dart';
import 'package:app/route/my_router.dart';
import 'package:app/route/pages_name.dart';
import 'package:app/shared/widgets/base_page.dart';
import 'package:app/shared/widgets/base_widget.dart';
import 'package:app/shared/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../navigator/controller/nav_controller.dart';
import '../../workout/widgets/list_cards_items.dart';
import '../widgets/items_wrap.dart';
import '../widgets/list_cards_food.dart';

class FoodPage extends BaseWidget<FoodController> {
  FoodPage({Key? key}) : super(key: key);

  final navController = Modular.get<NavController>();

  @override
  Widget build(BuildContext context) {

    return Observer(
        builder: (_) => BasePage(
        paddingPage: 0,
        showAppBar: false,
        body: ListView(
          children: [
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: text(
                  'O que você gostaria de cozinhar hoje?',
                  fontWeight: FontWeight.w600,
                  fontSize: 30
              ),
            ),
            const SizedBox(height: 40),
            Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: colors.text
                )
              ),
              child: Row(
                children: [
                  Flexible(
                    flex: 7,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        text('Encontre uma receita', fontWeight: FontWeight.w600),
                        const SizedBox(height: 5),
                        text('Nós te ajudamos a encontrar uma receita para fazer.'),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 4,
                    child: CustomButton(
                      cleanButton: true,
                      title: 'Ver receita',
                      colorTitle: colors.primary,
                      sizeTitle: 14,
                      onPress: (){},
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 40),
            ListCardFood(
                title: 'Receitas populares',
                seeMore: (){},
                listItems: _items3
            ),
            const SizedBox(height: 40),
            Container(
                color: colors.primary,
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: ListCardItems(
                    title: 'Em breve',
                    description: 'Aulas de culinária estão sendo finalizadas',
                    listItems: _items2,
                    invertColors: true
                )
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: text('Categorias', fontWeight: FontWeight.w700, fontSize: 24),
            ),
            const SizedBox(height: 20),
            ItemsWrapWidget(
              items: List.generate(_items.length, (index) => _items[index]),
            ),
            if(navController.videoSelected != null)
              space(0.12),
            if(navController.videoSelected == null)
              const SizedBox(height: 40),
          ],
        )
    ));
  }

  final List<CardFoodModel> _items3 = [
    CardFoodModel(
        title: 'SEI LA 2',
        onPress: (){
          MyRouter().pushNamed(
              PagesNames.foodDetail,
              arguments: FoodDetailMock.mockDetail()
          );
        },
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

  final List<ItemWrapModel> _items = [
    ItemWrapModel(
        image: 'https://images.pexels.com/photos/103124/pexels-photo-103124.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
        title: 'Café da manhã',
        onPress: (){
          MyRouter().push(FoodListByCategory(
            nameCategory: 'Café da manhã',
            listFoodDetailModel: List.generate(50, (index) => FoodDetailMock.mockDetail()),
          ));
        }
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
