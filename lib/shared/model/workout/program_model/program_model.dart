import 'package:app/shared/model/workout/workout_model/workout_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'program_model.freezed.dart';
part 'program_model.g.dart';

@freezed
class ProgramModel with _$ProgramModel {
  const ProgramModel._();

  const factory ProgramModel({
    required String id,
    required String title,
    String? description,
    String? difficulty,
    String? duration,
    @Default(0) int kcal,
    int? rate,
    required String thumbnail,
    @Default([]) List<String> tags,
    @Default([]) List<WorkoutModel> workouts,
    @Default(false) bool alreadySeen,
  }) = _ProgramModel;

  factory ProgramModel.fromJson(Map<String, dynamic> json) =>
      _$ProgramModelFromJson(json);
}
