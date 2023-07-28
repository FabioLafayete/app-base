import 'package:app/modules/food/models/food_detail_model/food_detail_model.dart';

abstract class FoodDetailMock{

  static FoodDetailModel mockDetail (){
    return const FoodDetailModel(
      image: 'https://images.pexels.com/photos/1640772/pexels-photo-1640772.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      name: 'Omelete de legumes com batata e guacamole',
      description: '',
      type: 'Almoço',
      duration: '30 min',
      difficulty: 'Média',
      servings: 2,
      isFavorite: true,
      kcal: 210,
      fats: 91,
      carbs: 65,
      proteins: 27,
      ingredients: [
        '1 colher de sopa óleo',
        '10 g salsinha',
        '1 grande ovo',
        '1 xícara abobrinha ralada',
        '1 xícara, cortados ou fatiados tomate',
        '1 pitada sal',
        '1 xícara, raladas cenoura',
      ],
      preparation: 'Numa tigela, bata os ovos com o sal. Acrescente os legumes ralados e a salsinha picadinha.\n'
          'Em fogo baixo, numa frigideira anti aderente, acrescente o óleo.\n'
          'Coloque da receita, deixe dourar, vire e frite do outro lado. Sirva com alface picada e tomate.'
    );
  }

}