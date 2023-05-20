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
    print('Ambiente de ${flavors.getCurrentFlavor() == FlavorType.dev ? 'dev' : 'prod'}');
  }

  setBearerToken(String? value) => _bearerToken = value;

  String get baseUrl => _baseUrl;
  String? get bearerToken => _bearerToken;
}