import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../util/async_mutex.dart';

class SecureStorageService {
  SecureStorageService._();

  static final SecureStorageService instance = SecureStorageService._();

  final FlutterSecureStorage storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true
    ),
    iOptions: IOSOptions(
      accessibility: KeychainAccessibility.first_unlock
    )
  );

  static final _mutex = AsyncMutex();

  Future clearAll() async => await storage.deleteAll();

  Future delete(String key) => storage.delete(key: key);

  Future<String?> get(String key) async {
    String? value;
    try {
      await _mutex.lock();
      value = await storage.read(key: key);
    } finally {
      _mutex.unlock();
    }
    return value;
  }

  Future put(String key, String? value) async {
    try {
      await _mutex.lock();
      await storage.write(key: key, value: value);
    } finally {
      _mutex.unlock();
    }
  }
}