import 'package:flutter_modular/flutter_modular.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:video_player/video_player.dart';

import '../../../shared/model/video/video_model.dart';
import '../../food/widgets/list_cards_food.dart';
import '../../navigator/controller/nav_controller.dart';
import '../../workout/widgets/list_cards_items.dart';

class HomeMock {

  static final List<ListCardItems> listWorkout = [
    ListCardItems(title: 'Corpo todo', seeMore: (){}, listItems: [
      CardItemModel(
          title: 'SEI LA 2',
          onPress: (){
            final navController = Modular.get<NavController>();
            navController.setVideoSelected(
                const VideoModel(
                    name: 'TESTE DE VIDEO 1',
                    url: 'https://stream.mux.com/Fz9TDH4f13E2rtwMMW4TGEgF4vioyKmi32I8IVKgENg.m3u8',
                    type: DataSourceType.network
                )
            );
            navController.miniplayerController.animateToHeight(state: PanelState.MAX);
          },
          thumbnail: 'https://images.pexels.com/photos/863977/pexels-photo-863977.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
          description: 'Queime gordura no ritmo',
          typeTraining: 'RESISTENCIA',
          timeTraining: '15 min',
          trainer: 'Roberta Souza'
      ),
      CardItemModel(
          title: 'SEI LA 2',
          onPress: (){
            final navController = Modular.get<NavController>();
            navController.setVideoSelected(
                const VideoModel(
                    name: 'TESTE DE VIDEO 2',
                    url: 'https://stream.mux.com/aW5YBw2S7rWwXZgNtrcNA5p3EjphlRTKOO3c502Fp02Sk.m3u8',
                    type: DataSourceType.network
                )
            );
            navController.miniplayerController.animateToHeight(state: PanelState.MAX);
          },
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
          onPress: (){},
          thumbnail: 'https://images.pexels.com/photos/4754133/pexels-photo-4754133.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
          description: 'Suando com Muay Thai',
          typeTraining: 'Muay Thai',
          timeTraining: '15 min',
          trainer: 'Mariana Cardoso'
      ),
      CardItemModel(
          title: 'SEI LA 2',
          onPress: (){},
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
          onPress: (){},
          thumbnail: 'https://images.pexels.com/photos/5384538/pexels-photo-5384538.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
          description: 'Alongue-se com yoga',
          typeTraining: 'Yoga',
          timeTraining: '15 min',
          trainer: 'Caio Santos'
      ),
      CardItemModel(
          title: 'SEI LA 2',
          onPress: (){},
          thumbnail: 'https://images.pexels.com/photos/2908175/pexels-photo-2908175.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
          description: 'Treinando a repiração',
          typeTraining: 'Corpo',
          timeTraining: '20 min',
          trainer: 'Monge Li'
      ),
    ]),
  ];

  static final List<CardItemModel> listFoodSoon = [
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

  static final List<CardFoodModel> listFood = [
    CardFoodModel(
        title: 'SEI LA 2',
        onPress: (){},
        thumbnail: 'https://images.pexels.com/photos/103124/pexels-photo-103124.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    ),
    CardFoodModel(
        title: 'SEI LA 2',
        onPress: (){},
        thumbnail: 'https://images.pexels.com/photos/5710178/pexels-photo-5710178.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    ),
    CardFoodModel(
        title: 'SEI LA 2',
        onPress: (){},
        thumbnail: 'https://images.pexels.com/photos/1351238/pexels-photo-1351238.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    )
  ];
}