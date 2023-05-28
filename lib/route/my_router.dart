import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MyRouter {

  factory MyRouter() => Modular.get<MyRouter>();

  dynamic routeControl;

  MyRouter._({this.routeControl});

  static MyRouter instance({routeControl}) => MyRouter._(routeControl: routeControl);

  Future push(Widget page) => routeControl.push(page);
  Future pushNamed(String page, {dynamic payload}) => routeControl.pushNamed(page, payload: payload);
  Future pushReplacementNamed(String page, {dynamic payload}) => routeControl.pushReplacementNamed(page, payload: payload);
  Future pushNamedAndRemoveUntil(String page, [RoutePredicate? predicate]) => routeControl.pushNamedAndRemoveUntil(page, predicate);
  Future popAndPushNamed(String page, {dynamic payload}) => routeControl.popAndPushNamed(page, payload: payload);
  void pop([dynamic result]) => routeControl.pop(result);
  void popUntil(String routeName) => routeControl.popUntil(routeName);

}