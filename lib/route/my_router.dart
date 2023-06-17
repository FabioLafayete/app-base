import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MyRouter {

  factory MyRouter() => Modular.get<MyRouter>();

  MyRouter._();

  static MyRouter instance() => MyRouter._();

  Future push(Widget page) =>  Modular.to.push(MaterialPageRoute(builder: (_) => page));
  Future pushNamed(String page, {dynamic arguments}) => Modular.to.pushNamed(page, arguments: arguments);
  Future pushReplacementNamed(String page, {dynamic arguments}) => Modular.to.pushReplacementNamed(page, arguments: arguments);
  Future pushNamedAndRemoveUntil(String page, [RoutePredicate? predicate]) => Modular.to.pushNamedAndRemoveUntil(page, predicate ?? (_) => false);
  Future popAndPushNamed(String page, {dynamic arguments}) => Modular.to.popAndPushNamed(page, arguments: arguments);
  void pop([dynamic result]) => Modular.to.pop(result);
  void popUntil(String routeName) => Modular.to.popUntil((route) => Modular.to.navigateHistory.first.name == routeName);

}