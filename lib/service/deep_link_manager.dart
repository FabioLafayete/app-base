import 'dart:async';

import 'package:app_links/app_links.dart';


StreamSubscription? _sub;

Future<void> initUniLinks() async {
  if(_sub != null) return;
  final appLink = AppLinks();
  _sub = appLink.uriLinkStream.listen((Uri link) {
    print('LINK AQUI: $link');
  }, onError: (err) {
    print(err);
  });

}