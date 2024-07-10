import 'dart:async';
import 'package:app/service/storage/storage_service.dart';
import 'package:app_links/app_links.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../shared/constants/storage_constants.dart';


StreamSubscription? _sub;

Future<void> initUniLinks() async {
  if(_sub != null) return;

  final secure = Modular.get<SecureStorageService>();

  final appLink = AppLinks();


  Uri? initialLink = await appLink.getInitialLink();

  if(initialLink != null){
    secure.put(StorageConstants.deepLink, initialLink.toString());
  }

  _sub = appLink.uriLinkStream.listen((Uri link) {
    print('LINK AQUI: $link');
    secure.put(StorageConstants.deepLink, link.toString());
  }, onError: (err) {
    print(err);
  });

}