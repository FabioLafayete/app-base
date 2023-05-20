import 'package:app/modules/login/binding/login_bindings.dart';
import 'package:app/modules/login/page/login_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginModule extends Module {
  @override
  List<Bind> get binds => [
    Bind.factory((i) => LoginBindings())
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(
        '/',
        child: (context, args) => LoginPage()
    ),
  ];
}