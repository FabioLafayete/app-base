import 'package:app/modules/workout/controller/workout_controller.dart';
import 'package:app/shared/widgets/base_page.dart';
import 'package:app/shared/widgets/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:video_player/video_player.dart';
import '../../../shared/model/video/video_model.dart';
import '../../navigator/controller/nav_controller.dart';
import '../widgets/list_cards_items.dart';
import '../widgets/top_presentation.dart';

class WorkoutPage extends BaseWidget<WorkoutController> {
  WorkoutPage({Key? key}) : super(key: key);

  final navController = Modular.get<NavController>();

  void openVideo (){
    // navController.setVideoSelected(
    //     const VideoModel(
    //         name: 'TESTE DE VIDEO 1',
    //         url: 'https://stream.mux.com/Fz9TDH4f13E2rtwMMW4TGEgF4vioyKmi32I8IVKgENg.m3u8',
    //         type: DataSourceType.network
    //     )
    // );

    // navController.setVideoSelected(
    //     const VideoModel(
    //         name: 'TESTE DE VIDEO 1',
    //         url: 'https://player.vimeo.com/progressive_redirect/playback/675622290/rendition/360p?loc=external&oauth2_token_id=1406393538&signature=1545279f8150f119095ae76eb3326158500e1a9f3b2df1ed271917f4e3d0af2d',
    //         type: DataSourceType.network
    //     )
    // );

    navController.setVideoSelected(
        const VideoModel(
            name: 'TESTE DE VIDEO 1',
            url: 'https://player.vimeo.com/progressive_redirect/playback/792225316/container/7c12ba45-32b3-4711-b209-412fceb9236a/fbf16dfe-ba2a38ab?expires=1694798578&loc=external&oauth2_token_id=1621307933&session_id=49ed4a1818a451a53ee3e93f2b001336c0c420bb1694712058&signature=18d537a05798b5c229e3f6a6000811aeaa7fe5ad5c9dae78620a7c0f375deb69',
            type: DataSourceType.network
        )
    );

    // navController.setVideoSelected(
    //     const VideoModel(
    //         name: 'TESTE DE VIDEO 1',
    //         url: 'https://player.vimeo.com/progressive_redirect/playback/video_id/rendition/1080p/file.mp4',
    //         type: DataSourceType.network
    //     )
    // );
    navController.miniplayerController.animateToHeight(state: PanelState.MAX);
  }

  @override
  Widget build(BuildContext context) {

    final List<ListCardItems> _list = [
      ListCardItems(title: 'Corpo todo', seeMore: (){}, listItems: [
        CardItemModel(
            title: 'SEI LA 2',
            onPress: openVideo,
            thumbnail: 'https://images.pexels.com/photos/863977/pexels-photo-863977.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
            description: 'Queime gordura no ritmo',
            typeTraining: 'RESISTENCIA',
            timeTraining: '15 min',
            trainer: 'Roberta Souza'
        ),
        CardItemModel(
            title: 'SEI LA 2',
            onPress: openVideo,
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
            onPress: openVideo,
            thumbnail: 'https://images.pexels.com/photos/4754133/pexels-photo-4754133.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
            description: 'Suando com Muay Thai',
            typeTraining: 'Muay Thai',
            timeTraining: '15 min',
            trainer: 'Mariana Cardoso'
        ),
        CardItemModel(
            title: 'SEI LA 2',
            onPress: openVideo,
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
            onPress: openVideo,
            thumbnail: 'https://images.pexels.com/photos/5384538/pexels-photo-5384538.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
            description: 'Alongue-se com yoga',
            typeTraining: 'Yoga',
            timeTraining: '15 min',
            trainer: 'Caio Santos'
        ),
        CardItemModel(
            title: 'SEI LA 2',
            onPress: openVideo,
            thumbnail: 'https://images.pexels.com/photos/2908175/pexels-photo-2908175.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
            description: 'Treinando a repiração',
            typeTraining: 'Corpo',
            timeTraining: '20 min',
            trainer: 'Monge Li'
        ),
      ]),
    ];

    return BasePage(
      backgroundColor: colors.background,
      showAppBar: false,
      paddingPage: 0,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          ListView(
              padding: MediaQuery.maybeOf(context)?.padding.copyWith(top: 0),
              children: [
                TopPresentation(
                  cardItemModel: _list[2].listItems[1],
                  showUsers: false,
                ),
                Column(
                  children: List.generate(
                      _list.length,
                          (index) => Container(
                        margin: const EdgeInsets.only(top: 30),
                        child: _list[index],
                      )
                  ),
                ),
                if(navController.videoSelected != null)
                  space(0.12),
                if(navController.videoSelected == null)
                  space(0.03),
              ]
          ),
          // Container(
          //   color: colors.primary.withOpacity(0.9),
          //   width: width,
          //   height: height,
          //   child: Padding(
          //     padding: const EdgeInsets.all(30),
          //     child: Column(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         const SizedBox(height: 100),
          //         text(
          //             'Quase la...',
          //             fontSize: 40,
          //             fontWeight: FontWeight.w700,
          //             color: colors.background
          //         ),
          //         const SizedBox(height: 20),
          //         text(
          //             'Estamos terminando de gravar as aulas de treinamentos.\n\nAvisaremos assim que estiver pronto',
          //             fontSize: 20,
          //             fontWeight: FontWeight.w600,
          //             textAlign: TextAlign.left,
          //             height: 1.5,
          //             color: colors.background,
          //         ),
          //       ],
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }

}
