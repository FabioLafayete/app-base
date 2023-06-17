import 'package:flutter_modular/flutter_modular.dart';
import '../../navigator/page/nav_page.dart';

class HomeModule extends Module {
  @override
  List<ModularRoute> get routes => [
    ChildRoute(
        '/',
        child: (context, args) => NavPage(index: 0)
    ),
  ];
}