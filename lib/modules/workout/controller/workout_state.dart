import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:video_player/video_player.dart';

import '../../../shared/model/workout/program_model/program_model.dart';
import '../model/combo_program_model/combo_program_model.dart';
import '../widgets/list_cards_items.dart';

part 'workout_state.freezed.dart';

@freezed
class WorkoutState with _$WorkoutState {
  const WorkoutState._();

  const factory WorkoutState({
    List<ComboProgramModel>? comboProgramModel,
    @Default(0) int currentIndexVideo,
    VideoPlayerController? videoPlayerController,
    Duration? positionVideo,
    @Default(false) bool showOutWorkout,
    @Default(false) bool showCountdown,
    CardItemModel? topProgram,
    ProgramModel? programModel,
  }) = _WorkoutState;
}
