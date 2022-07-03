import 'package:get/get.dart';
import 'config.dart' show environment;

class AppConfig {

  factory AppConfig() => Get.find<AppConfig>();

  AppConfig._();

  static final AppConfig instance = AppConfig._();

  late String _baseUrl;
  String? _bearerToken;

  final Map<String, dynamic> _config = environment;

  Future load() async {
    _baseUrl = _config['baseUrl'];
  }

  String get baseUrl => _baseUrl;
  String? get bearerToken => _bearerToken;
}