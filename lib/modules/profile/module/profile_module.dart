import 'package:app/modules/navigator/page/nav_page.dart';
import 'package:app/modules/profile/page/help_page.dart';
import 'package:app/modules/profile/view/profile_data_view.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProfileModule extends Module {
  @override
  List<ModularRoute> get routes => [
    ChildRoute(
        '/',
        child: (context, args) => NavPage(index: 4)
    ),
    ChildRoute(
        '/data',
        child: (context, args) => ProfileDataView()
    ),
    ChildRoute(
        '/help',
        child: (context, args) => HelpPage()
    ),
  ];
}