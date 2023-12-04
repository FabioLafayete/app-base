import 'package:app/shared/model/workout/program_model/program_model.dart';
import 'package:app/shared/model/workout/workout_model/workout_model.dart';
import 'package:mobx/mobx.dart';
import 'package:video_player/video_player.dart';

part 'workout_controller.g.dart';

class WorkoutController = WorkoutControllerBase with _$WorkoutController;

abstract class WorkoutControllerBase with Store {

  WorkoutControllerBase();

  @observable
  ProgramModel? programModel;

  @observable
  int currentIndexVideo = 0;

  @observable
  VideoPlayerController? videoPlayerController;

  @observable
  Duration? positionVideo;

  @observable
  bool showOutWorkout = false;

  @observable
  bool showCountdown = false;


  @action
  setShowCountdown(bool value) => showCountdown = value;

  @action
  setOutWorkout(bool value) => showOutWorkout = value;

  @action
  setProgramModel(ProgramModel item) => programModel = item;

  @action
  setCurrentIndexVideo(int item) => currentIndexVideo = item;


  @action
  setPositionVideo(Duration value) => positionVideo = value;


  @action
  setVideoPlayerController(VideoPlayerController? value) => videoPlayerController = value;


  WorkoutModel? get workoutModel => programModel?.workouts[currentIndexVideo];

  double get percentVideo {

    try{
      if(videoPlayerController != null && positionVideo != null){
        Duration total = videoPlayerController!.value.duration;
        final percentage = (positionVideo!.inMilliseconds / total.inMilliseconds * 100).truncate();
        return percentage.toDouble() / 100;
      }
      return 0;
    } catch(e){
      print(e);
      return 0;
    }
  }

}