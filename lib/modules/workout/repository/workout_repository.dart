import '../model/combo_program_model/combo_program_model.dart';

abstract class WorkoutRepository {
  Future<List<ComboProgramModel>> getWorkouts();
}