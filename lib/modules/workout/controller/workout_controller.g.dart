// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$WorkoutController on WorkoutControllerBase, Store {
  late final _$stateAtom =
      Atom(name: 'WorkoutControllerBase.state', context: context);

  @override
  WorkoutState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(WorkoutState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$WorkoutControllerBaseActionController =
      ActionController(name: 'WorkoutControllerBase', context: context);

  @override
  dynamic setState(WorkoutState value) {
    final _$actionInfo = _$WorkoutControllerBaseActionController.startAction(
        name: 'WorkoutControllerBase.setState');
    try {
      return super.setState(value);
    } finally {
      _$WorkoutControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state}
    ''';
  }
}
