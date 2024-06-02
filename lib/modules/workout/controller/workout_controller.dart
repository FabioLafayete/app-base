import 'dart:math';

import 'package:app/modules/workout/controller/workout_state.dart';
import 'package:app/route/my_router.dart';
import 'package:app/route/pages_name.dart';
import 'package:app/shared/model/workout/program_model/program_model.dart';
import 'package:app/shared/model/workout/workout_model/workout_model.dart';
import 'package:app/shared/widgets/base_controller.dart';
import 'package:mobx/mobx.dart';
import 'package:video_player/video_player.dart';

import '../repository/impl/workout_repository_impl.dart';
import '../widgets/list_cards_items.dart';

part 'workout_controller.g.dart';

class WorkoutController = WorkoutControllerBase with _$WorkoutController;

abstract class WorkoutControllerBase extends BaseController with Store {

  WorkoutControllerBase({
    required this.repositoryImpl,
  });

  final WorkoutRepositoryImpl repositoryImpl;

  @observable
  WorkoutState state = const WorkoutState();


  @action
  setState(WorkoutState value) => state = value;

  setShowCountdown(bool value) => state = state.copyWith(
    showCountdown: value,
  );

  setOutWorkout(bool value) => state = state.copyWith(
    showOutWorkout:value,
  );

  setProgramModel(ProgramModel item) => state = state.copyWith(
    programModel: item,
  );

  setCurrentIndexVideo(int item) => state = state.copyWith(
    currentIndexVideo: item,
  );

  setPositionVideo(Duration value) => state = state.copyWith(
    positionVideo:value,
  );

  setVideoPlayerController(VideoPlayerController? value) => state = state.copyWith(
    videoPlayerController: value,
  );


  WorkoutModel? get workoutModel => state.programModel?.workouts[state.currentIndexVideo].video;

  double get percentVideo {

    try{
      if(state.videoPlayerController != null && state.positionVideo != null){
        Duration total = state.videoPlayerController!.value.duration;
        final percentage = (state.positionVideo!.inMilliseconds /
            total.inMilliseconds * 100).truncate();
        return percentage.toDouble() / 100;
      }
      return 0;
    } catch(e){
      print(e);
      return 0;
    }
  }

  Future getWorkouts({bool force = false}) async{
    try{
      if(state.comboProgramModel != null && force == false) {
        return;
      }

      state = state.copyWith(comboProgramModel: null);

      List responses = await Future.wait([
        repositoryImpl.getWorkouts(),
        if(force)
          userController.setInitUser(),
      ]);

      final workouts = responses[0];
      state = state.copyWith(
        comboProgramModel: workouts,
      );

      if(state.topProgram != null){
        return state.topProgram!;
      }

      final item = Random().nextInt(state.comboProgramModel!.length - 1);
      final listItem = state.comboProgramModel![item].targetProgram;
      final item2 = Random().nextInt(listItem.length);

      final program = state.comboProgramModel![item].targetProgram[item2].program!;

      state = state.copyWith(
          topProgram: CardItemModel(
              onPress: () => openVideo(program),
              thumbnail: program.thumbnail,
              description: program.description ?? '',
              timeTraining: program.duration ?? '',
              trainer: program.difficulty
          )
      );

    }catch(e){
      print(e);
    }
  }

  void openVideo (ProgramModel model){
    setProgramModel(model);
    MyRouter().pushNamed(PagesNames.workoutDetail);
  }

}