import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../shared/model/workout/program_model/program_model.dart';

part 'combo_program_model.freezed.dart';
part 'combo_program_model.g.dart';

@freezed
class ComboProgramModel with _$ComboProgramModel {
  const ComboProgramModel._();

  const factory ComboProgramModel({
    required String id,
    required String name,
    @Default([]) List<TargetProgram> targetProgram,
  }) = _ComboProgramModel;

  factory ComboProgramModel.fromJson(Map<String, dynamic> json) =>
      _$ComboProgramModelFromJson(json);
}

@freezed
class TargetProgram with _$TargetProgram {
  const factory TargetProgram({
    ProgramModel? program,
  }) = _TargetProgram;

  factory TargetProgram.fromJson(Map<String, dynamic> json) => _$TargetProgramFromJson(json);
}