import '../../model/combo_program_model/combo_program_model.dart';
import '../../service/workout_service.dart';
import '../workout_repository.dart';

class WorkoutRepositoryImpl extends WorkoutRepository{

  WorkoutRepositoryImpl(this.workoutService);

  final WorkoutService workoutService;

  @override
  Future<List<ComboProgramModel>> getWorkouts() async {
    final data = await workoutService.getWorkouts();
    return (data.data as List).map((e) => ComboProgramModel.fromJson(e)).toList();
  }
}