import 'package:app/modules/splash/page/splash_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashModule extends Module {
  @override
  void routes(r) {
    r.child(
        '/',
        child: (context) => const SplashPage()
    );
  }
}