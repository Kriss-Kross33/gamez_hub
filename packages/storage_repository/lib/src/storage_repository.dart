import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// {@template secure_storage}
///
/// {@endtemplate}
class StorageRepository {
  final FlutterSecureStorage _storage;
  StorageRepository({required FlutterSecureStorage storage})
      : _storage = storage;

  Future<void> write({required String key, required String? value}) async {
    await _storage.write(key: key, value: value);
  }

  Future<String?> read({required String key}) async {
    return _storage.read(key: key);
  }

  Future<void> delete({required String key, required String? value}) async {
    await _storage.delete(key: key);
  }

  Future<void> deleteAll({required String key, required String? value}) async {
    await _storage.deleteAll();
  }
}
