import 'package:app/modules/navigator/page/nav_page.dart';
import 'package:app/modules/workout/page/workout_detail_page.dart';
import 'package:app/shared/model/workout/program_model/program_model.dart';
import 'package:flutter_modular/flutter_modular.dart';

class WorkoutModule extends Module {
  @override
  List<ModularRoute> get routes => [
    ChildRoute(
        '/',
        child: (context, args) => NavPage(index: 2)
    ),
    ChildRoute(
        '/detail',
        child: (context, args){
          ProgramModel model = args.data;
          return WorkoutDetailPage(
            model: model,
          );
        }
    ),
  ];
}