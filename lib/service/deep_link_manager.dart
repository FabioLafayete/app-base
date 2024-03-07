import 'dart:async';

import 'package:uni_links/uni_links.dart';

StreamSubscription? _sub;

Future<void> initUniLinks() async {
  if(_sub != null) return;

  _sub = uriLinkStream.listen((Uri? link) {
    print('LINK AQUI: $link');
  }, onError: (err) {
    print(err);
  });

}