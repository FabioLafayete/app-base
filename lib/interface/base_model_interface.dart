import 'package:flutter/material.dart';

abstract class BaseModelInterface {
  BaseModelInterface();

  BaseModelInterface fromJson(Map<String, dynamic> json);

  fromJsonArray(List<dynamic> list);

  Map<String, dynamic> toJson();
}
