// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$WorkoutController on WorkoutControllerBase, Store {
  late final _$programModelAtom =
      Atom(name: 'WorkoutControllerBase.programModel', context: context);

  @override
  ProgramModel? get programModel {
    _$programModelAtom.reportRead();
    return super.programModel;
  }

  @override
  set programModel(ProgramModel? value) {
    _$programModelAtom.reportWrite(value, super.programModel, () {
      super.programModel = value;
    });
  }

  late final _$currentIndexVideoAtom =
      Atom(name: 'WorkoutControllerBase.currentIndexVideo', context: context);

  @override
  int get currentIndexVideo {
    _$currentIndexVideoAtom.reportRead();
    return super.currentIndexVideo;
  }

  @override
  set currentIndexVideo(int value) {
    _$currentIndexVideoAtom.reportWrite(value, super.currentIndexVideo, () {
      super.currentIndexVideo = value;
    });
  }

  late final _$chewieControllerAtom =
      Atom(name: 'WorkoutControllerBase.chewieController', context: context);

  @override
  ChewieController? get chewieController {
    _$chewieControllerAtom.reportRead();
    return super.chewieController;
  }

  @override
  set chewieController(ChewieController? value) {
    _$chewieControllerAtom.reportWrite(value, super.chewieController, () {
      super.chewieController = value;
    });
  }

  late final _$videoPlayerControllerAtom = Atom(
      name: 'WorkoutControllerBase.videoPlayerController', context: context);

  @override
  VideoPlayerController? get videoPlayerController {
    _$videoPlayerControllerAtom.reportRead();
    return super.videoPlayerController;
  }

  @override
  set videoPlayerController(VideoPlayerController? value) {
    _$videoPlayerControllerAtom.reportWrite(value, super.videoPlayerController,
        () {
      super.videoPlayerController = value;
    });
  }

  late final _$positionVideoAtom =
      Atom(name: 'WorkoutControllerBase.positionVideo', context: context);

  @override
  Duration? get positionVideo {
    _$positionVideoAtom.reportRead();
    return super.positionVideo;
  }

  @override
  set positionVideo(Duration? value) {
    _$positionVideoAtom.reportWrite(value, super.positionVideo, () {
      super.positionVideo = value;
    });
  }

  late final _$WorkoutControllerBaseActionController =
      ActionController(name: 'WorkoutControllerBase', context: context);

  @override
  dynamic setProgramModel(ProgramModel item) {
    final _$actionInfo = _$WorkoutControllerBaseActionController.startAction(
        name: 'WorkoutControllerBase.setProgramModel');
    try {
      return super.setProgramModel(item);
    } finally {
      _$WorkoutControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCurrentIndexVideo(int item) {
    final _$actionInfo = _$WorkoutControllerBaseActionController.startAction(
        name: 'WorkoutControllerBase.setCurrentIndexVideo');
    try {
      return super.setCurrentIndexVideo(item);
    } finally {
      _$WorkoutControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPositionVideo(Duration value) {
    final _$actionInfo = _$WorkoutControllerBaseActionController.startAction(
        name: 'WorkoutControllerBase.setPositionVideo');
    try {
      return super.setPositionVideo(value);
    } finally {
      _$WorkoutControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setChewieController(ChewieController? value) {
    final _$actionInfo = _$WorkoutControllerBaseActionController.startAction(
        name: 'WorkoutControllerBase.setChewieController');
    try {
      return super.setChewieController(value);
    } finally {
      _$WorkoutControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setVideoPlayerController(VideoPlayerController? value) {
    final _$actionInfo = _$WorkoutControllerBaseActionController.startAction(
        name: 'WorkoutControllerBase.setVideoPlayerController');
    try {
      return super.setVideoPlayerController(value);
    } finally {
      _$WorkoutControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
programModel: ${programModel},
currentIndexVideo: ${currentIndexVideo},
chewieController: ${chewieController},
videoPlayerController: ${videoPlayerController},
positionVideo: ${positionVideo}
    ''';
  }
}
