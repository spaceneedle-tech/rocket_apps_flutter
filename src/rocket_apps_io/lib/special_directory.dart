//on top of class PathProviderPlatform from path_provider_platform_interface.dart
import 'dart:io' as IO;
import 'package:path_provider/path_provider.dart';
import 'package:rocket_apps_io/file.dart';

enum SpecialPath {
  Temp, // getTemporaryPath() Path to the temporary directory on the device that is not backed up and is suitable for storing caches of downloaded files.
  Support, // getApplicationSupportPath() Path to a directory where the application may place application support files
  Library, // getLibraryPath() Path to the directory where application can store files that are persistent, backed up, and not visible to the user, such as sqlite.db.
  Documents, // getApplicationDocumentsPath() Path to a directory where the application may place data that is user-generated, or that cannot otherwise be recreated by your application.
  ExternalStorage, // getExternalStoragePath() Path to a directory where the application may access top level storage. The current operating system should be determined before issuing this function call, as this functionality is only available on Android.
  //ExternalCaches, // getExternalCachePaths() Paths to directories where application specific external cache data can be stored. These paths typically reside on external storage like separate partitions or SD cards. Phones may have multiple storage directories available.
  // ExternalStorages, // getExternalStoragePaths() Paths to directories where application specific data can be stored. These paths typically reside on external storage like separate partitions or SD cards. Phones may have multiple storage directories available.
  Downloads, // getDownloadsPath() Path to the directory where downloaded files can be stored. This is typically only relevant on desktop operating systems.
}

class SpecialDirectory {
  late IO.Directory dir;

  Future<bool> hasDocument(String path) {
    return File.existsInDirectory(dir, path);
  }

  Future<IO.File> saveString(String path, String content) {
    return File.saveStringInDirectory(dir, path, content);
  }

  Future<IO.File> saveBytes(String path, List<int> content) {
    return File.saveBytesInDirectory(dir, path, content);
  }

  static Future<IO.Directory?>? get(SpecialPath specialDirectory) {
    switch (specialDirectory) {
      case SpecialPath.Temp:
        return getTemporaryDirectory();
      case SpecialPath.Support:
        return getApplicationSupportDirectory();

      case SpecialPath.Library:
        return getLibraryDirectory();

      case SpecialPath.Documents:
        return getApplicationDocumentsDirectory();

      case SpecialPath.ExternalStorage:
        return getExternalStorageDirectory();

      case SpecialPath.Downloads:
        return getDownloadsDirectory();

      case SpecialPath.Temp:
        return getTemporaryDirectory();
      default:
    }

    return null;
  }
}
