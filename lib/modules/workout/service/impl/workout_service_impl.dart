
import 'package:app/modules/workout/constants/workouts_constants.dart';
import 'package:dio/dio.dart';

import '../../../../service/http/http_service.dart';
import '../workout_service.dart';

class WorkoutServiceImpl implements WorkoutService {

  WorkoutServiceImpl(this._service);

  final HttpService _service;

  @override
  Future<Response> getWorkouts() {
    return _service.request(
        type: RequestType.GET,
        path: WorkoutsConstants.getWorkouts,
    );
  }

}