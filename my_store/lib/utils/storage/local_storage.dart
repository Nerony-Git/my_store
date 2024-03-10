import 'package:get_storage/get_storage.dart';

class MyLocalStorage {
  static final MyLocalStorage _instance = MyLocalStorage._internal();

  factory MyLocalStorage() {
    return _instance;
  }

  MyLocalStorage._internal();

  final _storage = GetStorage();

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
