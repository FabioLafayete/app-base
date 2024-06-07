import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

import '../shared/widgets/restart_app.dart';

class AppLocal {

  factory AppLocal() => GetIt.instance.get<AppLocal>();

  AppLocal._();

  static final AppLocal instance = AppLocal._();

  late Map<LanguageLocal, dynamic> _tr;

  LanguageLocal _local = LanguageLocal.pt;

  Future load() async {
    List response = await Future.wait([
      rootBundle.loadString('assets/languages/pt.json'),
      rootBundle.loadString('assets/languages/en.json')
    ]);

    _tr = {
      LanguageLocal.pt: await json.decode(response[0]),
      LanguageLocal.en: await json.decode(response[1]),
    };
  }

  void setLocal(LanguageLocal value, BuildContext context) {
    if(value == _local) return;
    _local = value;
    RestartWidget.restartApp(context);
  }

  LanguageLocal get local => _local;
  Map<String, dynamic> get tr => _tr[_local];
}

enum LanguageLocal {
  pt,
  en
}