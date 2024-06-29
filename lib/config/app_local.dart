import 'dart:convert';
import 'dart:io';
import 'package:app/service/storage/storage_service.dart';
import 'package:app/shared/constants/storage_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

import '../util/async_mutex.dart';

class AppLocal {
  factory AppLocal() => GetIt.instance.get<AppLocal>();

  AppLocal._();

  static final AppLocal instance = AppLocal._();

  late Map<LanguageLocal, dynamic> _tr;

  final ValueNotifier<LanguageLocal> _local = ValueNotifier(LanguageLocal.pt);


  Future load() async {
    List response = await Future.wait([
      rootBundle.loadString('assets/languages/pt.json'),
      rootBundle.loadString('assets/languages/en.json')
    ]);

    _tr = {
      LanguageLocal.pt: await json.decode(response[0]),
      LanguageLocal.en: await json.decode(response[1]),
    };

    String? languagePreferences = await get(StorageConstants.language);

    if (languagePreferences != null) {
      if(LanguageLocal.values.where((e) => e.toString() == languagePreferences).isNotEmpty){
        _local.value = LanguageLocal.values.firstWhere(
              (e) => e.toString() == languagePreferences,
        );
      }
    } else {
      if (Platform.localeName == 'pt_BR') {
        _local.value = LanguageLocal.pt;
      } else {
        _local.value = LanguageLocal.en;
      }
    }
  }

  void setLocal(LanguageLocal value) {
    if (value == _local.value) return;
    put(StorageConstants.language, value.toString());
    _local.value = value;
  }

  ValueNotifier<LanguageLocal> get local => _local;
  Map<String, dynamic> get tr => _tr[_local.value];
}

enum LanguageLocal { pt, en }

final _mutex = AsyncMutex();

FlutterSecureStorage storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(
        encryptedSharedPreferences: true
    ),
    iOptions: IOSOptions(
        accessibility: KeychainAccessibility.first_unlock
    )
);

Future<String?> get(String key) async {
  String? value;
  try {
    await _mutex.lock();
    value = await storage.read(key: key);
  } finally {
    _mutex.unlock();
  }
  return value;
}

Future put(String key, String? value) async {
  try {
    await _mutex.lock();
    await storage.write(key: key, value: value);
  } finally {
    _mutex.unlock();
  }
}
