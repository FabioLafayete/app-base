import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FirebaseRemoteConfigService {

  factory FirebaseRemoteConfigService() => Modular.get<FirebaseRemoteConfigService>();

  FirebaseRemoteConfigService._();

  static final FirebaseRemoteConfigService instance = FirebaseRemoteConfigService._();

  late FirebaseRemoteConfig _remoteConfig;

  String getString(String key) => _remoteConfig.getString(key);
  bool getBool(String key) =>_remoteConfig.getBool(key);
  int getInt(String key) =>_remoteConfig.getInt(key);
  double getDouble(String key) =>_remoteConfig.getDouble(key);

  Future init() async {
    _remoteConfig = FirebaseRemoteConfig.instance;
    await _remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(seconds: 30),
      minimumFetchInterval: const Duration(minutes: 5), 
    ));
    await _remoteConfig.fetchAndActivate();
  }

  bool get isMaintenance => _remoteConfig.getBool('manutencao');
}