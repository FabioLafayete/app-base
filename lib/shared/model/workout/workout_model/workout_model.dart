import 'package:freezed_annotation/freezed_annotation.dart';

part 'workout_model.freezed.dart';
part 'workout_model.g.dart';

@freezed
class WorkoutModel with _$WorkoutModel {
  const WorkoutModel._();

  const factory WorkoutModel({
    required String id,
    required String title,
    String? description,
    String? duration,
    required String videoUrl,
    String? thumbnail,
    @Default([]) List<String> tags,
    @Default(false) bool alreadySeen,
  }) = _WorkoutModel;

  factory WorkoutModel.fromJson(Map<String, dynamic> json) =>
      _$WorkoutModelFromJson(json);
}
