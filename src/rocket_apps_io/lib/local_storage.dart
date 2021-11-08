import 'dart:convert';

import 'dart:io';

import 'package:rocket_apps_io/document.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  Directory? _dir;
  SharedPreferences? _preferences;

  LocalStorage() {
    _instance = this;

    SharedPreferences.getInstance().then((value) => this._preferences = value);
  }

  Future init() async {
    // this._dir = await SpecialDirectory.get(SpecialPath.Library);
    this._preferences = await SharedPreferences.getInstance();
  }

  bool get ready {
    return _preferences != null;
  }

  //static LocalStorage instance;
  static late LocalStorage? _instance;

  static Future<LocalStorage> instance() async {
    if (_instance == null) {
      _instance = LocalStorage();
      await _instance!.init();
    }

    return _instance!;
  }

  dynamic get(String key) {
    if (_preferences == null || !_preferences!.containsKey(key)) {
      return null;
    }

    var x = _preferences!.get(key);
    return jsonDecode(x.toString());

    // return _preferences.get(key);
  }

  Future<bool> set(String key, Object object) async {
    return await _preferences!.setString(key, jsonEncode(object));
  }

  Future<bool> setString(String key, String text) async {
    return await _preferences!.setString(key, text);
  }

  bool exists(String key) {
    return _preferences!.containsKey(key);
  }

  Future<bool> remove(String key) async {
    return await _preferences!.remove(key);
  }

  Future<T?> get2<T>(String key) async {
    var doc = _getDocment(key);

    if (!await doc.exists()) {
      return null;
    }

    var content = await doc.readString();

    return jsonDecode(content) as T;
  }

  Future set2(String key, Object object) async {
    _getDocment(key).writeString(jsonEncode(object));
  }

  Future remove2(String key) {
    return _getDocment(key).delete();
  }

  Future clear() async {
    await _dir!.list(recursive: false).forEach((f) async {
      await f.delete();
    });
  }

  Document _getDocment(String key) {
    return Document(key, directory: _dir);
  }

  Future<bool> exists2(String key) async {
    return await _getDocment(key).exists();
  }
}
