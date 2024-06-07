import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

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
  }

  void setLocal(LanguageLocal value) {
    if(value == _local.value) return;
    _local.value = value;
  }

  ValueNotifier<LanguageLocal> get local => _local;
  Map<String, dynamic> get tr => _tr[_local.value];
}

enum LanguageLocal {
  pt,
  en
}