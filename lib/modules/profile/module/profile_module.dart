import 'package:app/modules/navigator/controller/nav_controller.dart';
import 'package:app/modules/navigator/page/nav_page.dart';
import 'package:app/modules/profile/page/congrats_page.dart';
import 'package:app/modules/profile/page/help_page.dart';
import 'package:app/modules/profile/view/profile_data_view.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProfileModule extends Module {
  @override
  void routes(r) {
    r.child(
        '/',
        child: (context) {
          Modular.get<NavController>().setPageSelected(2);
          return const NavPage();
        }
    );
    r.child(
        '/data',
        child: (context) => const ProfileDataView()
    );
    r.child(
        '/help',
        child: (context) => const HelpPage()
    );
    r.child(
      '/help/congrats',
      child: (context) =>  const CongratsPage(),
    );
  }
}