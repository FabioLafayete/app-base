import 'dart:convert';
import 'dart:io';
import 'package:app/modules/workout/controller/workout_controller.dart';
import 'package:app/service/storage/storage_service.dart';
import 'package:app/shared/constants/storage_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get_it/get_it.dart';

class AppLocal {
  factory AppLocal() => GetIt.instance.get<AppLocal>();

  AppLocal._();

  static final AppLocal instance = AppLocal._();

  late Map<LanguageLocal, dynamic> _tr;

  final ValueNotifier<LanguageLocal> _local = ValueNotifier(LanguageLocal.pt);

  late SecureStorageService secure;

  Future load() async {
    List response = await Future.wait([
      rootBundle.loadString('assets/languages/pt.json'),
      rootBundle.loadString('assets/languages/en.json')
    ]);

    _tr = {
      LanguageLocal.pt: await json.decode(response[0]),
      LanguageLocal.en: await json.decode(response[1]),
    };

    if (Platform.localeName == 'pt_BR') {
      _local.value = LanguageLocal.pt;
    } else {
      _local.value = LanguageLocal.en;
    }
  }

  Future loadTranslation() async {
    secure = SecureStorageService();
    String? languagePreferences = await secure.get(StorageConstants.language);

    if (languagePreferences != null) {
      if (LanguageLocal.values
          .where((e) => e.toString() == languagePreferences)
          .isNotEmpty) {
        _local.value = LanguageLocal.values.firstWhere(
              (e) => e.toString() == languagePreferences,
        );
      }
    }
  }

  void setLocal(LanguageLocal value) {
    if (value == _local.value) return;
    secure.put(StorageConstants.language, value.toString());
    _local.value = value;
    Modular.get<WorkoutController>().getWorkouts(force: true);
  }

  ValueNotifier<LanguageLocal> get local => _local;
  Map<String, dynamic> get tr => _tr[_local.value];
}

enum LanguageLocal { pt, en }
