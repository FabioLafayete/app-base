import 'package:app/shared/flavor/impl/flavor_impl.dart';
import 'package:get/get.dart';
import '../shared/constants/endpoints.dart';
import '../shared/constants/string_contants.dart';

class AppConfig {

  factory AppConfig() => Get.find<AppConfig>();

  AppConfig._();

  static final AppConfig instance = AppConfig._();

  late String _baseUrl;
  late FlavorsImpl flavors;
  String? _bearerToken;

  Future load() async {
    flavors = FlavorsImpl();
    flavors.initialize(endpoints);
    _baseUrl = flavors.getEndpoint(StringConstants.hostKey);
    print('Ambiente de ${flavors.getCurrentFlavor()}');
    print(_baseUrl);
  }

  setBearerToken(String? value) => _bearerToken = value;

  String get baseUrl => _baseUrl;
  String? get bearerToken => _bearerToken;
}