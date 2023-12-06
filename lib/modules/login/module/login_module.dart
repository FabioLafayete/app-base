import 'package:app/modules/login/controller/login_controller.dart';
import 'package:app/modules/login/page/login_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../service/http/http_service.dart';
import '../repository/impl/login_repository_impl.dart';
import '../service/impl/login_service_impl.dart';

class LoginModule extends Module {
  @override
  void binds(i) {
    i.add(() => LoginController(
      repositoryImpl: LoginRepositoryImpl(
          LoginServiceImpl(HttpService()),
        ),
    ));
  }

  @override
  void routes(r) {
    r.child(
        '/',
        child: (context) => LoginPage()
    );
  }
}