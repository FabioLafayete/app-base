import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MyRouterController {
  MyRouterController();
  Future pushNamed(String page, {dynamic payload}) => Modular.to.pushNamed(page, arguments: payload);
  Future push(Widget page) => Modular.to.push(MaterialPageRoute(builder: (_) => page));
  Future pushReplacementNamed(String page, {dynamic payload}) => Modular.to.pushReplacementNamed(page, arguments: payload);
  Future pushNamedAndRemoveUntil(String page, [RoutePredicate? predicate]) => Modular.to.pushNamedAndRemoveUntil(page, predicate ?? (_) => false);
  Future popAndPushNamed(String page, {dynamic payload}) => Modular.to.popAndPushNamed(page, arguments: payload);
  void pop(dynamic result) => Modular.to.pop(result);
  void popUntil(String routeName) => Modular.to.popUntil((route) => Modular.to.navigateHistory.first.name == routeName);
}
