import 'dart:io' as IO;

import 'package:rocket_apps_flutter/io/special_directory.dart';

class File {
  //exists
  static Future<bool> existsInSpecialDirectory(
      SpecialPath directory, String path) async {
    var dir = await SpecialDirectory.get(directory);
    return existsInDirectory(dir!, path);
  }

  static Future<bool> existsInDirectory(IO.Directory directory, String path) {
    var file = get('${directory.path}/$path');
    return file.exists();
  }

  static Future<bool> exists(String path) {
    return get(path).exists();
  }

  //save
  static Future<IO.File> saveStringInSpecialDirectory(
      SpecialPath directory, String path, String content) async {
    var dir = await SpecialDirectory.get(directory);

    return saveStringInDirectory(dir!, path, content);
  }

  static Future<IO.File> saveStringInDirectory(
      IO.Directory directory, String path, String content) async {
    return saveString("${directory.path}/$path", content);
  }

  static Future<IO.File> saveString(String path, String content) async {
    return get(path).writeAsString(content);
  }

  static Future<IO.File> saveBytesInSpecialDirectory(
      SpecialPath directory, String path, List<int> content) async {
    var dir = await SpecialDirectory.get(directory);

    return saveBytesInDirectory(dir!, path, content);
  }

  static Future<IO.File> saveBytesInDirectory(
      IO.Directory directory, String path, List<int> content) async {
    return saveBytes("${directory.path}/$path", content);
  }

  static Future<IO.File> saveBytes(String path, List<int> content) async {
    return get(path).writeAsBytes(content);
  }

//read
  static Future<String> readStringFromSpecialDirectory(
      SpecialPath directory, String path) async {
    var dir = await SpecialDirectory.get(directory);

    return readStringFromDirectory(dir!, path);
  }

  static Future<String> readStringFromDirectory(
      IO.Directory directory, String path) {
    return readString("${directory.path}/$path");
  }

  static Future<String> readString(String path) {
    return get(path).readAsString();
  }

//get
  static Future<IO.File> getFromSpecialDirectory(
      SpecialPath directory, String path) async {
    var dir = await SpecialDirectory.get(directory);
    return getFromDirectory(dir!, path);
  }

  static Future<IO.File> getFromDirectory(
      IO.Directory directory, String path) async {
    return get("${directory.path}/$path");
  }

  static IO.File get(String path) {
    return IO.File(path);
  }
}
