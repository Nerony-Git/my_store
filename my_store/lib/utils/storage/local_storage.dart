import 'package:get_storage/get_storage.dart';

class MyLocalStorage {
  late final GetStorage _storage;

  // Singleton instance
  static MyLocalStorage? _instance;

  MyLocalStorage._internal();

  factory MyLocalStorage.instance() {
    _instance ??= MyLocalStorage._internal();
    return _instance!;
  }

  static Future<void> init(String bucketName) async {
    await GetStorage.init(bucketName);
    _instance = MyLocalStorage._internal();
    _instance!._storage = GetStorage(bucketName);
  }

  // Generic method to save data
  Future<void> saveData<My>(String key, My value) async {
    await _storage.write(key, value);
  }

  // Generic method to read data
  My? readData<My>(String key) {
    return _storage.read<My>(key);
  }

  // Generic method to remove data
  Future<void> removeData(String key) async {
    await _storage.remove(key);
  }

  // Clear all data in storage
  Future<void> clearAll() async {
    await _storage.erase();
  }
}
