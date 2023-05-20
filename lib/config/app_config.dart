import 'package:app/service/storage/storage_service.dart';
import 'package:app/shared/constants/storage_constants.dart';
import 'package:app/shared/flavor/flavor_types.dart';
import 'package:app/shared/flavor/impl/flavor_impl.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../shared/constants/endpoints.dart';
import '../shared/constants/string_contants.dart';

class AppConfig {

  factory AppConfig() => Modular.get<AppConfig>();

  AppConfig._();

  static final AppConfig instance = AppConfig._();

  late String _baseUrl;
  late FlavorsImpl flavors;
  String? _bearerToken;

  Future load() async {
    flavors = FlavorsImpl();
    flavors.initialize(endpoints);

    _baseUrl = flavors.getEndpoint(StringConstants.hostKey);

    final secure = Modular.get<SecureStorageService>();
    String? bearer = await secure.get(StorageConstants.bearerToken);
    if(bearer != null) {
      _bearerToken = bearer;
    }

    print('Ambiente de ${flavors.getCurrentFlavor() == FlavorType.dev ? 'dev' : 'prod'}');
  }

  Future setBearerToken(String? value) async {
    _bearerToken = value;
    final secure = Modular.get<SecureStorageService>();
    secure.put(StorageConstants.bearerToken, bearerToken);
  }

  String get baseUrl => _baseUrl;
  String? get bearerToken => _bearerToken;
}