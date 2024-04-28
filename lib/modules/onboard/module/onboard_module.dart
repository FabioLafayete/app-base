import 'package:app/modules/onboard/page/onboard_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../controller/onboard_controller.dart';

class OnboardModule extends Module {
  @override
  void binds(i) {
    i.addSingleton(() => OnboardController());
  }

  @override
  void routes(r) {
    r.child(
        '/',
        child: (context) => OnboardPage()
    );
  }
}