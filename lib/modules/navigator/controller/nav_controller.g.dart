// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nav_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NavController on NavControllerBase, Store {
  late final _$selectedIndexAtom =
      Atom(name: 'NavControllerBase.selectedIndex', context: context);

  @override
  int get selectedIndex {
    _$selectedIndexAtom.reportRead();
    return super.selectedIndex;
  }

  @override
  set selectedIndex(int value) {
    _$selectedIndexAtom.reportWrite(value, super.selectedIndex, () {
      super.selectedIndex = value;
    });
  }

  late final _$showControlAtom =
      Atom(name: 'NavControllerBase.showControl', context: context);

  @override
  bool get showControl {
    _$showControlAtom.reportRead();
    return super.showControl;
  }

  @override
  set showControl(bool value) {
    _$showControlAtom.reportWrite(value, super.showControl, () {
      super.showControl = value;
    });
  }

  late final _$isFullScreenAtom =
      Atom(name: 'NavControllerBase.isFullScreen', context: context);

  @override
  bool get isFullScreen {
    _$isFullScreenAtom.reportRead();
    return super.isFullScreen;
  }

  @override
  set isFullScreen(bool value) {
    _$isFullScreenAtom.reportWrite(value, super.isFullScreen, () {
      super.isFullScreen = value;
    });
  }

  late final _$showProgressAtom =
      Atom(name: 'NavControllerBase.showProgress', context: context);

  @override
  bool get showProgress {
    _$showProgressAtom.reportRead();
    return super.showProgress;
  }

  @override
  set showProgress(bool value) {
    _$showProgressAtom.reportWrite(value, super.showProgress, () {
      super.showProgress = value;
    });
  }

  late final _$enableMore10SecondsAtom =
      Atom(name: 'NavControllerBase.enableMore10Seconds', context: context);

  @override
  bool get enableMore10Seconds {
    _$enableMore10SecondsAtom.reportRead();
    return super.enableMore10Seconds;
  }

  @override
  set enableMore10Seconds(bool value) {
    _$enableMore10SecondsAtom.reportWrite(value, super.enableMore10Seconds, () {
      super.enableMore10Seconds = value;
    });
  }

  late final _$enableLess10SecondsAtom =
      Atom(name: 'NavControllerBase.enableLess10Seconds', context: context);

  @override
  bool get enableLess10Seconds {
    _$enableLess10SecondsAtom.reportRead();
    return super.enableLess10Seconds;
  }

  @override
  set enableLess10Seconds(bool value) {
    _$enableLess10SecondsAtom.reportWrite(value, super.enableLess10Seconds, () {
      super.enableLess10Seconds = value;
    });
  }

  late final _$percentVideoAtom =
      Atom(name: 'NavControllerBase.percentVideo', context: context);

  @override
  double get percentVideo {
    _$percentVideoAtom.reportRead();
    return super.percentVideo;
  }

  @override
  set percentVideo(double value) {
    _$percentVideoAtom.reportWrite(value, super.percentVideo, () {
      super.percentVideo = value;
    });
  }

  late final _$heightPlayerAtom =
      Atom(name: 'NavControllerBase.heightPlayer', context: context);

  @override
  double? get heightPlayer {
    _$heightPlayerAtom.reportRead();
    return super.heightPlayer;
  }

  @override
  set heightPlayer(double? value) {
    _$heightPlayerAtom.reportWrite(value, super.heightPlayer, () {
      super.heightPlayer = value;
    });
  }

  late final _$positionVideoAtom =
      Atom(name: 'NavControllerBase.positionVideo', context: context);

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

  late final _$videoSelectedAtom =
      Atom(name: 'NavControllerBase.videoSelected', context: context);

  @override
  VideoModel? get videoSelected {
    _$videoSelectedAtom.reportRead();
    return super.videoSelected;
  }

  @override
  set videoSelected(VideoModel? value) {
    _$videoSelectedAtom.reportWrite(value, super.videoSelected, () {
      super.videoSelected = value;
    });
  }

  late final _$chewieControllerAtom =
      Atom(name: 'NavControllerBase.chewieController', context: context);

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

  late final _$videoPlayerControllerAtom =
      Atom(name: 'NavControllerBase.videoPlayerController', context: context);

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

  late final _$setVideoSelectedAsyncAction =
      AsyncAction('NavControllerBase.setVideoSelected', context: context);

  @override
  Future<dynamic> setVideoSelected(VideoModel? value) {
    return _$setVideoSelectedAsyncAction
        .run(() => super.setVideoSelected(value));
  }

  late final _$NavControllerBaseActionController =
      ActionController(name: 'NavControllerBase', context: context);

  @override
  dynamic setSelectedIndex(int value) {
    final _$actionInfo = _$NavControllerBaseActionController.startAction(
        name: 'NavControllerBase.setSelectedIndex');
    try {
      return super.setSelectedIndex(value);
    } finally {
      _$NavControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setShowControl(bool value) {
    final _$actionInfo = _$NavControllerBaseActionController.startAction(
        name: 'NavControllerBase.setShowControl');
    try {
      return super.setShowControl(value);
    } finally {
      _$NavControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setIsFullScreen(bool value) {
    final _$actionInfo = _$NavControllerBaseActionController.startAction(
        name: 'NavControllerBase.setIsFullScreen');
    try {
      return super.setIsFullScreen(value);
    } finally {
      _$NavControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setShowProgress(bool value) {
    final _$actionInfo = _$NavControllerBaseActionController.startAction(
        name: 'NavControllerBase.setShowProgress');
    try {
      return super.setShowProgress(value);
    } finally {
      _$NavControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setEnableMore10Seconds(bool value) {
    final _$actionInfo = _$NavControllerBaseActionController.startAction(
        name: 'NavControllerBase.setEnableMore10Seconds');
    try {
      return super.setEnableMore10Seconds(value);
    } finally {
      _$NavControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setEnableLess10Seconds(bool value) {
    final _$actionInfo = _$NavControllerBaseActionController.startAction(
        name: 'NavControllerBase.setEnableLess10Seconds');
    try {
      return super.setEnableLess10Seconds(value);
    } finally {
      _$NavControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPercentVideo(double value) {
    final _$actionInfo = _$NavControllerBaseActionController.startAction(
        name: 'NavControllerBase.setPercentVideo');
    try {
      return super.setPercentVideo(value);
    } finally {
      _$NavControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setHeightPlayer(double? value) {
    final _$actionInfo = _$NavControllerBaseActionController.startAction(
        name: 'NavControllerBase.setHeightPlayer');
    try {
      return super.setHeightPlayer(value);
    } finally {
      _$NavControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPositionVideo(Duration value) {
    final _$actionInfo = _$NavControllerBaseActionController.startAction(
        name: 'NavControllerBase.setPositionVideo');
    try {
      return super.setPositionVideo(value);
    } finally {
      _$NavControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setChewieController(ChewieController? value) {
    final _$actionInfo = _$NavControllerBaseActionController.startAction(
        name: 'NavControllerBase.setChewieController');
    try {
      return super.setChewieController(value);
    } finally {
      _$NavControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setVideoPlayerController(VideoPlayerController? value) {
    final _$actionInfo = _$NavControllerBaseActionController.startAction(
        name: 'NavControllerBase.setVideoPlayerController');
    try {
      return super.setVideoPlayerController(value);
    } finally {
      _$NavControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedIndex: ${selectedIndex},
showControl: ${showControl},
isFullScreen: ${isFullScreen},
showProgress: ${showProgress},
enableMore10Seconds: ${enableMore10Seconds},
enableLess10Seconds: ${enableLess10Seconds},
percentVideo: ${percentVideo},
heightPlayer: ${heightPlayer},
positionVideo: ${positionVideo},
videoSelected: ${videoSelected},
chewieController: ${chewieController},
videoPlayerController: ${videoPlayerController}
    ''';
  }
}
