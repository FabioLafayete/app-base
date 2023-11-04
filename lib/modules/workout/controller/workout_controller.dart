import 'package:app/shared/model/workout/program_model/program_model.dart';
import 'package:app/shared/model/workout/workout_model/workout_model.dart';
import 'package:chewie/chewie.dart';
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
  ChewieController? chewieController;

  @observable
  VideoPlayerController? videoPlayerController;

  @observable
  Duration? positionVideo;

  @action
  setProgramModel(ProgramModel item) => programModel = item;

  @action
  setCurrentIndexVideo(int item) => currentIndexVideo = item;

  @action
  setPositionVideo(Duration value) => positionVideo = value;

  @action
  setChewieController(ChewieController? value) => chewieController = value;

  @action
  setVideoPlayerController(VideoPlayerController? value) => videoPlayerController = value;


  WorkoutModel? get workoutModel => programModel?.workouts[currentIndexVideo];

}