import 'package:dio/dio.dart';

abstract class WorkoutService {
  Future<Response> getWorkouts();
}