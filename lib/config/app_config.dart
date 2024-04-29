import 'package:app/service/deep_link_manager.dart';
import 'package:app/service/storage/storage_service.dart';
import 'package:app/shared/constants/storage_constants.dart';
import 'package:app/shared/flavor/flavor_types.dart';
import 'package:app/shared/flavor/impl/flavor_impl.dart';
import 'package:app/shared/model/auth_model/auth_model.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../shared/constants/endpoints.dart';
import '../shared/constants/string_contants.dart';
import '../shared/modules/user/controller/user_controller.dart';

class AppConfig {

  factory AppConfig() => Modular.get<AppConfig>();

  AppConfig._();

  static final AppConfig instance = AppConfig._();

  String? _baseUrl;
  FlavorsImpl? flavors;
  String? _bearerToken;


  Future load() async {
    /// FLAVORS
    flavors = FlavorsImpl();
    flavors?.initialize(endpoints);
    _baseUrl = flavors?.getEndpoint(StringConstants.hostKey);

    /// BEARER TOKEN
    final secure = Modular.get<SecureStorageService>();
    String? bearer = await secure.get(StorageConstants.bearerToken);

    if(bearer != null) {
      _bearerToken = bearer;
    }

    if(_bearerToken != null) {
      /// INIT-USER
      UserController controller = Modular.get<UserController>();
      await controller.setInitUser().catchError((e){
        _bearerToken = null;
      });
    }

    initUniLinks();

    print('Ambiente de ${flavors?.getCurrentFlavor() == FlavorType.dev ? 'dev'
        : flavors?.getCurrentFlavor() == FlavorType.local ? 'local'
        :  'prod'}'
    );
  }

  Future setBearerToken(AuthModel value) async {
    _bearerToken = value.token;
    final secure = Modular.get<SecureStorageService>();
    secure.put(StorageConstants.bearerToken, bearerToken);

    UserController controller = Modular.get<UserController>();
    await controller.setInitUser(userModel: value.user);
  }

  String get baseUrl => _baseUrl ?? '';
  String? get bearerToken => _bearerToken;
}